import 'dart:convert';

import 'package:equatable/equatable.dart';

class GifModel extends Equatable {
  final String type;
  final String id;
  final String url;
  final String slug;
  final String bitlyGifUrl;
  final String bitlyUrl;
  final String embedUrl;
  final String username;
  final String source;
  final String title;
  final String rating;
  final String contentUrl;
  final String sourceTld;
  final String sourcePostUrl;
  final int isSticker;
  final DateTime importDatetime;
  final DateTime trendingDatetime;
  final Images images;
  final User? user;
  final String analyticsResponsePayload;
  final Analytics analytics;

  const GifModel({
    required this.type,
    required this.id,
    required this.url,
    required this.slug,
    required this.bitlyGifUrl,
    required this.bitlyUrl,
    required this.embedUrl,
    required this.username,
    required this.source,
    required this.title,
    required this.rating,
    required this.contentUrl,
    required this.sourceTld,
    required this.sourcePostUrl,
    required this.isSticker,
    required this.importDatetime,
    required this.trendingDatetime,
    required this.images,
    required this.user,
    required this.analyticsResponsePayload,
    required this.analytics,
  });

  GifModel copyWith({
    String? type,
    String? id,
    String? url,
    String? slug,
    String? bitlyGifUrl,
    String? bitlyUrl,
    String? embedUrl,
    String? username,
    String? source,
    String? title,
    String? rating,
    String? contentUrl,
    String? sourceTld,
    String? sourcePostUrl,
    int? isSticker,
    DateTime? importDatetime,
    DateTime? trendingDatetime,
    Images? images,
    User? user,
    String? analyticsResponsePayload,
    Analytics? analytics,
  }) {
    return GifModel(
      type: type ?? this.type,
      id: id ?? this.id,
      url: url ?? this.url,
      slug: slug ?? this.slug,
      bitlyGifUrl: bitlyGifUrl ?? this.bitlyGifUrl,
      bitlyUrl: bitlyUrl ?? this.bitlyUrl,
      embedUrl: embedUrl ?? this.embedUrl,
      username: username ?? this.username,
      source: source ?? this.source,
      title: title ?? this.title,
      rating: rating ?? this.rating,
      contentUrl: contentUrl ?? this.contentUrl,
      sourceTld: sourceTld ?? this.sourceTld,
      sourcePostUrl: sourcePostUrl ?? this.sourcePostUrl,
      isSticker: isSticker ?? this.isSticker,
      importDatetime: importDatetime ?? this.importDatetime,
      trendingDatetime: trendingDatetime ?? this.trendingDatetime,
      images: images ?? this.images,
      user: user ?? this.user,
      analyticsResponsePayload: analyticsResponsePayload ?? this.analyticsResponsePayload,
      analytics: analytics ?? this.analytics,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'id': id,
      'url': url,
      'slug': slug,
      'bitly_gif_url': bitlyGifUrl,
      'bitly_url': bitlyUrl,
      'embed_url': embedUrl,
      'username': username,
      'source': source,
      'title': title,
      'rating': rating,
      'content_url': contentUrl,
      'source_tld': sourceTld,
      'source_post_url': sourcePostUrl,
      'is_sticker': isSticker,
      'import_datetime': importDatetime.millisecondsSinceEpoch,
      'trending_datetime': trendingDatetime.millisecondsSinceEpoch,
      'images': images.toMap(),
      'user': user?.toMap(),
      'analytics_response_payload': analyticsResponsePayload,
      'analytics': analytics.toMap(),
    };
  }

