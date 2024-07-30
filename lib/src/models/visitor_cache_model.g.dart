// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_cache_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetVisitorCacheModelCollection on Isar {
  IsarCollection<VisitorCacheModel> get visitorCacheModels => this.collection();
}

const VisitorCacheModelSchema = CollectionSchema(
  name: r'VisitorCacheModel',
  id: 5772084054798044785,
  properties: {
    r'checkedInAt': PropertySchema(
      id: 0,
      name: r'checkedInAt',
      type: IsarType.dateTime,
    ),
    r'checkedOutAt': PropertySchema(
      id: 1,
      name: r'checkedOutAt',
      type: IsarType.dateTime,
    ),
    r'email': PropertySchema(
      id: 2,
      name: r'email',
      type: IsarType.string,
    ),
    r'fullname': PropertySchema(
      id: 3,
      name: r'fullname',
      type: IsarType.string,
    ),
    r'phone': PropertySchema(
      id: 4,
      name: r'phone',
      type: IsarType.string,
    ),
    r'visitReason': PropertySchema(
      id: 5,
      name: r'visitReason',
      type: IsarType.string,
    )
  },
  estimateSize: _visitorCacheModelEstimateSize,
  serialize: _visitorCacheModelSerialize,
  deserialize: _visitorCacheModelDeserialize,
  deserializeProp: _visitorCacheModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'phone': IndexSchema(
      id: -6308098324157559207,
      name: r'phone',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'phone',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'checkedInAt': IndexSchema(
      id: -2171679599773299162,
      name: r'checkedInAt',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'checkedInAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'checkedOutAt': IndexSchema(
      id: -6629958624030543812,
      name: r'checkedOutAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'checkedOutAt',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _visitorCacheModelGetId,
  getLinks: _visitorCacheModelGetLinks,
  attach: _visitorCacheModelAttach,
  version: '3.1.0+1',
);

int _visitorCacheModelEstimateSize(
  VisitorCacheModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.fullname.length * 3;
  bytesCount += 3 + object.phone.length * 3;
  {
    final value = object.visitReason;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _visitorCacheModelSerialize(
  VisitorCacheModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.checkedInAt);
  writer.writeDateTime(offsets[1], object.checkedOutAt);
  writer.writeString(offsets[2], object.email);
  writer.writeString(offsets[3], object.fullname);
  writer.writeString(offsets[4], object.phone);
  writer.writeString(offsets[5], object.visitReason);
}

VisitorCacheModel _visitorCacheModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VisitorCacheModel(
    checkedInAt: reader.readDateTime(offsets[0]),
    checkedOutAt: reader.readDateTimeOrNull(offsets[1]),
    email: reader.readStringOrNull(offsets[2]),
    fullname: reader.readString(offsets[3]),
    phone: reader.readString(offsets[4]),
    visitReason: reader.readStringOrNull(offsets[5]),
  );
  object.id = id;
  return object;
}

P _visitorCacheModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _visitorCacheModelGetId(VisitorCacheModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _visitorCacheModelGetLinks(
    VisitorCacheModel object) {
  return [];
}

void _visitorCacheModelAttach(
    IsarCollection<dynamic> col, Id id, VisitorCacheModel object) {
  object.id = id;
}

extension VisitorCacheModelByIndex on IsarCollection<VisitorCacheModel> {
  Future<VisitorCacheModel?> getByCheckedInAt(DateTime checkedInAt) {
    return getByIndex(r'checkedInAt', [checkedInAt]);
  }

  VisitorCacheModel? getByCheckedInAtSync(DateTime checkedInAt) {
    return getByIndexSync(r'checkedInAt', [checkedInAt]);
  }

  Future<bool> deleteByCheckedInAt(DateTime checkedInAt) {
    return deleteByIndex(r'checkedInAt', [checkedInAt]);
  }

  bool deleteByCheckedInAtSync(DateTime checkedInAt) {
    return deleteByIndexSync(r'checkedInAt', [checkedInAt]);
  }

  Future<List<VisitorCacheModel?>> getAllByCheckedInAt(
      List<DateTime> checkedInAtValues) {
    final values = checkedInAtValues.map((e) => [e]).toList();
    return getAllByIndex(r'checkedInAt', values);
  }

  List<VisitorCacheModel?> getAllByCheckedInAtSync(
      List<DateTime> checkedInAtValues) {
    final values = checkedInAtValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'checkedInAt', values);
  }

  Future<int> deleteAllByCheckedInAt(List<DateTime> checkedInAtValues) {
    final values = checkedInAtValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'checkedInAt', values);
  }

  int deleteAllByCheckedInAtSync(List<DateTime> checkedInAtValues) {
    final values = checkedInAtValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'checkedInAt', values);
  }

  Future<Id> putByCheckedInAt(VisitorCacheModel object) {
    return putByIndex(r'checkedInAt', object);
  }

  Id putByCheckedInAtSync(VisitorCacheModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'checkedInAt', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByCheckedInAt(List<VisitorCacheModel> objects) {
    return putAllByIndex(r'checkedInAt', objects);
  }

  List<Id> putAllByCheckedInAtSync(List<VisitorCacheModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'checkedInAt', objects, saveLinks: saveLinks);
  }
}

