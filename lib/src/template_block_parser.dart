// This code was generated by a tool.
// Processing tool available at https://github.com/mezoni/peg

part of template_block;

class TemplateBlockParser {
  static const int EOF = -1;
  static final List<String> _ascii =
      List<String>.generate(128, (c) => String.fromCharCode(c));
  static final List<bool> _lookahead =
      _unmap([0x7ffe03ff, 0x7ffd0fff, 0x13fff]);
  static final List<bool> _mapping0 = _unmap([0x7ffe03ff, 0x7ffc0fff, 0x1fff]);
  static final List<bool> _mapping1 = _unmap([0x3ffffff, 0x7fffffe]);
  static final List<int> _strings0 = <int>[123, 123, 35];
  static final List<int> _strings1 = <int>[125, 125];
  static final List<int> _strings2 = <int>[13, 10];
  static final List<int> _strings3 = <int>[123, 123];
  static final List<String> _expect0 = <String>["NEW_LINE"];
  static final List<String> _expect1 = <String>["EMPTY_LINE"];
  static final List<String> _expect2 = <String>["EOF"];
  static final List<String> _expect3 = <String>["IDENT_START"];
  static final List<String> _expect4 = <String>["IDENT_CONT"];
  static final List<String> _expect5 = <String>["IDENT"];
  static final List<String> _expect6 = <String>["LAST_LINE"];
  static final List<String> _expect7 = <String>["{{#"];
  static final List<String> _expect8 = <String>["{{"];
  static final List<String> _expect9 = <String>[null];
  static final List<String> _expect10 = <String>[null, "{{"];
  static final List<String> _expect11 = <String>[
    null,
    "EMPTY_LINE",
    "LAST_LINE",
    "{{",
    "{{#"
  ];
  List _cache;
  int _cachePos;
  List<int> _cacheRule;
  List<int> _cacheState;
  int _ch;
  int _column;
  int _cursor;
  List<String> _expected;
  int _failurePos;
  int _inputLen;
  int _line;
  List<int> _runes;
  bool success;
  int _testing;
  String _token;
  int _tokenLevel;
  int _tokenStart;

  TemplateBlockParser(String text) {
    if (text == null) {
      throw ArgumentError('text: $text');
    }
    _runes = _toRunes(text);
    _inputLen = _runes.length;
    if (_inputLen >= 0x3fffffe8 / 32) {
      throw StateError('File size to big: $_inputLen');
    }
    reset(0);
  }

  int get column {
    if (_column == -1) {
      _calculatePos(_failurePos);
    }
    return _column;
  }

  int get line {
    if (_line == -1) {
      _calculatePos(_failurePos);
    }
    return _line;
  }

  dynamic _parse_EMPTY_LINE() {
    var $$;
    if (_tokenLevel++ == 0) {
      _token = "EMPTY_LINE";
      _tokenStart = _cursor;
    }
    var ch0 = _ch, pos0 = _cursor, testing0 = _testing;
    _testing = _inputLen + 1;
    $$ = null;
    success = _ch >= 10 && _ch <= 13 && _lookahead[_ch + 65];
    if (success) $$ = _parse_NEW_LINE();
    if (!success) {
      if (_cursor > _testing) _failure(_expect0);
    }
    _ch = ch0;
    _cursor = pos0;
    _testing = testing0;
    $$ = null;
    if (success) {
      final $1 = $$;
      $$ = _addSingleLine(const [""]);
    }
    if (!success && _cursor > _testing) {
      _failure(_expect1);
    }
    if (--_tokenLevel == 0) {
      _token = null;
      _tokenStart = null;
    }
    return $$;
  }

  dynamic _parse_EOF() {
    var $$;
    if (_tokenLevel++ == 0) {
      _token = "EOF";
      _tokenStart = _cursor;
    }
    var ch0 = _ch, pos0 = _cursor, testing0 = _testing;
    _testing = _inputLen + 1;
    $$ = _matchAny();
    _ch = ch0;
    _cursor = pos0;
    _testing = testing0;
    $$ = null;
    success = !success;
    if (!success && _cursor > _testing) {
      _failure(_expect2);
    }
    if (--_tokenLevel == 0) {
      _token = null;
      _tokenStart = null;
    }
    return $$;
  }