  factory GifModel.fromMap(Map<String, dynamic> map) {
    return GifModel(
      type: map['type'] ?? '',
      id: map['id'] ?? '',
      url: map['url'] ?? '',
      slug: map['slug'] ?? '',
      bitlyGifUrl: map['bitly_gif_url'] ?? '',
      bitlyUrl: map['bitly_url'] ?? '',
      embedUrl: map['embed_url'] ?? '',
      username: map['username'] ?? '',
      source: map['source'] ?? '',
      title: map['title'] ?? '',
      rating: map['rating'] ?? '',
      contentUrl: map['content_url'] ?? '',
      sourceTld: map['source_tld'] ?? '',
      sourcePostUrl: map['source_post_url'] ?? '',
      isSticker: map['is_sticker'] ?? 0,
      importDatetime: DateTime.parse(map['import_datetime']),
      trendingDatetime: DateTime.parse(map['trending_datetime']),
      images: Images.fromMap(map['images']),
      user: map['user'] != null ? User.fromMap(map['user']) : null,
      analyticsResponsePayload: map['analytics_response_payload'] ?? '',
      analytics: Analytics.fromMap(map['analytics']),
    );
  }

  String toJson() => json.encode(toMap());

  factory GifModel.fromJson(String source) => GifModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GifModel(type: $type, id: $id, url: $url, slug: $slug, bitly_gif_url: $bitlyGifUrl, bitly_url: $bitlyUrl, embed_url: $embedUrl, username: $username, source: $source, title: $title, rating: $rating, content_url: $contentUrl, source_tld: $sourceTld, source_post_url: $sourcePostUrl, is_sticker: $isSticker, import_datetime: $importDatetime, trending_datetime: $trendingDatetime, images: $images, user: $user, analytics_response_payload: $analyticsResponsePayload, analytics: $analytics)';
  }

  @override
  List<Object?> get props {
    return [
      type,
      id,
      url,
      slug,
      bitlyGifUrl,
      bitlyUrl,
      embedUrl,
      username,
      source,
      title,
      rating,
      contentUrl,
      sourceTld,
      sourcePostUrl,
      isSticker,
      importDatetime,
      trendingDatetime,
      images,
      user,
      analyticsResponsePayload,
      analytics,
    ];
  }
}

class Image extends Equatable {
  final double height;
  final double width;
  final String size;
  final String url;
  final String? mp4Size;
  final String? mp4;
  final String? webpSize;
  final String? webp;
  final String? frames;
  final String? hash;
  const Image({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    this.mp4Size,
    this.mp4,
    this.webpSize,
    this.webp,
    this.frames,
    this.hash,
  });

  Image copyWith({
    double? height,
    double? width,
    String? size,
    String? url,
    String? mp4Size,
    String? mp4,
    String? webpSize,
    String? webp,
    String? frames,
    String? hash,
  }) {
    return Image(
      height: height ?? this.height,
      width: width ?? this.width,
      size: size ?? this.size,
      url: url ?? this.url,
      mp4Size: mp4Size ?? this.mp4Size,
      mp4: mp4 ?? this.mp4,
      webpSize: webpSize ?? this.webpSize,
      webp: webp ?? this.webp,
      frames: frames ?? this.frames,
      hash: hash ?? this.hash,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'height': height,
      'width': width,
      'size': size,
      'url': url,
      'mp4_size': mp4Size,
      'mp4': mp4,
      'webp_size': webpSize,
      'webp': webp,
      'frames': frames,
      'hash': hash,
    };
  }

