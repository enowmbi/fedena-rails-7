#Fedena
#Copyright 2011 Foradian Technologies Private Limited
#
#This product includes software developed at
#Project Fedena - http://www.projectfedena.org/
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

class FinanceFee < ApplicationRecord
  
  belongs_to :finance_fee_collection ,:foreign_key => 'fee_collection_id'
  has_many   :finance_transactions ,:as=>:finance
  has_many :components, :class_name => 'FinanceFeeComponent', :foreign_key => 'fee_id'
  belongs_to :student


  def check_transaction_done
    unless self.transaction_id.nil?
      return true
    else
      return false
    end
  end

  def former_student
    ArchivedStudent.find_by_former_id(self.student_id)
  end
end
