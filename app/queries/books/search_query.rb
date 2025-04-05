module Books
  class SearchQuery
    def initialize(query: nil, tag_id: nil, genre_id: nil, author_id: nil)
      @relation = Book.all
      @query = query
      @tag_id = tag_id
      @genre_id = genre_id
      @author_id = author_id
    end

    def call
      @relation = base
      @relation = by_query
      @relation = by_tag
      @relation = by_author
      @relation = by_genre
      @relation
    end

    private

    attr_reader :relation, :tag_id, :query, :author_id, :genre_id

    def base
      relation.joins(:author, :genre).includes(:author, :genre, avatar_attachment: :blob).order(:name).distinct
    end

    def by_query
      return relation if query.blank?

      relation.where(
        "books.name ILIKE :q OR books.description ILIKE :q OR authors.full_name ILIKE :q OR genres.name ILIKE :q",
        q: "%#{query}%"
      )
    end

    def by_tag
      return relation if tag_id.blank?

      relation.joins(:tags).where(tags: { id: tag_id })
    end

    def by_genre
      return relation if genre_id.blank?

      relation.where(genre_id: genre_id)
    end

    def by_author
      return relation if author_id.blank?

      relation.where(author_id: author_id)
    end
  end
end
