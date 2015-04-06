namespace :db do
  desc "Create seed procedures"
  task seed: :environment do
    procedure = Procedure.new(
        name: "Total Knee Arthroplasty", 
        slug: "total-knee-arthroplasty", 
        category: "knee")

    procedure_detail = ProcedureDetail.new

    procedure_detail.indications_text = 
<<-eos
Severe knee pain limiting activities of daily living.
Severe rest pain or pain at night.
Chronic knee pain and swelling.
Knee deformity.
eos
    procedure_detail.benefits_text = 
<<-eos
Pain Alleviation
Improved Range of Motion
Improved Mobility
Improved Joint Alignment
Return to Previous Activities
eos
    procedure_detail.risks_text = 
<<-eos
Infection (0.3 – 1%)
Bleeding Requiring Transfusion (0.3 - 9.9%)
Nerve Injury (0.3 – 1.3%)
Intra-Operative Fracture (0.4%)
Deep Venous Thrombosis (0.4 – 2.3%)
Pulmonary Embolism (0.3 – 0.78%)
Stroke (0.1%)
Death (0.3 – 0.8%)
eos
    procedure_detail.alternatives_text =
<<-eos
Activity Modification
Non-Steroidal Anti-Inflammatory Medications
Corticosteroid Joint Injection
Hyaluronic Acid Joint Injection
eos
    procedure_detail.description_text = 
<<-eos
You will be admitted to the hospital the morning of your surgery where you will be visited by your surgeon and the 
anaesthesiologist managing your case. After all of your questions have been answered by the anaesthesiologist and a 
definitive plan for your anaesthesia has been selected by you and your anaesthesiologist in conjunction with your 
surgeon, you will be taken to the operating room. Any guests will be instructed as to a comfortable waiting location 
and kept updated regarding the surgery in accordance with your wishes. On arrival in the operating room you will 
move to the in-operating room table. When comfortable your anaesthesiologist will begin your sedation and begin 
your anaesthesia and muscle relaxation. You will remain sedated and unaware of the procedure for the entirety of 
the operation. 
Once you are sedated your surgeons will carefully position you in accordance with the postures necessary for the 
surgery. A tourniquet will be placed on your operative leg and inflated as needed during the surgery to limit any 
bleeding that might arise. Your leg will be cleaned and a sterile operating field will be set-up. An incision will be 
made through the skin carefully contouring around your kneecap. The subcutaneous soft tissues, tendon, and joint 
capsule will subsequently be incised to allow your surgeon to visualize your knee joint. Care will be taken to make 
the incision as small as possible while still gaining safe visualization and access to the joint surfaces. Once this has 
been attained, your surgeon will first evaluate your cartilage and bony landmarks. Any bony growths from your 
arthritis will then be removed from your joint surfaces. The damaged cartilage surfaces of the tibial (shin bone) and 
femoral (thigh bone) aspects of your joint will be removed along with any damaged surface of the underside of your 
patella (knee cap). A metal surface will then be matched to the size and shape of each side of your joint. Once an 
optimal alignment has been attained and the range of motion and stability of your joint have been evaluated with 
trial components,  final metal surfaces will be ordered, opened, and cemented to the joint surfaces. Next, a plastic 
insert will be placed between the two metal components. A plastic button will also be cemented to the undersurface 
of your knee cap. Following final evaluation and surgeon satisfaction with your joint alignment, range of motion, 
and stability, the joint capsule, tendons, and skin will be closed using sutures. A sterile bandage will be placed over 
the incision, and your anaesthesiologist will help you to wake back up. 
After a short period of recovery in the post-operative care unit, your guests will be guided to your bedside. You will 
then be moved to your assigned hospital room where you will be cared for as an inpatient until your pain is well 
controlled on oral medications and you are able to walk safely and cleared for discharge to home by the physical 
therapy team.
eos
    procedure_detail.post_op_text = 
<<-eos
You will be allowed to stand with full weight on your knee immediately following your surgery. While in the hospital you will be visited by your orthopaedic surgeon every day. You will also work with the occupational therapy and physical therapy teams every day. Once you have been able to safely walk with appropriate assistance and your pain is well managed with oral pain medications you will be ready for discharge to home. When you leave for home you will be provided with an ample supply of pain medication. Your pain medication needs will decline over the course of 1 to 2 weeks. You will also be visited by physical therapy at your home for the first few weeks after surgery.
eos

    procedure.procedure_detail = procedure_detail
    procedure.save
  end

end

namespace :users do
  desc "Creates proofreaders"
  task create_proofreaders: :environment do
    users = [
             {email: "Kkoenig226@gmail.com",          name: "Kate Koeinig"},
             {email: "sharonchen943@gmail.com",       name: "Sharon Chen"},
             {email: "corbin.page@gmail.com",         name: "Corbin Page"},
             {email: "anthony@blinkapplications.com", name: "Anthony Guidarelli"}]
    users.each do |user|
      user = User.new(
        email: user[:email], 
        name: user[:name], 
        password: "proofreader", 
        password_confirmation: "proofreader")
      user.proofreader!
      user.save
    end
  end

end