  dynamic _parse_IDENT() {
    var $$;
    if (_tokenLevel++ == 0) {
      _token = "IDENT";
      _tokenStart = _cursor;
    }
    var ch0 = _ch, pos0 = _cursor;
    while (true) {
      $$ = null;
      success = _ch >= 65 && _ch <= 122 && _lookahead[_ch + -48];
      if (success) $$ = _parse_IDENT_START();
      if (!success) {
        if (_cursor > _testing) _failure(_expect3);
        break;
      }
      var seq = List(2)..[0] = $$;
      var testing0 = _testing;
      for (var reps = [];;) {
        _testing = _cursor;
        $$ = null;
        success = _ch >= 48 && _ch <= 122 && _lookahead[_ch + -48];
        if (success) $$ = _parse_IDENT_CONT();
        if (!success) {
          if (_cursor > _testing) _failure(_expect4);
        }
        if (success) {
          reps.add($$);
        } else {
          success = true;
          _testing = testing0;
          $$ = reps;
          break;
        }
      }
      if (!success) break;
      seq[1] = $$;
      $$ = seq;
      if (success) {
        final $1 = seq[0];
        final $2 = seq[1];
        $$ = _flatten([$1, $2]).join();
      }
      break;
    }
    if (!success) {
      _ch = ch0;
      _cursor = pos0;
    }
    if (!success && _cursor > _testing) {
      _failure(_expect5);
    }
    if (--_tokenLevel == 0) {
      _token = null;
      _tokenStart = null;
    }
    return $$;
  }

  dynamic _parse_IDENT_CONT() {
    var $$;
    if (_tokenLevel++ == 0) {
      _token = "IDENT_CONT";
      _tokenStart = _cursor;
    }
    while (true) {
      $$ = _matchMapping(48, 122, _mapping0);
      if (success) break;
      $$ = _matchChar(95, '_');
      break;
    }
    if (!success && _cursor > _testing) {
      _failure(_expect4);
    }
    if (--_tokenLevel == 0) {
      _token = null;
      _tokenStart = null;
    }
    return $$;
  }

  dynamic _parse_IDENT_START() {
    var $$;
    if (_tokenLevel++ == 0) {
      _token = "IDENT_START";
      _tokenStart = _cursor;
    }
    while (true) {
      $$ = _matchMapping(65, 122, _mapping1);
      if (success) break;
      $$ = _matchChar(95, '_');
      break;
    }
    if (!success && _cursor > _testing) {
      _failure(_expect3);
    }
    if (--_tokenLevel == 0) {
      _token = null;
      _tokenStart = null;
    }
    return $$;
  }

  dynamic _parse_LAST_LINE() {
    var $$;
    if (_tokenLevel++ == 0) {
      _token = "LAST_LINE";
      _tokenStart = _cursor;
    }
    var ch0 = _ch, pos0 = _cursor;
    while (true) {
      $$ = null;
      success = _ch >= 10 && _ch <= 13 && _lookahead[_ch + 65];
      if (success) $$ = _parse_NEW_LINE();
      if (!success) {
        if (_cursor > _testing) _failure(_expect0);
        break;
      }
      var seq = List(2)..[0] = $$;
      var ch1 = _ch, pos1 = _cursor, testing0 = _testing;
      _testing = _inputLen + 1;
      $$ = _parse_EOF();
      _ch = ch1;
      _cursor = pos1;
      _testing = testing0;
      $$ = null;
      if (!success) break;
      seq[1] = $$;
      $$ = seq;
      if (success) {
        final $1 = seq[0];
        final $2 = seq[1];
        $$ = _addSingleLine(const [""]);
      }
      break;
    }
    if (!success) {
      _ch = ch0;
      _cursor = pos0;
    }
    if (!success && _cursor > _testing) {
      _failure(_expect6);
    }
    if (--_tokenLevel == 0) {
      _token = null;
      _tokenStart = null;
    }
    return $$;
  }

