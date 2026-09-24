(function(){if(sessionStorage.getItem('super-admin')!=='1')location.replace('login.html')})();
const links=[['index.html','⌂','Dashboard'],['buildings.html','▦','Buildings'],['elevators.html','↕','Elevators'],['requests.html','⚙','Requests'],['daily_requests.html','◷','Daily Requests'],['reports.html','▥','Reports'],['owners.html','♙','Owners'],['technicians.html','♙','Technicians'],['technician_applications.html','✓','Technician Applications'],['companies.html','🏢','Companies'],['platform_users.html','👥','Platform Users'],['installations.html','🛠','Installations & Commission']];
document.querySelector('.sidebar').innerHTML=`<div class="brand"><div class="brand-mark">E</div><div><b>ELEVATOR</b><span>SUPER ADMIN</span></div></div><nav>${links.map(x=>`<a href="${x[0]}" class="${location.pathname.endsWith(x[0])?'active':''}">${x[1]} <span>${x[2]}</span></a>`).join('')}</nav><div class="side-bottom"><button id="langBtn">🌐 <span data-i18n-skip>العربية</span></button><button id="themeBtn">☾ <span>Dark mode</span></button><div class="user-mini"><div class="avatar">A</div><div><b>Super Admin</b><small>Platform owner</small></div></div><button id="logoutBtn">⎋ <span>Sign out</span></button></div>`;
const saved=localStorage.getItem('elevator-theme');if(saved==='dark')document.body.classList.add('dark');
const btn=document.getElementById('themeBtn');
function theme(){document.body.classList.toggle('dark');localStorage.setItem('elevator-theme',document.body.classList.contains('dark')?'dark':'light');btn.innerHTML=document.body.classList.contains('dark')?'☀ <span>Light mode</span>':'☾ <span>Dark mode</span>'}
btn.onclick=theme;btn.innerHTML=document.body.classList.contains('dark')?'☀ <span>Light mode</span>':'☾ <span>Dark mode</span>';
const menu=document.getElementById('menu');if(menu)menu.onclick=()=>document.querySelector('.sidebar').classList.toggle('mobile-open');
function logout(){sessionStorage.removeItem('super-admin');location.replace('login.html')}
document.getElementById('logoutBtn').onclick=logout;
// second logout button in the page header so it is reachable on phones, where the sidebar is hidden
{const h=document.querySelector('main header');if(h){const b=document.createElement('button');b.className='logout-top';b.innerHTML='⎋ <span>Sign out</span>';b.onclick=logout;h.appendChild(b)}}

{const i=document.createElement('script');i.src='js/i18n.js';document.body.appendChild(i)}
