# Users-tables
___
## association
has_many :groups, through: :user_groups
has_many :posts
___
## column/type
- user_name
- password
- group/reference
___

# Groups-tablee
___
## association
- has_many :users, through: :user_groups
- has_many :posts
___
## column/type
- group_name/string

# Posts-tables
___
## association
- belongs_to :user
- belongs_to :group
___
## column/type
- post/text
- text_image/text
- user/reference
- group/reference

# User_Group-tables
___
## association
- belongs_to :user
- belongs_to :group
___
## column/type
- user/reference
- group/reference