  dynamic _parse_MULTI_LINE_KEY() {
    var $$;
    if (_tokenLevel++ == 0) {
      _token = "{{#";
      _tokenStart = _cursor;
    }
    var ch0 = _ch, pos0 = _cursor;
    while (true) {
      $$ = _matchString(_strings0, '{{#');
      if (!success) break;
      var seq = List(3)..[0] = $$;
      $$ = null;
      success = _ch >= 65 && _ch <= 122 && _lookahead[_ch + -48];
      if (success) $$ = _parse_IDENT();
      if (!success) {
        if (_cursor > _testing) _failure(_expect5);
        break;
      }
      seq[1] = $$;
      $$ = _matchString(_strings1, '}}');
      if (!success) break;
      seq[2] = $$;
      $$ = seq;
      if (success) {
        final $1 = seq[0];
        final $2 = seq[1];
        final $3 = seq[2];
        $$ = $2;
      }
      break;
    }
    if (!success) {
      _ch = ch0;
      _cursor = pos0;
    }
    if (!success && _cursor > _testing) {
      _failure(_expect7);
    }
    if (--_tokenLevel == 0) {
      _token = null;
      _tokenStart = null;
    }
    return $$;
  }

  dynamic _parse_NEW_LINE() {
    var $$;
    if (_tokenLevel++ == 0) {
      _token = "NEW_LINE";
      _tokenStart = _cursor;
    }
    while (true) {
      $$ = _matchChar(10, '\n');
      if (success) break;
      $$ = _matchString(_strings2, '\r\n');
      if (success) break;
      $$ = _matchChar(13, '\r');
      break;
    }
    if (!success && _cursor > _testing) {
      _failure(_expect0);
    }
    if (--_tokenLevel == 0) {
      _token = null;
      _tokenStart = null;
    }
    return $$;
  }

  dynamic _parse_SINGLE_LINE_KEY() {
    var $$;
    if (_tokenLevel++ == 0) {
      _token = "{{";
      _tokenStart = _cursor;
    }
    var ch0 = _ch, pos0 = _cursor;
    while (true) {
      $$ = _matchString(_strings3, '{{');
      if (!success) break;
      var seq = List(3)..[0] = $$;
      $$ = null;
      success = _ch >= 65 && _ch <= 122 && _lookahead[_ch + -48];
      if (success) $$ = _parse_IDENT();
      if (!success) {
        if (_cursor > _testing) _failure(_expect5);
        break;
      }
      seq[1] = $$;
      $$ = _matchString(_strings1, '}}');
      if (!success) break;
      seq[2] = $$;
      $$ = seq;
      if (success) {
        final $1 = seq[0];
        final $2 = seq[1];
        final $3 = seq[2];
        $$ = _template._addKey($2 as String);
      }
      break;
    }
    if (!success) {
      _ch = ch0;
      _cursor = pos0;
    }
    if (!success && _cursor > _testing) {
      _failure(_expect8);
    }
    if (--_tokenLevel == 0) {
      _token = null;
      _tokenStart = null;
    }
    return $$;
  }

  dynamic _parse_multiLine() {
    var $$;
    var ch0 = _ch, pos0 = _cursor;
    while (true) {
      var testing0 = _testing;
      for (var reps = [];;) {
        _testing = _cursor;
        $$ = _parse_multiLinePrefix();
        if (success) {
          reps.add($$);
        } else {
          success = true;
          _testing = testing0;
          $$ = reps;
          break;
        }
      }
      if (!success) break;
      var seq = List(3)..[0] = $$;
      $$ = null;
      success = _ch == 123;
      if (success) $$ = _parse_MULTI_LINE_KEY();
      if (!success) {
        if (_cursor > _testing) _failure(_expect7);
        break;
      }
      seq[1] = $$;
      var testing1 = _testing;
      for (var reps = [];;) {
        _testing = _cursor;
        $$ = _parse_multiLineSuffix();
        if (success) {
          reps.add($$);
        } else {
          success = true;
          _testing = testing1;
          $$ = reps;
          break;
        }
      }
      if (!success) break;
      seq[2] = $$;
      $$ = seq;
      if (success) {
        final $1 = seq[0];
        final $2 = seq[1];
        final $3 = seq[2];
        $$ = _addMultiLine($1 as List, $2 as String, $3 as List);
      }
      break;
    }
    if (!success) {
      _ch = ch0;
      _cursor = pos0;
    }
    if (!success && _cursor > _testing) {
      _failure(_expect7);
    }
    return $$;
  }

