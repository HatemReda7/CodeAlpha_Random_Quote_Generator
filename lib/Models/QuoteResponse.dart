class QuoteResponse {
  QuoteResponse({
      this.quote, 
      this.author, 
      this.category,});

  QuoteResponse.fromJson(dynamic json) {
    quote = json['quote'];
    author = json['author'];
    category = json['category'];
  }
  String? quote;
  String? author;
  String? category;
}