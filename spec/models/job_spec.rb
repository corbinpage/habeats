require 'rails_helper'

RSpec.describe Job, :type => :model do

    describe "attach_documents(attributes = {})" do 
      it "attaches a single documnet" do
        job_params =
        {"job_type"=>"Copyediting",
        "messages_attributes"=>{"0"=>{"subject"=>"Something", "body"=>"Hello"}},
        "attachments_attributes"=>
          {"0"=>
            {"task_type"=>"inbound",
             # "attachment"=>
             #  [#<ActionDispatch::Http::UploadedFile:0x007fe39cc99a78
             #    @content_type="application/vnd.openxmlformats-officedocument.wordprocessingml.document",
             #    @headers=
             #     "Content-Disposition: form-data; name=\"job[attachments_attributes][0][attachment][]\"; filename=\"Test Proof Reading.docx\"\r\nContent-Type: application/vnd.openxmlformats-officedocument.wordprocessingml.document\r\n",
             #    @original_filename="Test Proof Reading.docx",
             #    @tempfile=
             #     #<File:/var/folders/l3/crk0c2k14xq049hj2s_ldqdm0000gn/T/RackMultipart20150103-44070-zevpfl>>]
            }
          }
        }
      end

      it "attaches multiple documents" do

      end
    end


end