class UrlSplitter {
  static Map splitter(String url) {
    Map result = {
      'authority' : '',
      'unencodedPath' : '',

    };
    // 'https://example.org/path'
    // 'example.org', '/path'
    if (url.substring(0, 5) == 'https') {
      url = url.substring(8);
    } else if (url.substring(0, 4) == 'http') {
      url = url.substring(7);
    }
    int slashPosition = url.indexOf('/');
    result['authority'] = url.substring(0,slashPosition);
    result['unencodedPath'] = url.substring(slashPosition);
    return result;
  }
}
