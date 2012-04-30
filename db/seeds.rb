# Roles
MoulinRouge::Authorization.roles.each do |role|
  Role.find_or_create_by_name(role)
end

# Users
admin = User.find_or_create_by_username("admin") do |user|
  user.name         = "Administrator"
  user.password     = "abc1234"
  user.role         = Role.find_by_name(:admin)
end

editor = User.find_or_create_by_username("editor") do |user|
  user.name         = "Miranda Priestly"
  user.password     = "abc1234"
  user.role         = Role.find_by_name(:editor)
end

writer = User.find_or_create_by_username("writer") do |user|
  user.name         = "Christian Thompson"
  user.password     = "abc1234"
  user.role         = Role.find_by_name(:writer)
end

# Posts
first = Post.find_or_create_by_title("What is Lorem Ipsum?") do |post|
  post.user         = writer
  post.body         = "*Lorem Ipsum* is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
  post.is_approved  = true
end

second = Post.find_or_create_by_title("Where does it come from?") do |post|
  post.user         = writer
  post.body = %|
Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.
|.strip!
  post.is_approved  = true
end

third = Post.find_or_create_by_title("Why do we use it?") do |post|
  post.user         = writer
  post.body         = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."
  post.is_approved  = true
end

fourth = Post.find_or_create_by_title("Where can I get some?") do |post|
  post.user         = editor
  post.body         = "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc."
  post.is_approved  = false
end

# Comments
Comment.create(:post => first,  :from => "Jhon",    :message => "Just awesome!"             ) { |comment| comment.is_approved = true }
Comment.create(:post => first,  :from => "Cindy",   :message => "It was very usefull to me.") { |comment| comment.is_approved = true }
Comment.create(:post => first,  :from => "Carl",    :message => "I hated!"                  ) { |comment| comment.is_approved = false }

Comment.create(:post => second, :from => "Justin",  :message => "Boring..."                 ) { |comment| comment.is_approved = true }
Comment.create(:post => second, :from => "Carl",    :message => "TL; DR;"                   ) { |comment| comment.is_approved = false }

Comment.create(:post => third,  :from => "James",   :message => "Really interesting."       ) { |comment| comment.is_approved = true }