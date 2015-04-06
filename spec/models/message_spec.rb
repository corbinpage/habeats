require 'rails_helper'

RSpec.describe Message, :type => :model do
  
  describe "initialize_from_homepage(attributes = {})" do 
    it "initializes instance variables from the contact us form, WITHOUT DOCUMENT" do
      params = {}
      params[:message] = {"name"=>"Thomas Surgent",
                "email"=>"surgentt@gmail.com",
                "telephone"=>"6102910277",
                "body"=>"Test Message"}
      @message = Message.new
      @message.initialize_from_homepage(params[:message])
      expect(@message.subject).to eq("Received Contact Us Via Home Page")
      expect(@message.name).to    eq("Thomas Surgent")
      expect(@message.email).to   eq("surgentt@gmail.com")
      expect(@message.body).to    eq("Test Message 6102910277")
      expect(@message.telephone).to  eq("6102910277")
    end

    it "initializes instance variables from the contact us form, WITH DOCUMENT" do
      pending 'Need to figure out how to attach or moc a document in rspec'
      this_should_not_get_executed
    end
  end

  describe "initialize_from_mailgun(params)" do 
    it "Initializes instance variables from Mailgun, WITHOUT DOCUMENT, GMAIL" do
      params = {"recipient"=>"support@proofypudding.com",
       "sender"=>"support@proofypudding.com",
       "subject"=>"Test Subject - No Document",
       "from"=>"Thomas Surgent <support@proofypudding.com>",
       "X-Envelope-From"=>"<support@proofypudding.com>",
       "Received"=>"by 10.229.234.4 with HTTP; Wed, 5 Nov 2014 11:05:52 -0800 (PST)",
       "Dkim-Signature"=>
        "v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113; h=mime-version:date:message-id:subject:from:to:content-type; bh=xtErPuH2sDUNY7SAMnbWdhQSqIfKjBgw8AeMGd6ElkU=; b=rHJQXYZ5NUVGlVUQuAZIhi9644+eCzljO1hPxCYXW+ksJGRyjMad3eHG58D8nMOveU jP4a213lQrASh8TIzSlwwMlJrtexT8dPtgzrEJSUMgs4o1x6rVMyuLif7pS6UXIDGIAc BjH1rufOt5kj2x+N6U92oFV17EcM50EvPAECVb9iyddx3u99QSxrUcSLhvuzZxnNeBC4 oWxDRWhgCc519zVAsTNulyuEdLQSHwwz1+7PmyAKHwsQc/OShWEDaO54iYMj1mEE8WTG 5xZJtKg3MnyPtBnqs+hRQ6BlKQwvWWALQTb3Clysw2ox1BGo1SooTbKY5CIb6n8bHBFo r3Ww==",
       "Mime-Version"=>"1.0",
       "X-Received"=>
        "by 10.224.45.65 with SMTP id d1mr90473340qaf.43.1415214352458; Wed, 05 Nov 2014 11:05:52 -0800 (PST)",
       "Date"=>"Wed, 5 Nov 2014 14:05:52 -0500",
       "Message-Id"=>"<CANzftZ4E9a9Rh4piRKqbKr8W41LGLUWTfNCtuA7v=mx0GB9KaA@mail.gmail.com>",
       "Subject"=>"Test Message - No Document",
       "From"=>"Thomas Surgent <support@proofypudding.com>",
       "To"=>"support@proofypudding.com",
       "Content-Type"=>"multipart/alternative; boundary=\"001a11c29a4cc268bf05072144dc\"",
       "X-Mailgun-Incoming"=>"Yes",
       "message-headers"=>
        "[[\"X-Envelope-From\", \"<support@proofypudding.com>\"], [\"Received\", \"from mail-qg0-f67.google.com (mail-qg0-f67.google.com [209.85.192.67]) by mxa.mailgun.org with ESMTP id 545a7513.d19c6b0-in1; Wed, 05 Nov 2014 19:05:55 -0000 (UTC)\"], [\"Received\", \"by mail-qg0-f67.google.com with SMTP id q107so3109122qgd.6 for <support@proofypudding.com>; Wed, 05 Nov 2014 11:05:54 -0800 (PST)\"], [\"Dkim-Signature\", \"v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113; h=mime-version:date:message-id:subject:from:to:content-type; bh=xtErPuH2sDUNY7SAMnbWdhQSqIfKjBgw8AeMGd6ElkU=; b=rHJQXYZ5NUVGlVUQuAZIhi9644+eCzljO1hPxCYXW+ksJGRyjMad3eHG58D8nMOveU jP4a213lQrASh8TIzSlwwMlJrtexT8dPtgzrEJSUMgs4o1x6rVMyuLif7pS6UXIDGIAc BjH1rufOt5kj2x+N6U92oFV17EcM50EvPAECVb9iyddx3u99QSxrUcSLhvuzZxnNeBC4 oWxDRWhgCc519zVAsTNulyuEdLQSHwwz1+7PmyAKHwsQc/OShWEDaO54iYMj1mEE8WTG 5xZJtKg3MnyPtBnqs+hRQ6BlKQwvWWALQTb3Clysw2ox1BGo1SooTbKY5CIb6n8bHBFo r3Ww==\"], [\"Mime-Version\", \"1.0\"], [\"X-Received\", \"by 10.224.45.65 with SMTP id d1mr90473340qaf.43.1415214352458; Wed, 05 Nov 2014 11:05:52 -0800 (PST)\"], [\"Received\", \"by 10.229.234.4 with HTTP; Wed, 5 Nov 2014 11:05:52 -0800 (PST)\"], [\"Date\", \"Wed, 5 Nov 2014 14:05:52 -0500\"], [\"Message-Id\", \"<CANzftZ4E9a9Rh4piRKqbKr8W41LGLUWTfNCtuA7v=mx0GB9KaA@mail.gmail.com>\"], [\"Subject\", \"Test Message - No Document\"], [\"From\", \"Thomas Surgent <support@proofypudding.com>\"], [\"To\", \"support@proofypudding.com\"], [\"Content-Type\", \"multipart/alternative; boundary=\\\"001a11c29a4cc268bf05072144dc\\\"\"], [\"X-Mailgun-Incoming\", \"Yes\"]]",
       "timestamp"=>"1415214375",
       "token"=>"ed327c558eeff8b0cc5655b4e3d1a3ea85ae0735578d567e2a",
       "signature"=>"4d603bac9b636069c922b73d7196629447e503e41280ed16ecdb4174ef7fcad8",
       "body-plain"=>"Here is a test document\r\n\r\nTom Surgent\r\n",
       "body-html"=>"<div dir=\"ltr\">Here is a test document<div><br></div><div>Tom Surgent</div></div>\r\n",
       "stripped-html"=>"<div dir=\"ltr\">Here is a test document<div><br></div><div>Tom Surgent</div></div>\r\n",
       "stripped-text"=>"Here is a test document\r\n",
       "stripped-signature"=>"Tom Surgent",
       "action"=>"mailgun_receive_email",
       "controller"=>"messages"}
      @message = Message.new
      @message.initialize_from_mailgun(params)
      expect(@message.subject).to eq("Test Subject - No Document")
      expect(@message.name).to    eq("Tom Surgent")
      expect(@message.email).to   eq("support@proofypudding.com")
      expect(@message.body).to    eq("Here is a test document\r\n\r\nTom Surgent\r\n")
    end

    it "Initializes instance variables from Mailgun, WITHOUT DOCUMENT, GMAIL" do
      pending 'Need to figure out how to attach or moc a document in rspec'
      this_should_not_get_executed
    end

    it "can correctly classify a reply" do 
      reply={"recipient"=>"dev@projectdoublecheck.com",
       "sender"=>"surgentt@gmail.com",
       "subject"=>"Re: Your proofreading job is complete.",
       "from"=>"Thomas Surgent <surgentt@gmail.com>",
       "X-Envelope-From"=>"<surgentt@gmail.com>",
       "Received"=>"by 10.202.228.20 with HTTP; Tue, 6 Jan 2015 10:36:03 -0800 (PST)",
       "Dkim-Signature"=>
        "v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113; h=mime-version:in-reply-to:references:date:message-id:subject:from:to :content-type; bh=weDxZHkjsKEZQnfXtjB0dhFgkEhIuhtFOGSUgiHtPZ0=; b=ICIg/2an0TQ8mjOtdr3F0AMyVsbdHEpbJXftqjGZHZ+8BBcjmuknWBoArNoVFg/w9r 5vocne+JxGsVeqoOa3ve+gBrtgcwKCPLsbZ66eNkFAORP7BmP08wvfVODFGi/3wxhowO cDEEY4WS+U7BmPsFkI6KTgz3p8psxb+kUi6wKYgI4SCimoL36N5W5vi5K9ZFr7kk6BYi LpGB9Oh++WscycxZnWGxdLVYqZCBADLXBdnLzP2H9GIW5GliXep5wbNQfWHcBCZZV1hq A8kH9zu8iwT/Gnh77wwh5zwHMnceceGcRE8ps2WNz9BAlbsXixh6V/rmKpfL/j27ih+y f15g==",
       "Mime-Version"=>"1.0",
       "X-Received"=>"by 10.60.102.200 with SMTP id fq8mr49271229oeb.2.1420569363393; Tue, 06 Jan 2015 10:36:03 -0800 (PST)",
       "In-Reply-To"=>"<20150106183527.72571.37575@projectdoublecheck.com>",
       "References"=>"<20150106183527.72571.37575@projectdoublecheck.com>",
       "Date"=>"Tue, 6 Jan 2015 13:36:03 -0500",
       "Message-Id"=>"<CABUatoyVX80V_M7TthP=1Bet2rAoP7pmf3yvdDcVydX+5XMiPg@mail.gmail.com>",
       "Subject"=>"Re: Your proofreading job is complete.",
       "From"=>"Thomas Surgent <surgentt@gmail.com>",
       "To"=>"dev@projectdoublecheck.com",
      \"",
       "X-Mailgun-Incoming"=>"Yes",
       "message-headers"=>
      ailgun-Incoming\", \"Yes\"]]",
       "timestamp"=>"1420569398",
       "token"=>"d8c75fd430b07877dcb40eb514bb81197c30c1927150d1306f",
      ,
       "body-plain"=>
      ://www.projectdoublecheck.com/\r\n>\r\n",
       "body-html"=>
      \r\n",
      il_extra\"><br><br></div></body></html>",
       "stripped-text"=>"Great Job!",
       "stripped-signature"=>"",
       "controller"=>"messages",
       "action"=>"mailgun_receive_email"}
    end
  end
end
