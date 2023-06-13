class Relationship < ApplicationRecord
  # カスタマーを参照するためにclass_nameにCustomer
  belongs_to :follower, class_name: "Customer"
  belongs_to :followed, class_name: "Customer"
end