  dynamic _parse_multiLinePrefix() {
    var $$;
    var ch0 = _ch, pos0 = _cursor;
    while (true) {
      var ch1 = _ch, pos1 = _cursor, testing0 = _testing;
      _testing = _inputLen + 1;
      $$ = null;
      success = _ch == 123;
      if (success) $$ = _parse_MULTI_LINE_KEY();
      if (!success) {
        if (_cursor > _testing) _failure(_expect7);
      }
      _ch = ch1;
      _cursor = pos1;
      _testing = testing0;
      $$ = null;
      success = !success;
      if (!success) break;
      var seq = List(3)..[0] = $$;
      var ch2 = _ch, pos2 = _cursor, testing1 = _testing;
      _testing = _inputLen + 1;
      $$ = null;
      success = _ch >= 10 && _ch <= 13 && _lookahead[_ch + 65];
      if (success) $$ = _parse_NEW_LINE();
      if (!success) {
        if (_cursor > _testing) _failure(_expect0);
      }
      _ch = ch2;
      _cursor = pos2;
      _testing = testing1;
      $$ = null;
      success = !success;
      if (!success) break;
      seq[1] = $$;
      $$ = _matchAny();
      if (!success) break;
      seq[2] = $$;
      $$ = seq;
      if (success) {
        final $1 = seq[0];
        final $2 = seq[1];
        final $3 = seq[2];
        $$ = $3;
      }
      break;
    }
    if (!success) {
      _ch = ch0;
      _cursor = pos0;
    }
    if (!success && _cursor > _testing) {
      _failure(_expect9);
    }
    return $$;
  }

  dynamic _parse_multiLineSuffix() {
    var $$;
    var ch0 = _ch, pos0 = _cursor;
    while (true) {
      var ch1 = _ch, pos1 = _cursor, testing0 = _testing;
      _testing = _inputLen + 1;
      $$ = null;
      success = _ch >= 10 && _ch <= 13 && _lookahead[_ch + 65];
      if (success) $$ = _parse_NEW_LINE();
      if (!success) {
        if (_cursor > _testing) _failure(_expect0);
      }
      _ch = ch1;
      _cursor = pos1;
      _testing = testing0;
      $$ = null;
      success = !success;
      if (!success) break;
      var seq = List(2)..[0] = $$;
      $$ = _matchAny();
      if (!success) break;
      seq[1] = $$;
      $$ = seq;
      if (success) {
        final $1 = seq[0];
        final $2 = seq[1];
        $$ = $2;
      }
      break;
    }
    if (!success) {
      _ch = ch0;
      _cursor = pos0;
    }
    if (!success && _cursor > _testing) {
      _failure(_expect9);
    }
    return $$;
  }

  dynamic _parse_singleLine() {
    var $$;
    $$ = _parse_singleLineParts();
    if (success) {
      final $1 = $$;
      $$ = _addSingleLine($1 as List);
    }
    if (!success && _cursor > _testing) {
      _failure(_expect10);
    }
    return $$;
  }

  dynamic _parse_singleLinePart() {
    var $$;
    var ch0 = _ch, pos0 = _cursor;
    while (true) {
      var ch1 = _ch, pos1 = _cursor, testing0 = _testing;
      _testing = _inputLen + 1;
      $$ = null;
      success = _ch == 123;
      if (success) $$ = _parse_SINGLE_LINE_KEY();
      if (!success) {
        if (_cursor > _testing) _failure(_expect8);
      }
      _ch = ch1;
      _cursor = pos1;
      _testing = testing0;
      $$ = null;
      success = !success;
      if (!success) break;
      var seq = List(3)..[0] = $$;
      var ch2 = _ch, pos2 = _cursor, testing1 = _testing;
      _testing = _inputLen + 1;
      $$ = null;
      success = _ch >= 10 && _ch <= 13 && _lookahead[_ch + 65];
      if (success) $$ = _parse_NEW_LINE();
      if (!success) {
        if (_cursor > _testing) _failure(_expect0);
      }
      _ch = ch2;
      _cursor = pos2;
      _testing = testing1;
      $$ = null;
      success = !success;
      if (!success) break;
      seq[1] = $$;
      $$ = _matchAny();
      if (!success) break;
      seq[2] = $$;
      $$ = seq;
      if (success) {
        final $1 = seq[0];
        final $2 = seq[1];
        final $3 = seq[2];
        $$ = $3;
      }
      break;
    }
    if (!success) {
      _ch = ch0;
      _cursor = pos0;
    }
    if (!success && _cursor > _testing) {
      _failure(_expect9);
    }
    return $$;
  }

