/* English / Arabic switcher. Translates the page in place (text nodes,
   placeholders, titles, alert/confirm) and flips the layout to RTL.
   Strings without a translation simply stay in English. */
(function(){
const AR={
// navigation & shell
'Dashboard':'لوحة التحكم','Buildings':'المباني','Elevators':'المصاعد','Requests':'الطلبات','Daily Requests':'الطلبات اليومية','Reports':'التقارير','Owners':'المالكون','Technicians':'الفنيون','Technician Applications':'طلبات الفنيين','Companies':'الشركات','Platform Users':'مستخدمو المنصة','Installations & Commission':'التركيبات والعمولة','SUPER ADMIN':'المشرف العام','Super Admin':'المشرف العام','Platform owner':'مالك المنصة','Sign out':'تسجيل الخروج','Dark mode':'الوضع الداكن','Light mode':'الوضع الفاتح','ELEVATOR':'المصعد','Elevator':'المصعد','Admin':'المشرف','Admin control':'تحكم المشرف',
// generic
'Actions':'الإجراءات','Action':'الإجراء','Status':'الحالة','Company':'الشركة','All companies':'كل الشركات','All statuses':'كل الحالات','All priorities':'كل الأولويات','Name':'الاسم','Phone':'الهاتف','Email':'البريد الإلكتروني','Password':'كلمة المرور','Cancel':'إلغاء','Edit':'تعديل','Delete':'حذف','View':'عرض','Save %':'حفظ %','Sign in':'تسجيل الدخول','Activate':'تفعيل','Copy link':'نسخ الرابط','Copied ✓':'تم النسخ ✓',
'Active':'نشط','Inactive':'غير نشط','Suspended':'موقوف','Suspend':'إيقاف','Reactivate':'إعادة تفعيل','Pending':'قيد الانتظار','Accepted':'مقبول','Rejected':'مرفوض','Awarded':'تم الترسية','Open':'مفتوح','Assigned':'تم التعيين','In progress':'قيد التنفيذ','Completed':'مكتمل','Available':'متاح','Busy':'مشغول',
'Emergency':'طارئ','High':'عالية','Normal':'عادية','Priority':'الأولوية','Priority:':'الأولوية:',
'Operational':'يعمل','Maintenance':'صيانة','Out of Service':'خارج الخدمة','Out of service':'خارج الخدمة','Unassigned':'غير معيّن','Unknown':'غير معروف','Unknown owner':'مالك غير معروف','No phone':'لا يوجد هاتف','Not provided':'غير متوفر','Not set':'غير محدد','Not specified':'غير محدد','Just now':'الآن','Today':'اليوم','Unlimited':'غير محدود',
// owners / technicians
'Owner':'المالك','Owner:':'المالك:','Technician':'الفني','Contact':'الاتصال','Elevator details':'تفاصيل المصعد','+ Add owner':'+ إضافة مالك','+ Add technician':'+ إضافة فني','+ Elevator':'+ مصعد','Add technician':'إضافة فني','Add elevator':'إضافة مصعد','Edit owner':'تعديل المالك','Save owner':'حفظ المالك','Owner & elevator registry':'سجل المالكين والمصاعد','Full owner and elevator control.':'تحكم كامل في المالكين والمصاعد.','Every owner can have multiple buildings and elevators with full technical details.':'يمكن لكل مالك امتلاك عدة مبان ومصاعد بتفاصيل فنية كاملة.','Full admin control':'تحكم إداري كامل','Technician directory':'دليل الفنيين','Manage technicians and their service zones.':'إدارة الفنيين ومناطق خدمتهم.','Requests are assigned only to technicians matching the request zone.':'تُسند الطلبات فقط للفنيين في نفس منطقة الطلب.','Full name':'الاسم الكامل','Zone':'المنطقة','Owner name':'اسم المالك','Technician name':'اسم الفني','No elevators registered.':'لا توجد مصاعد مسجلة.','1. Owner details':'1. بيانات المالك','2. First elevator details':'2. بيانات المصعد الأول','Create owner & elevator':'إنشاء المالك والمصعد','Add owner + elevator':'إضافة مالك + مصعد','You can add the owner now with the first elevator. More elevators can be added later from the owner details.':'يمكنك إضافة المالك الآن مع أول مصعد، ويمكن إضافة مصاعد أخرى لاحقاً.',
// elevators
'Elevator registry':'سجل المصاعد','Technical details for every registered elevator.':'التفاصيل الفنية لكل مصعد مسجل.','Complete static technical inventory.':'قائمة فنية كاملة للمصاعد.','Building':'المبنى','Building name':'اسم المبنى','Floors':'الطوابق','Floor No.':'رقم الطابق','Elevator No.':'رقم المصعد','Machine':'الماكينة','Machine type':'نوع الماكينة','Door':'الباب','Door type':'نوع الباب','Capacity':'الحمولة','Speed':'السرعة','Installed':'سنة التركيب','Installation year':'سنة التركيب','Elevator status':'حالة المصعد','Gearless':'بدون تروس','Geared':'بتروس','Hydraulic':'هيدروليك','MRL':'بدون غرفة ماكينات','Automatic Center Opening':'أوتوماتيك فتح مركزي','Automatic Telescopic':'أوتوماتيك تلسكوبي','Automatic Side Opening':'أوتوماتيك فتح جانبي','Manual':'يدوي','Automatic':'أوتوماتيك','Center opening':'فتح مركزي','Side opening':'فتح جانبي','Telescopic':'تلسكوبي',
// requests
'Request assignment':'إسناد الطلبات','Request / Problem':'الطلب / المشكلة','Building / Elevator':'المبنى / المصعد','Date':'التاريخ','Request':'الطلب','Issue':'المشكلة','Assign':'تعيين','Reassign':'إعادة تعيين','Assign technician':'تعيين الفني','Review the complete customer problem before assigning a technician.':'راجع مشكلة العميل كاملة قبل تعيين الفني.','Owner contact, problem date, elevator and zone are visible before assignment.':'بيانات المالك وتاريخ المشكلة والمصعد والمنطقة ظاهرة قبل التعيين.','+ New request':'+ طلب جديد','Create daily request':'إنشاء طلب يومي','Create request':'إنشاء الطلب','Create, monitor and assign today\'s service requests.':'أنشئ وتابع واسند طلبات الخدمة اليومية.','Search request, building or elevator':'ابحث عن طلب أو مبنى أو مصعد','Describe the problem':'صف المشكلة','Request date':'تاريخ الطلب','Problem date:':'تاريخ المشكلة:','Building:':'المبنى:','No requests match the current filters.':'لا توجد طلبات مطابقة للفلاتر.','Requested by':'مقدم الطلب','Technician:':'الفني:',
'After creation, assign the request from the Requests page. Technician choices are filtered by zone.':'بعد الإنشاء، أسند الطلب من صفحة الطلبات. يتم ترشيح الفنيين حسب المنطقة.',
// technician applications
'Applicant':'المتقدم','Applicant notes':'ملاحظات المتقدم','Applied date':'تاريخ التقديم','Specializations':'التخصصات','Pending applications':'طلبات قيد الانتظار','Review queue':'قائمة المراجعة','New technician applications':'طلبات الفنيين الجديدة','Accepting an application automatically adds the technician to the technician directory.':'قبول الطلب يضيف الفني تلقائياً إلى دليل الفنيين.','Review new technician applications and approve or reject them.':'راجع طلبات الفنيين الجديدة واقبلها أو ارفضها.','Search name, phone, email, zone...':'ابحث بالاسم أو الهاتف أو البريد أو المنطقة...','No technician applications match the current filters.':'لا توجد طلبات مطابقة للفلاتر.','Rejection reason':'سبب الرفض','Optional reason for rejection':'سبب الرفض (اختياري)','✓ Accept':'✓ قبول','✕ Reject':'✕ رفض','✓ Accept application':'✓ قبول الطلب','✕ Reject application':'✕ رفض الطلب','Years experience':'سنوات الخبرة','Address':'العنوان',
// companies / users / onboarding
'Add company':'إضافة شركة','+ Add company':'+ إضافة شركة','Company name':'اسم الشركة','Contact phone':'هاتف التواصل','Plan':'الباقة','Team':'الفريق','Renewal':'التجديد','Renewal date':'تاريخ التجديد','Users':'المستخدمون','All users':'كل المستخدمين','User':'المستخدم','Role':'الدور','Total users':'إجمالي المستخدمين','Invite':'الدعوة','Invite pending':'الدعوة معلقة','Invite code':'رمز الدعوة','Invite code:':'رمز الدعوة:','Activation link:':'رابط التفعيل:','Search company...':'ابحث عن شركة...','Search name, email, role...':'ابحث بالاسم أو البريد أو الدور...','No companies found.':'لا توجد شركات.','No users found.':'لا يوجد مستخدمون.','Company Admin':'مدير الشركة','Basic':'أساسية','Pro':'احترافية','Enterprise':'مؤسسات','Monthly':'شهري','Annual':'سنوي','Billing period':'فترة الفوترة','Start date':'تاريخ البدء','Max elevators':'أقصى عدد للمصاعد','Max technicians':'أقصى عدد للفنيين','Save plan':'حفظ الباقة','Create company':'إنشاء الشركة','Admin name':'اسم المدير','Admin email':'بريد المدير','1. Company':'1. الشركة','2. Plan & billing':'2. الباقة والفوترة','3. Company admin (first login)':'3. مدير الشركة (أول دخول)','Every customer company on the platform. Suspend a company to block all its users.':'كل الشركات العميلة على المنصة. أوقف الشركة لحجب جميع مستخدميها.','Owners and technicians across companies. Suspend individual accounts.':'المالكون والفنيون عبر الشركات. يمكنك إيقاف الحسابات فردياً.','An invite code is generated. Send it to the admin so they can set their own password and open the company dashboard and app.':'يتم إنشاء رمز دعوة. أرسله للمدير ليضبط كلمة مروره ويفتح لوحة الشركة والتطبيق.','The admin opens the link, sets a password, and then signs in to the company dashboard and the mobile app with this email. The code works once.':'يفتح المدير الرابط ويضبط كلمة المرور ثم يسجل الدخول إلى لوحة الشركة والتطبيق بهذا البريد. الرمز يعمل مرة واحدة.','Activate your account':'فعّل حسابك','Enter your invite code and choose a password.':'أدخل رمز الدعوة واختر كلمة مرور.','New password':'كلمة مرور جديدة','Account activated':'تم تفعيل الحساب','Activate Account':'تفعيل الحساب',
'Sign in to the platform control panel.':'سجّل الدخول إلى لوحة تحكم المنصة.','Super Admin Login':'دخول المشرف العام',
// installations
'Installations':'التركيبات','Platform commission':'عمولة المنصة','Installation requests':'طلبات التركيب','Installation requests sent to companies, accepted offers, and your commission.':'طلبات التركيب المرسلة للشركات والعروض المقبولة وعمولتك.','Percentage kept from every accepted installation offer. Changing it affects only new acceptances.':'النسبة المحتفظ بها من كل عرض تركيب مقبول. التغيير يؤثر على القبولات الجديدة فقط.','Deal volume':'حجم الصفقات','Your commission earned':'عمولتك المكتسبة','Awarded':'تم الترسية','Winning company':'الشركة الفائزة','Price':'السعر','Commission':'العمولة','No installation requests yet.':'لا توجد طلبات تركيب بعد.',
// dashboard / reports / buildings
'Good morning, Owner':'صباح الخير','Elevator Owner Dashboard':'لوحة مالك المصاعد','Monitor your elevator operations at a glance.':'تابع تشغيل مصاعدك بنظرة واحدة.','Overview':'نظرة عامة','OVERVIEW':'نظرة عامة','Recent requests':'أحدث الطلبات','Open requests':'الطلبات المفتوحة','Active requests':'الطلبات النشطة','System uptime':'مدة التشغيل','Average uptime':'متوسط التشغيل','Avg. response':'متوسط الاستجابة','Total buildings':'إجمالي المباني','Total requests':'إجمالي الطلبات','Registered units':'المصاعد المسجلة','Healthy buildings':'المباني السليمة','Healthy':'سليم','Health':'الحالة الصحية','Attention':'تحتاج انتباه','Performance':'الأداء','Request analytics':'تحليلات الطلبات','Requests received by day.':'الطلبات المستلمة يومياً.','Latest maintenance activity':'آخر أنشطة الصيانة','Building registry':'سجل المباني','Static building registry and elevator health overview.':'سجل المباني ونظرة على حالة المصاعد.','Last inspection':'آخر فحص','Last 7 days':'آخر 7 أيام','Last 30 days':'آخر 30 يوماً','This year':'هذا العام','Live':'مباشر','Notifications':'الإشعارات','Time':'الوقت',
'Monitor':'متابعة','Here’s the latest status across your buildings.':'آخر حالة لمبانيك.','Static data':'بيانات ثابتة','Static operational analytics ready for API integration.':'تحليلات تشغيلية جاهزة للربط.','Static sample data ready to connect to the API.':'بيانات عينة جاهزة للربط.','Static service performance by operating zone.':'أداء الخدمة حسب المنطقة.',
'Nasr City':'مدينة نصر','Maadi':'المعادي','New Cairo':'القاهرة الجديدة','Heliopolis':'مصر الجديدة',
'View reports →':'عرض التقارير ←','View all →':'عرض الكل ←','Daily requests':'الطلبات اليومية','Zone performance':'أداء المناطق','Across 4 zones':'عبر 4 مناطق','Installing company':'الشركة المنفذة','Details':'التفاصيل','Offers':'العروض','Award':'ترسية','Winner':'الفائز','Days':'الأيام','Notes':'ملاحظات','Contact':'جهة الاتصال','Area':'المنطقة','Elevator type':'نوع المصعد','No notes provided.':'لا توجد ملاحظات.','No offers yet.':'لا توجد عروض بعد.','Control the installing company':'التحكم في الشركة المنفذة','Installation status':'حالة التركيب','Unpaid':'غير مدفوعة','Paid':'مدفوعة','Reassign to another bidder':'إعادة الإسناد إلى مقدم عرض آخر','Admin note':'ملاحظة المشرف','Internal note about this installation':'ملاحظة داخلية عن هذا التركيب','Save changes':'حفظ التغييرات','Revoke award & reopen':'سحب الترسية وإعادة الفتح','Cancelled':'ملغي','Open a request to see its full details and offers, and to control the company that took it.':'افتح الطلب لعرض تفاصيله وعروضه والتحكم في الشركة التي نفذته.',
'+ New installation request':'+ طلب تركيب جديد','New installation request':'طلب تركيب جديد','Share with all companies':'مشاركة مع كل الشركات','Requested by (company)':'مقدم الطلب (الشركة)','Contact name':'اسم جهة الاتصال','Area / zone':'المنطقة','Notes':'ملاحظات','Recommended':'الموصى به','★ Award recommended offer':'★ ترسية العرض الموصى به','+ Add offer manually':'+ إضافة عرض يدوياً','Add offer':'إضافة عرض','Price (EGP)':'السعر (ج.م)','Installation days':'أيام التركيب','Installation schedule':'جدول التركيب','Start date':'تاريخ البدء','Duration (days)':'المدة (أيام)','Installation lead':'مسؤول التركيب','Not assigned':'غير معيّن','Planned finish':'تاريخ الانتهاء المخطط','Shared with':'تمت المشاركة مع','Floors':'الطوابق','No offers yet. Companies that receive this request can bid from their app.':'لا توجد عروض بعد. يمكن للشركات المستلمة تقديم عروضها من التطبيق.','The request is shared with every active company. Their offers appear here so you can pick the best one.':'يتم إرسال الطلب لكل الشركات النشطة. تظهر عروضها هنا لاختيار الأفضل.','Anything the companies should know':'أي معلومات يجب أن تعرفها الشركات',
'Demo only. All data is sample data stored in your own browser.':'نسخة تجريبية فقط. جميع البيانات عينات محفوظة في متصفحك.','Mon':'الإثنين','Tue':'الثلاثاء','Wed':'الأربعاء','Thu':'الخميس','Fri':'الجمعة','Sat':'السبت','Sun':'الأحد'
};
const MONTHS={Jan:'يناير',Feb:'فبراير',Mar:'مارس',Apr:'أبريل',May:'مايو',Jun:'يونيو',Jul:'يوليو',Aug:'أغسطس',Sep:'سبتمبر',Oct:'أكتوبر',Nov:'نوفمبر',Dec:'ديسمبر'};
const PATTERNS=[
 [/^(\d+) operational$/,(m)=>m[1]+' يعمل'],
 [/^([+\-−]?[\d.]+%?) this month$/,(m)=>m[1]+' هذا الشهر'],
 [/^([+\-−]?[\d.]+%) vs previous$/,(m)=>m[1]+' مقارنة بالسابق'],
 [/^([\d.]+%) completion rate$/,(m)=>m[1]+' نسبة الإنجاز'],
 [/^([\d.]+%) of requests$/,(m)=>m[1]+' من الطلبات'],
 [/^([\d.]+%) healthy$/,(m)=>m[1]+' سليم'],
 [/^(\d+) buildings$/,(m)=>m[1]+' مبنى'],
 [/^−(\d+)m improvement$/,(m)=>'تحسن '+m[1]+' دقيقة'],
 [/^⚠ (\d+) emergency$/,(m)=>'⚠ '+m[1]+' طارئ'],
 [/^(\d+) kg \/ (\d+) persons$/,(m)=>m[1]+' كجم / '+m[2]+' أشخاص'],
 [/^Installation · (.+)$/,(m)=>'تركيب · '+m[1]],
 [/^(\d+) offer\(s\)$/,(m)=>m[1]+' عرض'],
 [/^Keep (.+)$/,(m)=>'إبقاء '+m[1]],
 [/^Award (\S+) to (.+) for (.+)\?$/,(m)=>'ترسية '+m[1]+' على '+m[2]+' بمبلغ '+m[3].replace(/^EGP (.*)$/,'$1 ج.م')+'؟'],
 [/^Reassign (\S+) from (.+) to (.+)\?$/,(m)=>'إعادة إسناد '+m[1]+' من '+m[2]+' إلى '+m[3]+'؟'],
 [/^Revoke the award and reopen this request for new decisions\?$/,()=>'سحب الترسية وإعادة فتح الطلب لاتخاذ قرار جديد؟'],
 [/^(\d+) offer\(s\) · shared with (\d+)$/,(m)=>m[1]+' عرض · تمت المشاركة مع '+m[2]],
 [/^(\d+) compan(y|ies)$/,(m)=>m[1]+' شركة'],
 [/^Add offer · (.+)$/,(m)=>'إضافة عرض · '+m[1]],
 [/^Best balance of price \(70%\) and installation time \(30%\): (.+)$/,(m)=>'أفضل توازن بين السعر (70%) ومدة التركيب (30%): '+m[1]],
 [/^Every eligible company has already made an offer\.$/,()=>'كل الشركات المؤهلة قدمت عروضها بالفعل.'],
 [/^(\d+) member\(s\)$/,(m)=>m[1]+' عضو'],
 [/^(\d+) building\(s\)$/,(m)=>m[1]+' مبنى'],
 [/^(\d+) units?$/,(m)=>m[1]+' وحدة'],
 [/^(\d+) units monitored$/,(m)=>m[1]+' وحدة تحت المراقبة'],
 [/^(\d+) registered elevators\.?$/,(m)=>m[1]+' مصعد مسجل.'],
 [/^(\d+) open$/,(m)=>m[1]+' مفتوح'],
 [/^(\d+) emergency$/,(m)=>m[1]+' طارئ'],
 [/^(\d+) min$/,(m)=>m[1]+' دقيقة'],
 [/^(\d+) min ago$/,(m)=>'منذ '+m[1]+' دقيقة'],
 [/^(\d+) hrs? ago$/,(m)=>'منذ '+m[1]+' ساعة'],
 [/^(\d+) days$/,(m)=>m[1]+' يوم'],
 [/^(\S+) elevators$/,(m)=>m[1]+' مصعد'],
 [/^(\S+) techs$/,(m)=>m[1]+' فني'],
 [/^Since (.+)$/,(m)=>'منذ '+m[1]],
 [/^EGP (.+)$/,(m)=>m[1]+' ج.م'],
 [/^Assign (#.+)$/,(m)=>'تعيين '+m[1]],
 [/^Add elevator for (.+)$/,(m)=>'إضافة مصعد للمالك '+m[1]],
 [/^Users · (.+)$/,(m)=>'المستخدمون · '+m[1]],
 [/^Your offer: (.+)$/,(m)=>'عرضك: '+m[1]],
 [/^No active technicians are registered for (.+)$/,(m)=>'لا يوجد فنيون نشطون مسجلون في '+m[1]],
 [/^Operational · (\d+)$/,(m)=>'يعمل · '+m[1]],
 [/^Maintenance · (\d+)$/,(m)=>'صيانة · '+m[1]],
 [/^Out of service · (\d+)$/,(m)=>'خارج الخدمة · '+m[1]],
 [/^(\d{1,2}) ([A-Z][a-z]{2}) (\d{4})$/,(m)=>MONTHS[m[2]]?m[1]+' '+MONTHS[m[2]]+' '+m[3]:null],
 // alert / confirm messages
 [/^Delete this owner and all elevators linked to the owner\?$/,()=>'حذف هذا المالك وكل المصاعد المرتبطة به؟'],
 [/^A user with this email already exists\.$/,()=>'يوجد مستخدم بهذا البريد بالفعل.'],
 [/^Enter a percentage between 0 and 100\.$/,()=>'أدخل نسبة بين 0 و 100.'],
 [/^Invalid credentials\.$/,()=>'بيانات الدخول غير صحيحة.'],
 [/^Invalid or already used invite code\.$/,()=>'رمز الدعوة غير صحيح أو مستخدم من قبل.'],
 [/^Password must be at least 6 characters\.$/,()=>'يجب ألا تقل كلمة المرور عن 6 أحرف.'],
 [/^Accept (.+) as a technician\?$/,(m)=>'قبول '+m[1]+' كفني؟'],
 [/^Suspend (.+)\? All its owners and technicians will be blocked from signing in\.$/,(m)=>'إيقاف '+m[1]+'؟ سيتم منع جميع المالكين والفنيين التابعين لها من الدخول.'],
 [/^Commission set to (.+)%\. It applies to offers accepted from now on; closed deals keep their rate\.$/,(m)=>'تم ضبط العمولة على '+m[1]+'%. تسري على العروض المقبولة من الآن، وتحتفظ الصفقات المغلقة بنسبتها.'],
 [/^(.+) can now sign in to the company dashboard and the app\.$/,(m)=>'يمكن لـ '+m[1]+' الآن تسجيل الدخول إلى لوحة الشركة والتطبيق.'],
 [/^Only technicians of (.+) registered in (.+) are available\.$/,(m)=>'المتاح فقط فنيو '+m[1]+' المسجلون في '+m[2]+'.']
];

let lang='en';
try{lang=localStorage.getItem('elevator-lang')||'en'}catch(e){}

function tr(s){
 if(Object.prototype.hasOwnProperty.call(AR,s))return AR[s];
 for(const [re,fn] of PATTERNS){const m=s.match(re);if(m){const r=fn(m);if(r!=null)return r}}
 for(const sep of [' · ',' - ',' — ']){
  if(s.includes(sep)){const parts=s.split(sep),out=parts.map(tr);if(out.some((o,i)=>o!==parts[i]))return out.join(sep)}
 }
 return s;
}
function translate(str){
 const lead=str.match(/^\s*/)[0],trail=str.match(/\s*$/)[0],core=str.trim();
 if(!core)return str;
 const out=tr(core);
 return out===core?str:lead+out+trail;
}

const recs=new WeakMap();
function skip(n){const p=n.parentElement;return !p||/^(SCRIPT|STYLE|TEXTAREA)$/.test(p.nodeName)||p.closest('[data-i18n-skip]')}
function applyText(n){
 if(skip(n))return;
 const rec=recs.get(n);
 const src=rec&&n.nodeValue===rec.out?rec.src:n.nodeValue;
 if(lang==='ar'){
  const out=translate(src);
  if(out!==n.nodeValue)n.nodeValue=out;
  recs.set(n,{src,out});
 }else if(rec&&n.nodeValue===rec.out){
  n.nodeValue=rec.src;recs.delete(n);
 }
}
function applyAttrs(el){
 for(const a of ['placeholder','title']){
  if(!el.hasAttribute||!el.hasAttribute(a))continue;
  const key='i18n'+a;
  if(el.dataset[key]===undefined)el.dataset[key]=el.getAttribute(a);
  const src=el.dataset[key];
  el.setAttribute(a,lang==='ar'?translate(src):src);
 }
}
function walk(root){
 if(root.nodeType===3){applyText(root);return}
 if(root.nodeType!==1)return;
 applyAttrs(root);
 root.querySelectorAll('[placeholder],[title]').forEach(applyAttrs);
 const w=document.createTreeWalker(root,NodeFilter.SHOW_TEXT);let n;
 while((n=w.nextNode()))applyText(n);
}

let titleSrc=null;
function applyTitle(){
 if(titleSrc===null)titleSrc=document.title;
 document.title=lang==='ar'?translate(titleSrc):titleSrc;
}

let obs;
function observe(){
 obs=new MutationObserver(muts=>{
  for(const m of muts){
   if(m.type==='characterData')applyText(m.target);
   else m.addedNodes.forEach(walk);
  }
  obs.takeRecords();
 });
 obs.observe(document.body,{childList:true,subtree:true,characterData:true});
}

function setDir(){
 const h=document.documentElement;
 h.lang=lang;h.dir=lang==='ar'?'rtl':'ltr';
 const b=document.getElementById('langBtn');
 if(b)b.innerHTML='🌐 <span data-i18n-skip>'+(lang==='ar'?'English':'العربية')+'</span>';
}
function setLang(l){
 lang=l;try{localStorage.setItem('elevator-lang',l)}catch(e){}
 setDir();applyTitle();walk(document.body);obs&&obs.takeRecords();
}

// wrap alert/confirm so dialogs follow the language
const _alert=window.alert.bind(window),_confirm=window.confirm.bind(window);
window.alert=m=>_alert(lang==='ar'?translate(String(m)):m);
window.confirm=m=>_confirm(lang==='ar'?translate(String(m)):m);

function init(){
 let b=document.getElementById('langBtn');
 if(!b){ // pages without the sidebar (login, activate)
  b=document.createElement('button');b.id='langBtn';b.className='small-btn';
  b.style.cssText='position:fixed;top:14px;inset-inline-end:14px;z-index:50';
  document.body.appendChild(b);
 }
 b.onclick=()=>setLang(lang==='ar'?'en':'ar');
 setDir();applyTitle();walk(document.body);observe();
}
if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',init);else init();
})();
