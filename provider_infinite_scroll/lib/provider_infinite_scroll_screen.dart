import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_infinite_scroll/ajax_provider.dart';

class ProviderInfiniteScrollScreen extends StatefulWidget {
  @override
  _ProviderInfiniteScrollScreenState createState() =>
      _ProviderInfiniteScrollScreenState();
}

class _ProviderInfiniteScrollScreenState
    extends State<ProviderInfiniteScrollScreen> {
  @override
  void initState() {
    Future.microtask(() {
      Provider.of<AjaxProvider>(context, listen: false).fetchItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Infinite Scroll'),
      ),
      body: _renderListView(),
    );
  }

  _renderListView() {
    final provider = Provider.of<AjaxProvider>(context);
    final cache = provider.cache;
    final loading = provider.loading;

    if (loading && cache.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    if (!loading && cache.length == 0) {
      return Center(
        child: Text('No data'),
      );
    }

    return ListView.builder(
      itemCount: cache.length + 1,
      itemBuilder: (context, index) {
        if (index < cache.length) {
          return ListTile(
            title: Text(
              cache[index].toString(),
            ),
          );
        }

        if (!provider.loading && provider.hasMore) {
          Future.microtask(() {
            provider.fetchItems(nextId: index);
          });
        }

        if (provider.hasMore) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Text('No more data'),
          );
        }
      },
    );
  }
}
