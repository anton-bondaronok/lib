# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

if ENV["CLEAR"] == "1"
  puts "clean up"
  Book.destroy_all
  Author.destroy_all
  Tag.destroy_all
  Genre.destroy_all
end

[
  "Fiction", "Non-Fiction", "Mystery", "Thriller", "Science Fiction", "Fantasy",
  "Romance", "Historical Fiction", "Biography", "Self-Help", "Philosophy", "Classics",
  "Horror", "Young Adult", "Children's Books", "Graphic Novels", "Poetry", "Drama",
  "Adventure", "Short Stories", "Crime", "Humor", "Dystopian", "Mythology",
  "Spirituality", "Cookbooks", "Travel", "Science", "Business", "Education"
].each do |genre_name|
  Genre.find_or_create_by!(name: genre_name)
end

[
  "top-1000-books", "for-kids", "bestsellers", "new-arrivals", "award-winning",
  "must-read", "classic-literature", "summer-reads", "holiday-specials", "inspirational",
  "book-club-favorite", "staff-picks", "dark-and-gritty", "lighthearted", "page-turner",
  "slow-burn", "based-on-true-story", "film-adaptations", "underrated-gems", "epic-sagas",
  "thought-provoking", "romantic-tales", "twists-and-turns", "educational", "short-and-sweet",
  "long-and-immersive", "translated-literature", "debut-authors", "timeless-classics", "hidden-gems"
].each do |tag_name|
  Tag.find_or_create_by!(name: tag_name)
end

[
  { full_name: "Jane Austen", short_bio: "English novelist known for 'Pride and Prejudice' and 'Sense and Sensibility'." },
  { full_name: "George Orwell", short_bio: "English writer and journalist, author of '1984' and 'Animal Farm'." },
  { full_name: "J.K. Rowling", short_bio: "British author best known for the 'Harry Potter' series." },
  { full_name: "Leo Tolstoy", short_bio: "Russian writer, known for 'War and Peace' and 'Anna Karenina'." },
  { full_name: "Mark Twain", short_bio: "American writer and humorist, known for 'The Adventures of Huckleberry Finn'." },
  { full_name: "Ernest Hemingway", short_bio: "American novelist and journalist, author of 'The Old Man and the Sea'." },
  { full_name: "Agatha Christie", short_bio: "British crime writer famous for Hercule Poirot and Miss Marple series." },
  { full_name: "Charles Dickens", short_bio: "English novelist known for 'Oliver Twist' and 'Great Expectations'." },
  { full_name: "Virginia Woolf", short_bio: "English writer, pioneer of modernist literature and stream of consciousness." },
  { full_name: "Fyodor Dostoevsky", short_bio: "Russian novelist, known for 'Crime and Punishment' and 'The Brothers Karamazov'." },
  { full_name: "Gabriel García Márquez", short_bio: "Colombian writer, Nobel laureate, author of 'One Hundred Years of Solitude'." },
  { full_name: "J.R.R. Tolkien", short_bio: "British writer, known for 'The Lord of the Rings' and 'The Hobbit'." },
  { full_name: "Herman Melville", short_bio: "American novelist, best known for 'Moby-Dick'." },
  { full_name: "Harper Lee", short_bio: "American author of 'To Kill a Mockingbird'." },
  { full_name: "Mary Shelley", short_bio: "British writer, best known for 'Frankenstein'." },
  { full_name: "Oscar Wilde", short_bio: "Irish poet and playwright, author of 'The Picture of Dorian Gray'." },
  { full_name: "Franz Kafka", short_bio: "Austrian writer known for 'The Metamorphosis' and 'The Trial'." },
  { full_name: "Emily Brontë", short_bio: "English novelist and poet, best known for 'Wuthering Heights'." },
  { full_name: "Bram Stoker", short_bio: "Irish writer, known for 'Dracula'." },
  { full_name: "H.G. Wells", short_bio: "English writer, known for 'The War of the Worlds' and 'The Time Machine'." },
  { full_name: "Arthur Conan Doyle", short_bio: "Scottish writer, creator of Sherlock Holmes." },
  { full_name: "Edgar Allan Poe", short_bio: "American writer, famous for Gothic tales and detective fiction." },
  { full_name: "Louisa May Alcott", short_bio: "American novelist, best known for 'Little Women'." },
  { full_name: "Jack London", short_bio: "American novelist, known for 'The Call of the Wild'." },
  { full_name: "Jules Verne", short_bio: "French writer, known for adventure novels like 'Twenty Thousand Leagues Under the Sea'." },
  { full_name: "Nathaniel Hawthorne", short_bio: "American writer, best known for 'The Scarlet Letter'." },
  { full_name: "Aldous Huxley", short_bio: "English writer, best known for 'Brave New World'." },
  { full_name: "Ray Bradbury", short_bio: "American author, known for 'Fahrenheit 451'." },
  { full_name: "Dante Alighieri", short_bio: "Italian poet, best known for 'The Divine Comedy'." },
  { full_name: "Homer", short_bio: "Ancient Greek poet, author of 'The Iliad' and 'The Odyssey'." },
  { full_name: "Miguel de Cervantes", short_bio: "Spanish writer, author of 'Don Quixote'." },
  { full_name: "T.S. Eliot", short_bio: "American-British poet, known for 'The Waste Land'." },
  { full_name: "James Joyce", short_bio: "Irish writer, known for 'Ulysses' and 'Dubliners'." },
  { full_name: "Robert Louis Stevenson", short_bio: "Scottish novelist, known for 'Treasure Island'." },
  { full_name: "Victor Hugo", short_bio: "French novelist, best known for 'Les Misérables' and 'The Hunchback of Notre-Dame'." },
  { full_name: "George Eliot", short_bio: "English novelist, author of 'Middlemarch'." },
  { full_name: "Tennessee Williams", short_bio: "American playwright, known for 'A Streetcar Named Desire'." },
  { full_name: "Anton Chekhov", short_bio: "Russian playwright and short-story writer." },
  { full_name: "William Golding", short_bio: "British writer, known for 'Lord of the Flies'." },
  { full_name: "John Steinbeck", short_bio: "American writer, known for 'The Grapes of Wrath'." },
  { full_name: "Emily Dickinson", short_bio: "American poet, known for her unique style and themes of death and immortality." },
  { full_name: "Sylvia Plath", short_bio: "American poet and novelist, known for 'The Bell Jar'." },
  { full_name: "Lewis Carroll", short_bio: "English writer, known for 'Alice's Adventures in Wonderland'." },
  { full_name: "Anne Frank", short_bio: "Jewish diarist, known for 'The Diary of a Young Girl'." },
  { full_name: "Cormac McCarthy", short_bio: "American novelist, known for 'The Road' and 'No Country for Old Men'." },
  { full_name: "Margaret Atwood", short_bio: "Canadian writer, known for 'The Handmaid's Tale'." },
  { full_name: "Philip K. Dick", short_bio: "American writer, known for 'Do Androids Dream of Electric Sheep?'" },
  { full_name: "Chinua Achebe", short_bio: "Nigerian writer, known for 'Things Fall Apart'." },
  { full_name: "Haruki Murakami", short_bio: "Japanese writer, known for 'Norwegian Wood' and 'Kafka on the Shore'." },
  { full_name: "Kazuo Ishiguro", short_bio: "British novelist, known for 'Never Let Me Go' and 'The Remains of the Day'." }
].each_with_index do |author_data, i|
  author = Author.create!(full_name: author_data[:full_name], short_bio: author_data[:short_bio])

  filename = "author_#{i + 1}.jpg"
  avatar_path = Rails.root.join("db/seeds/avatars", filename)
  author.avatar.attach(io: File.open(avatar_path), filename: filename) if File.exist?(avatar_path)
