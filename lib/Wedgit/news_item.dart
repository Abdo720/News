import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/Core/Colors.dart';
import 'package:news/models/news_respons.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsItem extends StatelessWidget {
  final Articles article;
  final bool isSelected;
  final VoidCallback onTap;

  const NewsItem({
    super.key,
    required this.article,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedCrossFade(
        firstChild: _buildNormalCard(context),
        secondChild: _buildSelectedCard(context),
        crossFadeState: isSelected
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 250),
      ),
    );
  }

  Widget _buildNormalCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 345,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: Theme.of(context).splashColor),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? "",
              placeholder: (context, url) => SizedBox(
                height: 252,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).splashColor,
                  ),
                ),
              ),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, color: Theme.of(context).splashColor),
              height: 252,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            article.title ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Theme.of(context).splashColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  article.author == null ? "" : "by : ${article.author}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).splashColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  (article.publishedAt ?? "").length >= 10
                      ? article.publishedAt!.substring(0, 10)
                      : (article.publishedAt ?? ""),
                  textAlign: TextAlign.end,
                  maxLines: 1,
                  style: TextStyle(
                    color: Theme.of(context).splashColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).splashColor,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? "",
              placeholder: (context, url) => const SizedBox(
                height: 180,
                child: Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            article.title ?? "",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            article.description ?? "",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri.parse(article.url ?? "");
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    print("Cannot launch URL");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  'View Full Article',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: .w700,
                    color: Theme.of(context).splashColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
