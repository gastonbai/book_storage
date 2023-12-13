class BookCreate {
  final String title;
  final String publisher;
  final String author;
  final String year;
  final String pageCount;

  BookCreate({
    this.title = '',
    this.publisher = '',
    this.author = '',
    this.year = '',
    this.pageCount = '',
  });
}

extension BookCopy on BookCreate {
  BookCreate copyWith({
    String? title,
    String? publisher,
    String? author,
    String? year,
    String? pageCount,
  }) {
    return BookCreate(
      title: title ?? this.title,
      publisher: publisher ?? this.publisher,
      author: author ?? this.author,
      year: year ?? this.year,
      pageCount: pageCount ?? this.pageCount,
    );
  }
}


extension BookComplition on BookCreate {
  bool get isTitleComplete {
    return true; //реализовать проверку Д,з
  }

  bool get isAuthorComplete {
    return true; //реализовать проверку Д,з
  }

  bool get isPageCountComplete {
    return true; //реализовать проверку Д,з
  }

  bool get isComplete =>
      isTitleComplete && isAuthorComplete && isPageCountComplete;
}

extension BookValidation on BookCreate {
  bool get isTitleValid {
    return true; //реализовать для каждого поля
  }

  bool get isYearValid {
    return int.tryParse(year) != null; //реализовать для каждого поля
  }
}