extension VisitorCacheModelQueryWhereSort
    on QueryBuilder<VisitorCacheModel, VisitorCacheModel, QWhere> {
  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhere>
      anyCheckedInAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'checkedInAt'),
      );
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhere>
      anyCheckedOutAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'checkedOutAt'),
      );
    });
  }
}

extension VisitorCacheModelQueryWhere
    on QueryBuilder<VisitorCacheModel, VisitorCacheModel, QWhereClause> {
  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhereClause>
      phoneEqualTo(String phone) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'phone',
        value: [phone],
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhereClause>
      phoneNotEqualTo(String phone) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'phone',
              lower: [],
              upper: [phone],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'phone',
              lower: [phone],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'phone',
              lower: [phone],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'phone',
              lower: [],
              upper: [phone],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhereClause>
      checkedInAtEqualTo(DateTime checkedInAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'checkedInAt',
        value: [checkedInAt],
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhereClause>
      checkedInAtNotEqualTo(DateTime checkedInAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'checkedInAt',
              lower: [],
              upper: [checkedInAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'checkedInAt',
              lower: [checkedInAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'checkedInAt',
              lower: [checkedInAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'checkedInAt',
              lower: [],
              upper: [checkedInAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhereClause>
      checkedInAtGreaterThan(
    DateTime checkedInAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'checkedInAt',
        lower: [checkedInAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhereClause>
      checkedInAtLessThan(
    DateTime checkedInAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'checkedInAt',
        lower: [],
        upper: [checkedInAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhereClause>
      checkedInAtBetween(
    DateTime lowerCheckedInAt,
    DateTime upperCheckedInAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'checkedInAt',
        lower: [lowerCheckedInAt],
        includeLower: includeLower,
        upper: [upperCheckedInAt],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhereClause>
      checkedOutAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'checkedOutAt',
        value: [null],
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhereClause>
      checkedOutAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'checkedOutAt',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhereClause>
      checkedOutAtEqualTo(DateTime? checkedOutAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'checkedOutAt',
        value: [checkedOutAt],
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhereClause>
      checkedOutAtNotEqualTo(DateTime? checkedOutAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'checkedOutAt',
              lower: [],
              upper: [checkedOutAt],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'checkedOutAt',
              lower: [checkedOutAt],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'checkedOutAt',
              lower: [checkedOutAt],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'checkedOutAt',
              lower: [],
              upper: [checkedOutAt],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhereClause>
      checkedOutAtGreaterThan(
    DateTime? checkedOutAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'checkedOutAt',
        lower: [checkedOutAt],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhereClause>
      checkedOutAtLessThan(
    DateTime? checkedOutAt, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'checkedOutAt',
        lower: [],
        upper: [checkedOutAt],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterWhereClause>
      checkedOutAtBetween(
    DateTime? lowerCheckedOutAt,
    DateTime? upperCheckedOutAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'checkedOutAt',
        lower: [lowerCheckedOutAt],
        includeLower: includeLower,
        upper: [upperCheckedOutAt],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension VisitorCacheModelQueryFilter
    on QueryBuilder<VisitorCacheModel, VisitorCacheModel, QFilterCondition> {
  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      checkedInAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkedInAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      checkedInAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'checkedInAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      checkedInAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'checkedInAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      checkedInAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'checkedInAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      checkedOutAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'checkedOutAt',
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      checkedOutAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'checkedOutAt',
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      checkedOutAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checkedOutAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      checkedOutAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'checkedOutAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      checkedOutAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'checkedOutAt',
        value: value,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      checkedOutAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'checkedOutAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      emailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      emailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      fullnameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      fullnameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fullname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      fullnameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fullname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      fullnameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fullname',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      fullnameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fullname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      fullnameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fullname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      fullnameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fullname',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      fullnameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fullname',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      fullnameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fullname',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      fullnameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fullname',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      phoneEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      phoneGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      phoneLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      phoneBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      phoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      phoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      phoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      phoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      visitReasonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'visitReason',
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      visitReasonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'visitReason',
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      visitReasonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visitReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      visitReasonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'visitReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      visitReasonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'visitReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      visitReasonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'visitReason',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      visitReasonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'visitReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      visitReasonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'visitReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      visitReasonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'visitReason',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      visitReasonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'visitReason',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      visitReasonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'visitReason',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterFilterCondition>
      visitReasonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'visitReason',
        value: '',
      ));
    });
  }
}

extension VisitorCacheModelQueryObject
    on QueryBuilder<VisitorCacheModel, VisitorCacheModel, QFilterCondition> {}

extension VisitorCacheModelQueryLinks
    on QueryBuilder<VisitorCacheModel, VisitorCacheModel, QFilterCondition> {}

extension VisitorCacheModelQuerySortBy
    on QueryBuilder<VisitorCacheModel, VisitorCacheModel, QSortBy> {
  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      sortByCheckedInAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkedInAt', Sort.asc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      sortByCheckedInAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkedInAt', Sort.desc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      sortByCheckedOutAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkedOutAt', Sort.asc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      sortByCheckedOutAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkedOutAt', Sort.desc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      sortByFullname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullname', Sort.asc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      sortByFullnameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullname', Sort.desc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      sortByVisitReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitReason', Sort.asc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      sortByVisitReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitReason', Sort.desc);
    });
  }
}

extension VisitorCacheModelQuerySortThenBy
    on QueryBuilder<VisitorCacheModel, VisitorCacheModel, QSortThenBy> {
  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      thenByCheckedInAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkedInAt', Sort.asc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      thenByCheckedInAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkedInAt', Sort.desc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      thenByCheckedOutAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkedOutAt', Sort.asc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      thenByCheckedOutAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checkedOutAt', Sort.desc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      thenByFullname() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullname', Sort.asc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      thenByFullnameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fullname', Sort.desc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      thenByVisitReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitReason', Sort.asc);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QAfterSortBy>
      thenByVisitReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'visitReason', Sort.desc);
    });
  }
}

extension VisitorCacheModelQueryWhereDistinct
    on QueryBuilder<VisitorCacheModel, VisitorCacheModel, QDistinct> {
  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QDistinct>
      distinctByCheckedInAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'checkedInAt');
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QDistinct>
      distinctByCheckedOutAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'checkedOutAt');
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QDistinct>
      distinctByFullname({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fullname', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QDistinct> distinctByPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<VisitorCacheModel, VisitorCacheModel, QDistinct>
      distinctByVisitReason({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'visitReason', caseSensitive: caseSensitive);
    });
  }
}

extension VisitorCacheModelQueryProperty
    on QueryBuilder<VisitorCacheModel, VisitorCacheModel, QQueryProperty> {
  QueryBuilder<VisitorCacheModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<VisitorCacheModel, DateTime, QQueryOperations>
      checkedInAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checkedInAt');
    });
  }

  QueryBuilder<VisitorCacheModel, DateTime?, QQueryOperations>
      checkedOutAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checkedOutAt');
    });
  }

  QueryBuilder<VisitorCacheModel, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<VisitorCacheModel, String, QQueryOperations> fullnameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fullname');
    });
  }

  QueryBuilder<VisitorCacheModel, String, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<VisitorCacheModel, String?, QQueryOperations>
      visitReasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visitReason');
    });
  }
}