  dynamic _parse_singleLineParts() {
    var $$;
    int testing0;
    for (var first = true, reps;;) {
      while (true) {
        $$ = null;
        success = _ch == 123;
        if (success) $$ = _parse_SINGLE_LINE_KEY();
        if (!success) {
          if (_cursor > _testing) _failure(_expect8);
        }
        if (success) break;
        $$ = _parse_singleLinePart();
        break;
      }
      if (!success && _cursor > _testing) {
        _failure(_expect10);
      }
      if (success) {
        if (first) {
          first = false;
          reps = [$$];
          testing0 = _testing;
        } else {
          reps.add($$);
        }
        _testing = _cursor;
      } else {
        success = !first;
        if (success) {
          _testing = testing0;
          $$ = reps;
        } else
          $$ = null;
        break;
      }
    }
    if (!success && _cursor > _testing) {
      _failure(_expect10);
    }
    return $$;
  }

  dynamic parse_template() {
    var $$;
    var ch0 = _ch, pos0 = _cursor;
    while (true) {
      var testing0 = _testing;
      for (var reps = [];;) {
        _testing = _cursor;
        var ch1 = _ch, pos1 = _cursor;
        while (true) {
          while (true) {
            $$ = null;
            success = _ch >= 10 && _ch <= 13 && _lookahead[_ch + 65];
            if (success) $$ = _parse_LAST_LINE();
            if (!success) {
              if (_cursor > _testing) _failure(_expect6);
            }
            if (success) break;
            $$ = _parse_multiLine();
            if (success) break;
            $$ = _parse_singleLine();
            if (success) break;
            $$ = null;
            success = _ch >= 10 && _ch <= 13 && _lookahead[_ch + 65];
            if (success) $$ = _parse_EMPTY_LINE();
            if (!success) {
              if (_cursor > _testing) _failure(_expect1);
            }
            break;
          }
          if (!success && _cursor > _testing) {
            _failure(_expect11);
          }
          if (!success) break;
          var seq = List(2)..[0] = $$;
          var testing1 = _testing;
          _testing = _cursor;
          var ch2 = _ch, pos2 = _cursor;
          while (true) {
            $$ = null;
            success = _ch >= 10 && _ch <= 13 && _lookahead[_ch + 65];
            if (success) $$ = _parse_NEW_LINE();
            if (!success) {
              if (_cursor > _testing) _failure(_expect0);
              break;
            }
            var seq = List(2)..[0] = $$;
            var ch3 = _ch, pos3 = _cursor, testing2 = _testing;
            _testing = _inputLen + 1;
            $$ = _parse_EOF();
            _ch = ch3;
            _cursor = pos3;
            _testing = testing2;
            $$ = null;
            success = !success;
            if (!success) break;
            seq[1] = $$;
            $$ = seq;
            break;
          }
          if (!success) {
            _ch = ch2;
            _cursor = pos2;
          }
          if (!success && _cursor > _testing) {
            _failure(_expect0);
          }
          success = true;
          _testing = testing1;
          if (!success) break;
          seq[1] = $$;
          $$ = seq;
          if (success) {
            final $1 = seq[0];
            final $2 = seq[1];
            $$ = $1;
          }
          break;
        }
        if (!success) {
          _ch = ch1;
          _cursor = pos1;
        }
        if (!success && _cursor > _testing) {
          _failure(_expect11);
        }
        if (success) {
          reps.add($$);
        } else {
          success = true;
          _testing = testing0;
          $$ = reps;
          break;
        }
      }
      if (!success) break;
      var seq = List(2)..[0] = $$;
      $$ = _parse_EOF();
      if (!success) break;
      seq[1] = $$;
      $$ = seq;
      if (success) {
        final $1 = seq[0];
        final $2 = seq[1];
        $$ = $1;
      }
      break;
    }
    if (!success) {
      _ch = ch0;
      _cursor = pos0;
    }
    if (!success && _cursor > _testing) {
      _failure(_expect2);
    }
    return $$;
  }

