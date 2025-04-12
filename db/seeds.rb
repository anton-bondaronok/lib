# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

if ENV["CLEAR"] == "1"
  puts "clean up"
  Book.destroy_all
  Author.destroy_all
  Tag.destroy_all
  Genre.destroy_all
  User.destroy_all
end

User.create!(email: 'admin@example.com', full_name: "Admin", password: '1234QWER', role: 'super_admin')
User.create!(email: 'librarian@example.com', full_name: "Федор Книгорезов", password: '1234QWER', role: 'librarian')
User.create!(email: 'abondaronok@gmail.com', full_name: "Anton Бондаронок", password: '1234QWER', role: 'user')


def create_book(data, index: 1)
  genre = Genre.find_or_create_by(name: data[:genre])

  author = Author.find_or_create_by(full_name: data[:author])
  author.update(short_bio: data[:author_bio]) if author.short_bio.blank?

  tags = data[:tags]&.map do |tname|
    Tag.find_or_create_by(name: tname)
  end

  book = Book.new

  book.genre_id = genre.id
  book.author_id = author.id
  tags&.each { |tag| book.tags << tag }

  book.name = data[:name]
  book.description = data[:description]

  book.save!

  data[:filename] ||= index.to_s.rjust(2, "0") + ".jpg"

  book.avatar.attach(
    io: File.open(Rails.root.join("db/seeds/books/rus/#{data[:filename]}")),
    filename: data[:filename],
    content_type: "image/jpeg"
  )
end

[
  { "name": "Война и мир", "description": "Эпопея о войне 1812 года и судьбах русского общества.", "genre": "Роман", "author": "Лев Толстой", "author_bio": "Один из величайших русских писателей и мыслителей.", "tags": [ "классика", "война" ] },
  { "name": "Преступление и наказание", "description": "История студента, совершившего преступление и испытывающего муки совести.", "genre": "Роман", "author": "Фёдор Достоевский", "author_bio": "Знаменитый русский писатель, исследователь человеческой души.", "tags": [ "классика", "психология" ] },
  { "name": "Анна Каренина", "description": "Трагическая история любви замужней женщины и офицера.", "genre": "Роман", "author": "Лев Толстой", "author_bio": "Один из величайших русских писателей и мыслителей.", "tags": [ "классика", "любовь" ] },
  { "name": "Мастер и Маргарита", "description": "Роман о визите дьявола в атеистический Советский Союз.", "genre": "Роман", "author": "Михаил Булгаков", "author_bio": "Русский писатель и драматург, автор сатирических произведений.", "tags": [ "мистика", "сатира" ] },
  { "name": "Обитель", "description": "Роман о жизни в Соловецком лагере в 1920-х годах.", "genre": "Роман", "author": "Захар Прилепин", "author_bio": "Современный российский писатель и общественный деятель.", "tags": [ "история", "лагерь" ] },
  { "name": "Колыбельная для брата", "description": "История о детстве и семейных отношениях в послевоенное время.", "genre": "Повесть", "author": "Людмила Улицкая", "author_bio": "Современная российская писательница, автор психологической прозы.", "tags": [ "детство", "семья" ] },
  { "name": "Повесть о настоящем человеке", "description": "История летчика, потерявшего ноги на войне и вернувшегося в авиацию.", "genre": "Повесть", "author": "Борис Полевой", "author_bio": "Советский писатель и журналист, автор произведений о Великой Отечественной войне.", "tags": [ "война", "героизм" ] },
  { "name": "Дети капитана Гранта", "description": "Приключенческий роман о поисках пропавшего капитана.", "genre": "Приключения", "author": "Жюль Верн", "author_bio": "Французский писатель, основоположник жанра научной фантастики.", "tags": [ "приключения", "путешествия" ] },
  { "name": "Пётр Первый", "description": "Роман о жизни и деятельности российского императора Петра I.", "genre": "Исторический роман", "author": "Алексей Толстой", "author_bio": "Советский писатель, автор исторических и научно-фантастических произведений.", "tags": [ "история", "биография" ] },
  { "name": "Евгений Онегин", "description": "Роман в стихах о молодом дворянине и его трагической любви.", "genre": "Роман в стихах", "author": "Александр Пушкин", "author_bio": "Великий русский поэт и основоположник современного русского литературного языка.", "tags": [ "классика", "любовь" ] },
  { "name": "Горе от ума", "description": "Комедия о столкновении старых и новых взглядов в обществе.", "genre": "Комедия", "author": "Александр Грибоедов", "author_bio": "Русский дипломат, поэт и драматург, автор единственной пьесы, ставшей классикой.", "tags": [ "сатира", "общество" ] },
  { "name": "Ревизор", "description": "Комедия о чиновниках провинциального города, принявших проходимца за ревизора.", "genre": "Комедия", "author": "Николай Гоголь", "author_bio": "Русский прозаик и драматург, мастер сатиры и гротеска.", "tags": [ "сатира", "чиновники" ] },
  { "name": "Герой нашего времени", "description": "Роман о судьбе и характере лишнего человека в обществе.", "genre": "Роман", "author": "Михаил Лермонтов", "author_bio": "Русский поэт и прозаик, один из ключевых фигур русской литературы XIX века.", "tags": [ "психология", "классика" ] },
  { "name": "Муму", "description": "Трагическая история о любви и жертве крепостного крестьянина.", "genre": "Повесть", "author": "Иван Тургенев", "author_bio": "Русский писатель, мастер психологической прозы и социального анализа.", "tags": [ "крепостное право", "драма" ] }
].each_with_index { |data, i| create_book(data, index: i+1) }
