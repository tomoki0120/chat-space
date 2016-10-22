# Users-tables
___
## association
- has_many :user_groups
- has_many :groups, through: :user_groups
- has_many :posts
___
## column/type
___

# Groups-tablee
___
## association
- has_many :user_groups
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
- message/text
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
