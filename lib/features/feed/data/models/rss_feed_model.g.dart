// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rss_feed_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRssFeedModelCollection on Isar {
  IsarCollection<RssFeedModel> get rssFeedModels => this.collection();
}

const RssFeedModelSchema = CollectionSchema(
  name: r'RssFeedModel',
  id: 1710906026254939202,
  properties: {
    r'url': PropertySchema(
      id: 0,
      name: r'url',
      type: IsarType.string,
    )
  },
  estimateSize: _rssFeedModelEstimateSize,
  serialize: _rssFeedModelSerialize,
  deserialize: _rssFeedModelDeserialize,
  deserializeProp: _rssFeedModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'website': LinkSchema(
      id: -9011427371978048164,
      name: r'website',
      target: r'WebsiteModel',
      single: true,
      linkName: r'rssFeeds',
    ),
    r'news': LinkSchema(
      id: -8242019569850017563,
      name: r'news',
      target: r'NewsModel',
      single: false,
      linkName: r'rssFeed',
    )
  },
  embeddedSchemas: {},
  getId: _rssFeedModelGetId,
  getLinks: _rssFeedModelGetLinks,
  attach: _rssFeedModelAttach,
  version: '3.1.0+1',
);

int _rssFeedModelEstimateSize(
  RssFeedModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _rssFeedModelSerialize(
  RssFeedModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.url);
}

RssFeedModel _rssFeedModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RssFeedModel();
  object.id = id;
  object.url = reader.readStringOrNull(offsets[0]);
  return object;
}

P _rssFeedModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _rssFeedModelGetId(RssFeedModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _rssFeedModelGetLinks(RssFeedModel object) {
  return [object.website, object.news];
}

void _rssFeedModelAttach(
    IsarCollection<dynamic> col, Id id, RssFeedModel object) {
  object.id = id;
  object.website
      .attach(col, col.isar.collection<WebsiteModel>(), r'website', id);
  object.news.attach(col, col.isar.collection<NewsModel>(), r'news', id);
}

extension RssFeedModelQueryWhereSort
    on QueryBuilder<RssFeedModel, RssFeedModel, QWhere> {
  QueryBuilder<RssFeedModel, RssFeedModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension RssFeedModelQueryWhere
    on QueryBuilder<RssFeedModel, RssFeedModel, QWhereClause> {
  QueryBuilder<RssFeedModel, RssFeedModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension RssFeedModelQueryFilter
    on QueryBuilder<RssFeedModel, RssFeedModel, QFilterCondition> {
  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition> urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition>
      urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'url',
      ));
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition> urlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition>
      urlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition> urlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition> urlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'url',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition> urlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition> urlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'url',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition> urlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'url',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition> urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'url',
        value: '',
      ));
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition>
      urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'url',
        value: '',
      ));
    });
  }
}

extension RssFeedModelQueryObject
    on QueryBuilder<RssFeedModel, RssFeedModel, QFilterCondition> {}

extension RssFeedModelQueryLinks
    on QueryBuilder<RssFeedModel, RssFeedModel, QFilterCondition> {
  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition> website(
      FilterQuery<WebsiteModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'website');
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition>
      websiteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'website', 0, true, 0, true);
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition> news(
      FilterQuery<NewsModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'news');
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition>
      newsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'news', length, true, length, true);
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition>
      newsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'news', 0, true, 0, true);
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition>
      newsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'news', 0, false, 999999, true);
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition>
      newsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'news', 0, true, length, include);
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition>
      newsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'news', length, include, 999999, true);
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterFilterCondition>
      newsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'news', lower, includeLower, upper, includeUpper);
    });
  }
}

extension RssFeedModelQuerySortBy
    on QueryBuilder<RssFeedModel, RssFeedModel, QSortBy> {
  QueryBuilder<RssFeedModel, RssFeedModel, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterSortBy> sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension RssFeedModelQuerySortThenBy
    on QueryBuilder<RssFeedModel, RssFeedModel, QSortThenBy> {
  QueryBuilder<RssFeedModel, RssFeedModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<RssFeedModel, RssFeedModel, QAfterSortBy> thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension RssFeedModelQueryWhereDistinct
    on QueryBuilder<RssFeedModel, RssFeedModel, QDistinct> {
  QueryBuilder<RssFeedModel, RssFeedModel, QDistinct> distinctByUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }
}

extension RssFeedModelQueryProperty
    on QueryBuilder<RssFeedModel, RssFeedModel, QQueryProperty> {
  QueryBuilder<RssFeedModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<RssFeedModel, String?, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }
}