  factory Image.fromMap(Map<String, dynamic> map) {
    return Image(
      height: double.tryParse(map['height'] ?? '0') ?? 0,
      width: double.tryParse(map['width'] ?? '0') ?? 0,
      size: map['size'] ?? '',
      url: map['url'] ?? '',
      mp4Size: map['mp4_size'],
      mp4: map['mp4'],
      webpSize: map['webp_size'],
      webp: map['webp'],
      frames: map['frames'],
      hash: map['hash'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Image.fromJson(String source) => Image.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Image(height: $height, width: $width, size: $size, url: $url, mp4_size: $mp4Size, mp4: $mp4, webp_size: $webpSize, webp: $webp, frames: $frames, hash: $hash)';
  }

  @override
  List<Object?> get props {
    return [
      height,
      width,
      size,
      url,
      mp4Size,
      mp4,
      webpSize,
      webp,
      frames,
      hash,
    ];
  }
}

class Images extends Equatable {
  final Image original;
  final Image downsized;
  final Image downsizedLarge;
  final Image downsizedMedium;
  final Image downsizedSmall;
  final Image downsizedStill;
  final Image fixedHeight;
  final Image fixedHeightDownsampled;
  final Image fixedHeightSmall;
  final Image fixedHeightSmallStill;
  final Image fixedHeightStill;
  final Image fixedWidth;
  final Image fixedWidthDownsampled;
  final Image fixedWidthSmall;
  final Image fixedWidthSmallStill;
  final Image fixedWidthStill;
  final Image looping;
  final Image originalStill;
  final Image originalMp4;
  final Image preview;
  final Image previewGif;
  final Image previewWebp;
  final Image? hd;

  const Images({
    required this.original,
    required this.downsized,
    required this.downsizedLarge,
    required this.downsizedMedium,
    required this.downsizedSmall,
    required this.downsizedStill,
    required this.fixedHeight,
    required this.fixedHeightDownsampled,
    required this.fixedHeightSmall,
    required this.fixedHeightSmallStill,
    required this.fixedHeightStill,
    required this.fixedWidth,
    required this.fixedWidthDownsampled,
    required this.fixedWidthSmall,
    required this.fixedWidthSmallStill,
    required this.fixedWidthStill,
    required this.looping,
    required this.originalStill,
    required this.originalMp4,
    required this.preview,
    required this.previewGif,
    required this.previewWebp,
    required this.hd,
  });

  Images copyWith({
    Image? original,
    Image? downsized,
    Image? downsizedLarge,
    Image? downsizedMedium,
    Image? downsizedSmall,
    Image? downsizedStill,
    Image? fixedHeight,
    Image? fixedHeightDownsampled,
    Image? fixedHeightSmall,
    Image? fixedHeightSmallStill,
    Image? fixedHeightStill,
    Image? fixedWidth,
    Image? fixedWidthDownsampled,
    Image? fixedWidthSmall,
    Image? fixedWidthSmallStill,
    Image? fixedWidthStill,
    Image? looping,
    Image? originalStill,
    Image? originalMp4,
    Image? preview,
    Image? previewGif,
    Image? previewWebp,
    Image? hd,
  }) {
    return Images(
      original: original ?? this.original,
      downsized: downsized ?? this.downsized,
      downsizedLarge: downsizedLarge ?? this.downsizedLarge,
      downsizedMedium: downsizedMedium ?? this.downsizedMedium,
      downsizedSmall: downsizedSmall ?? this.downsizedSmall,
      downsizedStill: downsizedStill ?? this.downsizedStill,
      fixedHeight: fixedHeight ?? this.fixedHeight,
      fixedHeightDownsampled: fixedHeightDownsampled ?? this.fixedHeightDownsampled,
      fixedHeightSmall: fixedHeightSmall ?? this.fixedHeightSmall,
      fixedHeightSmallStill: fixedHeightSmallStill ?? this.fixedHeightSmallStill,
      fixedHeightStill: fixedHeightStill ?? this.fixedHeightStill,
      fixedWidth: fixedWidth ?? this.fixedWidth,
      fixedWidthDownsampled: fixedWidthDownsampled ?? this.fixedWidthDownsampled,
      fixedWidthSmall: fixedWidthSmall ?? this.fixedWidthSmall,
      fixedWidthSmallStill: fixedWidthSmallStill ?? this.fixedWidthSmallStill,
      fixedWidthStill: fixedWidthStill ?? this.fixedWidthStill,
      looping: looping ?? this.looping,
      originalStill: originalStill ?? this.originalStill,
      originalMp4: originalMp4 ?? this.originalMp4,
      preview: preview ?? this.preview,
      previewGif: previewGif ?? this.previewGif,
      previewWebp: previewWebp ?? this.previewWebp,
      hd: hd ?? this.hd,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'original': original.toMap(),
      'downsized': downsized.toMap(),
      'downsized_large': downsizedLarge.toMap(),
      'downsized_medium': downsizedMedium.toMap(),
      'downsized_small': downsizedSmall.toMap(),
      'downsized_still': downsizedStill.toMap(),
      'fixed_height': fixedHeight.toMap(),
      'fixed_height_downsampled': fixedHeightDownsampled.toMap(),
      'fixed_height_small': fixedHeightSmall.toMap(),
      'fixed_height_small_still': fixedHeightSmallStill.toMap(),
      'fixed_height_still': fixedHeightStill.toMap(),
      'fixed_width': fixedWidth.toMap(),
      'fixed_width_downsampled': fixedWidthDownsampled.toMap(),
      'fixed_width_small': fixedWidthSmall.toMap(),
      'fixed_width_small_still': fixedWidthSmallStill.toMap(),
      'fixed_width_still': fixedWidthStill.toMap(),
      'looping': looping.toMap(),
      'original_still': originalStill.toMap(),
      'original_mp4': originalMp4.toMap(),
      'preview': preview.toMap(),
      'preview_gif': previewGif.toMap(),
      'preview_webp': previewWebp.toMap(),
      'hd': hd?.toMap(),
    };
  }

  factory Images.fromMap(Map<String, dynamic> map) {
    return Images(
      original: Image.fromMap(map['original']),
      downsized: Image.fromMap(map['downsized']),
      downsizedLarge: Image.fromMap(map['downsized_large']),
      downsizedMedium: Image.fromMap(map['downsized_medium']),
      downsizedSmall: Image.fromMap(map['downsized_small']),
      downsizedStill: Image.fromMap(map['downsized_still']),
      fixedHeight: Image.fromMap(map['fixed_height']),
      fixedHeightDownsampled: Image.fromMap(map['fixed_height_downsampled']),
      fixedHeightSmall: Image.fromMap(map['fixed_height_small']),
      fixedHeightSmallStill: Image.fromMap(map['fixed_height_small_still']),
      fixedHeightStill: Image.fromMap(map['fixed_height_still']),
      fixedWidth: Image.fromMap(map['fixed_width']),
      fixedWidthDownsampled: Image.fromMap(map['fixed_width_downsampled']),
      fixedWidthSmall: Image.fromMap(map['fixed_width_small']),
      fixedWidthSmallStill: Image.fromMap(map['fixed_width_small_still']),
      fixedWidthStill: Image.fromMap(map['fixed_width_still']),
      looping: Image.fromMap(map['looping']),
      originalStill: Image.fromMap(map['original_still']),
      originalMp4: Image.fromMap(map['original_mp4']),
      preview: Image.fromMap(map['preview']),
      previewGif: Image.fromMap(map['preview_gif']),
      previewWebp: Image.fromMap(map['preview_webp']),
      hd: map['hd'] != null ? Image.fromMap(map['hd']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Images.fromJson(String source) => Images.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Images(original: $original, downsized: $downsized, downsized_large: $downsizedLarge, downsized_medium: $downsizedMedium, downsized_small: $downsizedSmall, downsized_still: $downsizedStill, fixed_height: $fixedHeight, fixed_height_downsampled: $fixedHeightDownsampled, fixed_height_small: $fixedHeightSmall, fixed_height_small_still: $fixedHeightSmallStill, fixed_height_still: $fixedHeightStill, fixed_width: $fixedWidth, fixed_width_downsampled: $fixedWidthDownsampled, fixed_width_small: $fixedWidthSmall, fixed_width_small_still: $fixedWidthSmallStill, fixed_width_still: $fixedWidthStill, looping: $looping, original_still: $originalStill, original_mp4: $originalMp4, preview: $preview, preview_gif: $previewGif, preview_webp: $previewWebp, hd: $hd)';
  }

  @override
  List<Object?> get props {
    return [
      original,
      downsized,
      downsizedLarge,
      downsizedMedium,
      downsizedSmall,
      downsizedStill,
      fixedHeight,
      fixedHeightDownsampled,
      fixedHeightSmall,
      fixedHeightSmallStill,
      fixedHeightStill,
      fixedWidth,
      fixedWidthDownsampled,
      fixedWidthSmall,
      fixedWidthSmallStill,
      fixedWidthStill,
      looping,
      originalStill,
      originalMp4,
      preview,
      previewGif,
      previewWebp,
      hd,
    ];
  }
}

class User extends Equatable {
  final String avatarUrl;
  final String bannerImage;
  final String bannerUrl;
  final String profileUrl;
  final String username;
  final String displayName;
  final String description;
  final String instagramUrl;
  final String websiteUrl;
  final bool isVerified;

  const User({
    required this.avatarUrl,
    required this.bannerImage,
    required this.bannerUrl,
    required this.profileUrl,
    required this.username,
    required this.displayName,
    required this.description,
    required this.instagramUrl,
    required this.websiteUrl,
    required this.isVerified,
  });

  User copyWith({
    String? avatarUrl,
    String? bannerImage,
    String? bannerUrl,
    String? profileUrl,
    String? username,
    String? displayName,
    String? description,
    String? instagramUrl,
    String? websiteUrl,
    bool? isVerified,
  }) {
    return User(
      avatarUrl: avatarUrl ?? this.avatarUrl,
      bannerImage: bannerImage ?? this.bannerImage,
      bannerUrl: bannerUrl ?? this.bannerUrl,
      profileUrl: profileUrl ?? this.profileUrl,
      username: username ?? this.username,
      displayName: displayName ?? this.displayName,
      description: description ?? this.description,
      instagramUrl: instagramUrl ?? this.instagramUrl,
      websiteUrl: websiteUrl ?? this.websiteUrl,
      isVerified: isVerified ?? this.isVerified,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'avatar_url': avatarUrl,
      'banner_image': bannerImage,
      'banner_url': bannerUrl,
      'profile_url': profileUrl,
      'username': username,
      'display_name': displayName,
      'description': description,
      'instagram_url': instagramUrl,
      'website_url': websiteUrl,
      'is_verified': isVerified,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      avatarUrl: map['avatar_url'] ?? '',
      bannerImage: map['banner_image'] ?? '',
      bannerUrl: map['banner_url'] ?? '',
      profileUrl: map['profile_url'] ?? '',
      username: map['username'] ?? '',
      displayName: map['display_name'] ?? '',
      description: map['description'] ?? '',
      instagramUrl: map['instagram_url'] ?? '',
      websiteUrl: map['website_url'] ?? '',
      isVerified: map['is_verified'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(avatar_url: $avatarUrl, banner_image: $bannerImage, banner_url: $bannerUrl, profile_url: $profileUrl, username: $username, display_name: $displayName, description: $description, instagram_url: $instagramUrl, website_url: $websiteUrl, is_verified: $isVerified)';
  }

  @override
  List<Object> get props {
    return [
      avatarUrl,
      bannerImage,
      bannerUrl,
      profileUrl,
      username,
      displayName,
      description,
      instagramUrl,
      websiteUrl,
      isVerified,
    ];
  }
}

class Analytics extends Equatable {
  final String onloadUrl;
  final String onclickUrl;
  final String onsentUrl;

  const Analytics({
    required this.onloadUrl,
    required this.onclickUrl,
    required this.onsentUrl,
  });

  Analytics copyWith({
    String? onloadUrl,
    String? onclickUrl,
    String? onsentUrl,
  }) {
    return Analytics(
      onloadUrl: onloadUrl ?? this.onloadUrl,
      onclickUrl: onclickUrl ?? this.onclickUrl,
      onsentUrl: onsentUrl ?? this.onsentUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'onloadUrl': onloadUrl,
      'onclickUrl': onclickUrl,
      'onsentUrl': onsentUrl,
    };
  }

  factory Analytics.fromMap(Map<String, dynamic> map) {
    return Analytics(
      onloadUrl: map['onload']?['url'] ?? '',
      onclickUrl: map['onclick']?['url'] ?? '',
      onsentUrl: map['onsent']?['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Analytics.fromJson(String source) => Analytics.fromMap(json.decode(source));

  @override
  String toString() =>
      'Analytics(onloadUrl: $onloadUrl, onclickUrl: $onclickUrl, onsentUrl: $onsentUrl)';

  @override
  List<Object> get props => [onloadUrl, onclickUrl, onsentUrl];
}