end

[
  { name: "The Silent Patient", description: "A psychological thriller about a woman who stops speaking after a traumatic event." },
  { name: "To Kill a Mockingbird", description: "A novel about racial injustice and childhood in the American South." },
  { name: "1984", description: "A dystopian tale of surveillance and totalitarianism." },
  { name: "Pride and Prejudice", description: "A classic romance novel about Elizabeth Bennet and Mr. Darcy." },
  { name: "The Hobbit", description: "A fantasy adventure following Bilbo Baggins and his quest for treasure." },
  { name: "Moby-Dick", description: "A whaling adventure exploring obsession and revenge." },
  { name: "War and Peace", description: "A historical epic about Russian society during the Napoleonic era." },
  { name: "Brave New World", description: "A novel about a futuristic society where people are controlled by pleasure and technology." },
  { name: "Crime and Punishment", description: "A philosophical novel exploring guilt and redemption." },
  { name: "Great Expectations", description: "A coming-of-age story about ambition and social class." },
  { name: "The Catcher in the Rye", description: "A novel about teenage alienation and rebellion." },
  { name: "Frankenstein", description: "A gothic horror novel about a scientist creating life." },
  { name: "Wuthering Heights", description: "A tragic love story set on the Yorkshire moors." },
  { name: "Les Misérables", description: "A novel exploring justice, redemption, and revolution in France." },
  { name: "Dracula", description: "A vampire horror novel about Count Dracula's attempt to spread his curse." },
  { name: "The Odyssey", description: "An epic Greek poem about Odysseus's journey home." },
  { name: "The Divine Comedy", description: "A poetic journey through Hell, Purgatory, and Paradise." },
  { name: "Jane Eyre", description: "A novel about a governess's struggle for love and independence." },
  { name: "The Picture of Dorian Gray", description: "A novel about a man whose portrait ages instead of him." },
  { name: "Anna Karenina", description: "A tragic love story set in Russian high society." },
  { name: "The Metamorphosis", description: "A novella about a man who wakes up transformed into an insect." },
  { name: "Don Quixote", description: "A satire about a man who imagines himself a knight." },
  { name: "One Hundred Years of Solitude", description: "A magical realism tale of the Buendía family." },
  { name: "The Brothers Karamazov", description: "A philosophical novel exploring faith, doubt, and family dynamics." },
  { name: "A Tale of Two Cities", description: "A novel set during the French Revolution." },
  { name: "Fahrenheit 451", description: "A dystopian novel about book burning and censorship." },
  { name: "The Stranger", description: "An existentialist novel about a detached man's trial for murder." },
  { name: "Beloved", description: "A novel about the psychological trauma of slavery." },
  { name: "The Grapes of Wrath", description: "A novel about the struggles of a poor family during the Great Depression." },
  { name: "The Alchemist", description: "A philosophical novel about following one's dreams." }
].each_with_index do |data, i|
  book = Book.create!(
    name: data[:name],
    description: data[:description],
    genre: Genre.order("RANDOM()").first,
    author: Author.order("RANDOM()").first
  )

  filename = "#{(i + 1).to_s.rjust(10, "0")}.jpg"
  book_path = Rails.root.join("db/seeds/books", filename)
  book.avatar.attach(io: File.open(book_path), filename: filename) if File.exist?(book_path)

  # Assign 1-3 random tags
  Tag.order("RANDOM()").limit(rand(1..3)).pluck(:id).each do |tag_id|
    book.book_tags.create!(tag_id: tag_id)
  end
end
