import 'package:flutter/material.dart';
import 'package:test_tehnical/view/component/list_item_article.dart';

import '../model/article_model.dart';
import '../service/article_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ApiService apiService = ApiService();

  final List<Article> articles = [];

  bool isLoading = false;

  final int limit = 10;
  int page = 0;

  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  Future<void> _fetchArticles() async {
    setState(() => isLoading = true);
    try {
      final article = await apiService.fetchArticles(start: page * limit, limit: limit);
      if (mounted) {
        setState(() {
          articles.addAll(article);
          page++;
        });
      }
    } catch (e) {
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } finally {
      if(mounted){
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Artikel')),
      body: Column(
        children: [
          Expanded(
            child: articles.isEmpty
                ? const Center(child: Text('No Articles Found'))
                : ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return ListItemArticle(article: articles[index]);
              },
            ),
          ),
          if (isLoading) const CircularProgressIndicator(),
          ElevatedButton(
            onPressed: isLoading ? null : _fetchArticles,
            child: const Text('Load More'),
          ),
        ],
      ),
    );
  }
}