  void _calculatePos(int pos) {
    if (pos == null || pos < 0 || pos > _inputLen) {
      return;
    }
    _line = 1;
    _column = 1;
    for (var i = 0; i < _inputLen && i < pos; i++) {
      var c = _runes[i];
      if (c == 13) {
        _line++;
        _column = 1;
        if (i + 1 < _inputLen && _runes[i + 1] == 10) {
          i++;
        }
      } else if (c == 10) {
        _line++;
        _column = 1;
      } else {
        _column++;
      }
    }
  }

  void _failure([List<String> expected]) {
    if (_failurePos > _cursor) {
      return;
    }
    if (_cursor > _failurePos) {
      _expected = [];
      _failurePos = _cursor;
    }
    if (_token != null) {
      _expected.add(_token);
    } else if (expected == null) {
      _expected.add(null);
    } else {
      _expected.addAll(expected);
    }
  }

  List _flatten(dynamic value) {
    if (value is List) {
      var result = [];
      var length = value.length;
      for (var i = 0; i < length; i++) {
        var element = value[i];
        if (element is Iterable) {
          result.addAll(_flatten(element));
        } else {
          result.add(element);
        }
      }
      return result;
    } else if (value is Iterable) {
      var result = [];
      for (var element in value) {
        if (element is! List) {
          result.add(element);
        } else {
          result.addAll(_flatten(element));
        }
      }
    }
    return [value];
  }

  dynamic _getFromCache(int id) {
    var result = _cache[_cursor];
    if (result == null) {
      return null;
    }
    var slot = _cursor >> 5;
    var r1 = (slot << 5) & 0x3fffffff;
    var mask = 1 << (_cursor - r1);
    if ((_cacheState[slot] & mask) == 0) {
      if (_cacheRule[_cursor] == id) {
        _cursor = result[1] as int;
        success = result[2] as bool;
        if (_cursor < _inputLen) {
          _ch = _runes[_cursor];
        } else {
          _ch = EOF;
        }
        return result;
      } else {
        return null;
      }
    }
    slot = id >> 5;
    r1 = (slot << 5) & 0x3fffffff;
    mask = 1 << (id - r1);
    if ((result[0][slot] & mask) == 0) {
      return null;
    }
    var data = result[1][id];
    _cursor = data[1] as int;
    success = data[2] as bool;
    if (_cursor < _inputLen) {
      _ch = _runes[_cursor];
    } else {
      _ch = EOF;
    }
    return data;
  }

  String _matchAny() {
    success = _cursor < _inputLen;
    if (success) {
      String result;
      if (_ch < 128) {
        result = _ascii[_ch];
      } else {
        result = String.fromCharCode(_ch);
      }
      if (++_cursor < _inputLen) {
        _ch = _runes[_cursor];
      } else {
        _ch = EOF;
      }
      return result;
    }
    return null;
  }

  String _matchChar(int ch, String string) {
    success = _ch == ch;
    if (success) {
      var result = string;
      if (++_cursor < _inputLen) {
        _ch = _runes[_cursor];
      } else {
        _ch = EOF;
      }
      return result;
    }
    return null;
  }

  String _matchMapping(int start, int end, List<bool> mapping) {
    success = _ch >= start && _ch <= end;
    if (success) {
      if (mapping[_ch - start]) {
        String result;
        if (_ch < 128) {
          result = _ascii[_ch];
        } else {
          result = String.fromCharCode(_ch);
        }
        if (++_cursor < _inputLen) {
          _ch = _runes[_cursor];
        } else {
          _ch = EOF;
        }
        return result;
      }
      success = false;
    }
    return null;
  }

