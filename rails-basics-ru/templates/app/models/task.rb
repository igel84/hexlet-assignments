# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  completed   :boolean          not null
#  creator     :string           not null
#  description :text
#  name        :string           not null
#  performer   :string
#  status      :string           default("new"), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Task < ApplicationRecord
  validates_presence_of %i[name creator status]
end