  String _matchString(List<int> runes, String string) {
    var length = runes.length;
    success = true;
    if (_cursor + length <= _inputLen) {
      for (var i = 0; i < length; i++) {
        if (runes[i] != _runes[_cursor + i]) {
          success = false;
          break;
        }
      }
    } else {
      success = false;
    }
    if (success) {
      _cursor += length;
      if (_cursor < _inputLen) {
        _ch = _runes[_cursor];
      } else {
        _ch = EOF;
      }
      return string;
    }
    return null;
  }

  void _nextChar([int count = 1]) {
    success = true;
    _cursor += count;
    if (_cursor < _inputLen) {
      _ch = _runes[_cursor];
    } else {
      _ch = EOF;
    }
  }

  List<int> _toRunes(String string) {
    if (string == null) {
      throw ArgumentError("string: $string");
    }

    var length = string.length;
    if (length == 0) {
      return const <int>[];
    }

    var runes = <int>[];
    runes.length = length;
    var i = 0;
    var pos = 0;
    for (; i < length; pos++) {
      var start = string.codeUnitAt(i);
      i++;
      if ((start & 0xFC00) == 0xD800 && i < length) {
        var end = string.codeUnitAt(i);
        if ((end & 0xFC00) == 0xDC00) {
          runes[pos] = (0x10000 + ((start & 0x3FF) << 10) + (end & 0x3FF));
          i++;
        } else {
          runes[pos] = start;
        }
      } else {
        runes[pos] = start;
      }
    }

    runes.length = pos;
    return runes;
  }

  static List<bool> _unmap(List<int> mapping) {
    var length = mapping.length;
    var result = List<bool>(length * 31);
    var offset = 0;
    for (var i = 0; i < length; i++) {
      var v = mapping[i];
      for (var j = 0; j < 31; j++) {
        result[offset++] = v & (1 << j) == 0 ? false : true;
      }
    }
    return result;
  }

  List<String> get expected {
    var set = Set<String>();
    set.addAll(_expected);
    if (set.contains(null)) {
      set.clear();
    }
    var result = set.toList();
    result.sort();
    return result;
  }

  void reset(int pos) {
    if (pos == null) {
      throw ArgumentError('pos: $pos');
    }
    if (pos < 0 || pos > _inputLen) {
      throw RangeError('pos');
    }
    _cursor = pos;
    _cache = List(_inputLen + 1);
    _cachePos = -1;
    _cacheRule = List(_inputLen + 1);
    _cacheState = List.filled(((_inputLen + 1) >> 5) + 1, 0);
    _ch = EOF;
    _column = -1;
    _expected = [];
    _failurePos = -1;
    _line = -1;
    success = true;
    _testing = -1;
    _token = null;
    _tokenLevel = 0;
    _tokenStart = null;
    if (_cursor < _inputLen) {
      _ch = _runes[_cursor];
    }
  }

  String get unexpected {
    if (_failurePos < 0 || _failurePos >= _inputLen) {
      return '';
    }
    return String.fromCharCode(_runes[_failurePos]);
  }

  TemplateBlock _template;

  List<_TemplateLine> parse(TemplateBlock template) {
    _template = template;
    var result = parse_template();
    if (!success) {
      if (expected.isNotEmpty) {
        //var str = expected.map((s) => toPrintable(s)).join('\', \'');
        var str = expected.map((s) => s).join('\', \'');
        throw 'Parser error at ($line, $column): expected \'$str\' but found \'$unexpected\'';
      } else {
        if (unexpected.isNotEmpty) {
          //throw 'Parser error at ($line, $column): unexpected "${toPrintable(unexpected)}"';
          throw 'Parser error at ($line, $column): unexpected "${unexpected}"';
        } else {
          throw 'Parser error at ($line, $column): unexpected end of file';
        }
      }
    }
    return (result as List).cast<_TemplateLine>();
  }

  _TemplateMultiLine _addMultiLine(List prefix, String key, List suffix) {
    var line = _TemplateMultiLine(_template);
    line._prefix = prefix.join();
    line._suffix = suffix.join();
    line._value = _template._addKey('#$key');
    return line;
  }

  _TemplateSingleLine _addSingleLine(List parts) {
    var line = _TemplateSingleLine(_template);
    line._parts = parts;
    return line;
  }
}
