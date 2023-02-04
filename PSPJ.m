function varargout = PSPJ(varargin)
% PSPJ MATLAB code for PSPJ.fig
%      PSPJ, by itself, creates a new PSPJ or raises the existing
%      singleton*.
%
%      H = PSPJ returns the handle to a new PSPJ or the handle to
%      the existing singleton*.
%
%      PSPJ('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PSPJ.M with the given input arguments.
%
%      PSPJ('Property','Value',...) creates a new PSPJ or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PSPJ_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PSPJ_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PSPJ

% Last Modified by GUIDE v2.5 26-Oct-2021 20:00:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PSPJ_OpeningFcn, ...
                   'gui_OutputFcn',  @PSPJ_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before PSPJ is made visible.
function PSPJ_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PSPJ (see VARARGIN)

% Choose default command line output for PSPJ
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PSPJ wait for user response (see UIRESUME)
% uiwait(handles.figure1);

T_b = readtable('stat.xlsx','Range','A5:C48');
m_b = table2array(T_b(1:42,2));
p_b = table2array(T_b(:,3));
T_s = readtable('stat.xlsx','Range','G5:H48');
m_s = table2array(T_s(1:42,1));
p_s = table2array(T_s(:,2));
t = 1:12;
t_a = datetime(2018,1,31)+calmonths(0:43);
t_b = datetime(2018,1,31)+calmonths(0:41);
m = table2array(readtable('stat.xlsx','Range','Y5:AD46'));
m_HH = m(:,1);
m_SME = m(:,2);
m_MME = m(:,3);
m_LME = m(:,4);
m_SPE = m(:,5);
p = table2array(readtable('stat.xlsx','Range','Q5:V48'));
p_HH = p(:,1);
p_SME = p(:,2);
p_MME = p(:,3);
p_LME = p(:,4);
p_SPE = p(:,5);

% --- Outputs from this function are returned to the command line.
function varargout = PSPJ_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

val1 = get(handles.popupmenu1,'Value');
string_list1 = get(handles.popupmenu1,'String');
a1type = string_list1{val1};
val2 = get(handles.popupmenu2,'Value');
string_list2 = get(handles.popupmenu2,'String');
a2type = string_list2{val2};

T_b = readtable('stat.xlsx','Range','A5:C48');
T_s = readtable('stat.xlsx','Range','G5:H48');
m = table2array(readtable('stat.xlsx','Range','Y5:AD46'));
p = table2array(readtable('stat.xlsx','Range','Q5:V48'));

m_b = table2array(T_b(1:42,2));
p_b = table2array(T_b(:,3));
m_s = table2array(T_s(1:42,1));
p_s = table2array(T_s(:,2));
percent1 = (m_b./m_s)*100-100;
percent2 = (p_b./p_s)*100-100;

t = 1:12;
t_a = datetime(2018,1,31)+calmonths(0:43);
t_b = datetime(2018,1,31)+calmonths(0:41);

m_HH = m(:,1);
m_SME = m(:,2);
m_MME = m(:,3);
m_LME = m(:,4);
m_SPE = m(:,5);

p_HH = p(:,1);
p_SME = p(:,2);
p_MME = p(:,3);
p_LME = p(:,4);
p_SPE = p(:,5);

cla(handles.axes1,'reset');
cla(handles.axes2,'reset');
%fig1
axes(handles.axes1);
switch a1type
    case 'Overall (2018-Jun 2021)'
yyaxis left
plot(t_b,m_b,'--b',t_b,m_s,'o-b');
ylim([3250 7000]);
ylabel('MEA (GWh)');
yyaxis right
plot(t_a,p_b,'--r',t_a,p_s,'o-r');
ylim([6500 14000]);
ylabel('PEA (GWh)');
legend('MEA Buy','MEA Sell','PEA Buy','PEA Sell');
title('การฟเปรียบเทียบหน่ายซื้อ - จำหน่ายไฟฟ้าของ กฟน. และ กฟภ.')
    case 'MEA Yearly'
yyaxis left
plot(t,m_s(1:12),'o-b',t,m_s(13:24),'o-r',t,m_s(25:36),'o-m',[1:6],m_s(37:42),'o-k');
ylim([3250 6250]);
ylabel('Buy (GWh)');
yyaxis right
plot(t,m_b(1:12),'x--b',t,m_b(13:24),'x--r',t,m_b(25:36),'x--m',[1:6],m_b(37:42),'x--k');
ylim([2250 5250]);
set(gca,'xtick',1:12,'xticklabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'})
xlim([0 13]);
ylabel('Sell (GWh)');
legend('2018 Buy','2019 Buy','2020 Buy','2021 Buy','2018 Sell','2019 Sell','2020 Sell','2021 Sell');
title('การฟเปรียบเทียบหน่ายซื้อ - จำหน่ายไฟฟ้าของ กฟน. รายเดือน')
    case 'PEA Yearly'
yyaxis left
plot(t,p_s(1:12),'o-b',t,p_s(13:24),'o-r',t,p_s(25:36),'o-m',[1:8],p_s(37:44),'o-k');
ylim([9000 15000]);
ylabel('Buy (GWh)');
yyaxis right
plot(t,p_b(1:12),'x--b',t,p_b(13:24),'x--r',t,p_b(25:36),'x--m',[1:8],p_b(37:44),'x--k');
ylim([7000 14000]);
set(gca,'xtick',1:12,'xticklabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'})
xlim([0 13]);
ylabel('Sell (GWh)');
legend('2018 Buy','2019 Buy','2020 Buy','2021 Buy','2018 Sell','2019 Sell','2020 Sell','2021 Sell');
title('การฟเปรียบเทียบหน่ายซื้อ - จำหน่ายไฟฟ้าของ กฟภ. รายเดือน')
    case 'Household'
yyaxis left
plot(t_b,m_HH,'o-b');
ylim([800 2000]);
ylabel('MEA (GWh)');
yyaxis right
plot(t_a,p_HH,'o-r');
ylim([1600 4000]);
ylabel('PEA (GWh)');
legend('MEA','PEA');
title('การฟเปรียบเทียบการจำหน่ายไฟฟ้าของ กฟน. และ กฟภ. ให้แก่ผู้ใช้ไฟฟ้าประเภทครัวเรือน')
    case 'SMEs'
yyaxis left
plot(t_b,m_SME,'o-b');
ylim([450 900]);
ylabel('MEA (GWh)');
yyaxis right
plot(t_a,p_SME,'o-r');
ylim([700 1350]);
ylabel('PEA (GWh)');
legend('MEA','PEA');
title('การฟเปรียบเทียบการจำหน่ายไฟฟ้าของ กฟน. และ กฟภ. ให้แก่ผู้ใช้ไฟฟ้าประเภทกิจการขนาดเล็ก')
    case 'MMEs'
yyaxis left
plot(t_b,m_MME,'o-b');
ylim([550 900]);
ylabel('MEA (GWh)');
yyaxis right
plot(t_a,p_MME,'o-r');
ylim([1300 2100]);
ylabel('PEA (GWh)');
legend('MEA','PEA');
title('การฟเปรียบเทียบการจำหน่ายไฟฟ้าของ กฟน. และ กฟภ. ให้แก่ผู้ใช้ไฟฟ้าประเภทกิจการขนาดกลาง')
    case 'LMEs'
yyaxis left
plot(t_b,m_LME,'o-b');
ylim([1150 1850]);
ylabel('MEA (GWh)');
yyaxis right
plot(t_a,p_LME,'o-r');
ylim([3300 5300]);
ylabel('PEA (GWh)');
legend('MEA','PEA');
title('การฟเปรียบเทียบการจำหน่ายไฟฟ้าของ กฟน. และ กฟภ. ให้แก่ผู้ใช้ไฟฟ้าประเภทกิจการขนาดใหญ่')
    case 'Hotels and Rentals'
yyaxis left
plot(t_b,m_SPE,'o-b');
ylim([100 225]);
ylabel('MEA (GWh)');
yyaxis right
plot(t_a,p_SPE,'o-r');
ylim([100 450]);
ylabel('PEA (GWh)');
legend('MEA','PEA');
title('การฟเปรียบเทียบการจำหน่ายไฟฟ้าของ กฟน. และ กฟภ. ให้แก่ผู้ใช้ไฟฟ้าประเภทกิจการเฉพาะอย่าง')
    case 'Percent'
cla(handles.axes1,'reset');
percent1 = (m_b./m_s)*100-100;
percent2 = (p_b./p_s)*100-100;
plot(t_b,percent1,'o-b',t_a,percent2,'o-r');
ylim([-2 14]);
legend('MEA','PEA');
ylabel('Percent (%)');
title('การฟเปรียบเทียบเปอร์เซ้นต์การซื้อเทียบกับการจำหน่ายไฟฟ้าของ กฟน. และ กฟภ.')
    case 'PEA SELL POLYFIT GRAPH (Jan)'
cla(handles.axes1,'reset');
YPs_all = log(table2array(readtable('stat.xlsx','Range','D136:U147')));
YPs_01 = YPs_all(1,1:17);
ty = linspace(2002,2022);
p1 = polyfit(2004:2020,YPs_01,1);
p2 = polyfit(2004:2020,YPs_01,2);
p3 = polyfit(2004:2020,YPs_01,3);
p4 = polyfit(2004:2020,YPs_01,4)
p5 = polyfit(2004:2020,YPs_01,5)
p6 = polyfit(2004:2020,YPs_01,6)
p7 = polyfit(2004:2020,YPs_01,7)
hold on
plot(2004:2021,YPs_all(1,:),'ok')
plot(ty,polyval(p1,ty),'-b');
plot(ty,polyval(p2,ty),'-r');
plot(ty,polyval(p3,ty),'-g');
plot(ty,polyval(p4,ty),'-m');
plot(ty,polyval(p5,ty),'-c');
plot(ty,polyval(p6,ty),'-k');
legend('real','n=1','n=2','n=3','n=4','n=5','n=6');
xlabel('Year (CE)');
ylabel('ln(Power Unit)');
title('กราฟ Natural Logarithm ของหน่วยขายไฟฟ้าของกฟภ. ในเดือนมกราคมในแต่ละปี');
hold off
    case 'PEA SELL R SQUARE (Jan)'
cla(handles.axes1,'reset');
YPs_all = log(table2array(readtable('stat.xlsx','Range','D136:U147')));
YPs_01 = YPs_all(1,1:17);
ty = linspace(2002,2022);
p1 = polyfit(2004:2020,YPs_01,1);
p2 = polyfit(2004:2020,YPs_01,2);
p3 = polyfit(2004:2020,YPs_01,3);
p4 = polyfit(2004:2020,YPs_01,4);
p5 = polyfit(2004:2020,YPs_01,5);
p6 = polyfit(2004:2020,YPs_01,6);
p7 = polyfit(2004:2020,YPs_01,7);
ss_t = sum((YPs_01-mean(YPs_01)).^2);
ss1_r = sum((YPs_01-polyval(p1,2004:2020)).^2);
ss2_r = sum((YPs_01-polyval(p2,2004:2020)).^2);
ss3_r = sum((YPs_01-polyval(p3,2004:2020)).^2);
ss4_r = sum((YPs_01-polyval(p4,2004:2020)).^2);
ss5_r = sum((YPs_01-polyval(p5,2004:2020)).^2);
ss6_r = sum((YPs_01-polyval(p6,2004:2020)).^2);
ss7_r = sum((YPs_01-polyval(p7,2004:2020)).^2);
R1_sq = 1-(ss1_r/ss_t);
R2_sq = 1-(ss2_r/ss_t);
R3_sq = 1-(ss3_r/ss_t);
R4_sq = 1-(ss4_r/ss_t);
R5_sq = 1-(ss5_r/ss_t);
R6_sq = 1-(ss6_r/ss_t);
R7_sq = 1-(ss7_r/ss_t);
R_sq = [R1_sq R2_sq R3_sq R4_sq R5_sq R6_sq R7_sq];
plot(1:7,R_sq,'o-b')
xlabel('n (Degree of Polynomial Regression)');
ylabel('R^2 (Coefficient of Determination)');
title('กราฟเปรียบเทียบค่าสัมประสิทธิ์ในการตัดสินใจของ Polynomial Regression ในแต่ละดีกรี');
end






















%fig2
axes(handles.axes2);
switch a2type
    case 'Overall (2018-Jun 2021)'
yyaxis left
plot(t_b,m_b,'--b',t_b,m_s,'o-b');
ylim([3250 7000]);
ylabel('MEA (GWh)');
yyaxis right
plot(t_a,p_b,'--r',t_a,p_s,'o-r');
ylim([6500 14000]);
ylabel('PEA (GWh)');
legend('MEA Buy','MEA Sell','PEA Buy','PEA Sell');
title('การฟเปรียบเทียบหน่ายซื้อ - จำหน่ายไฟฟ้าของ กฟน. และ กฟภ.')
    case 'MEA Yearly'
yyaxis left
plot(t,m_s(1:12),'o-b',t,m_s(13:24),'o-r',t,m_s(25:36),'o-m',[1:6],m_s(37:42),'o-k');
ylim([3250 6250]);
ylabel('Buy (GWh)');
yyaxis right
plot(t,m_b(1:12),'x--b',t,m_b(13:24),'x--r',t,m_b(25:36),'x--m',[1:6],m_b(37:42),'x--k');
ylim([2250 5250]);
set(gca,'xtick',1:12,'xticklabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'})
xlim([0 13]);
ylabel('Sell (GWh)');
legend('2018 Buy','2019 Buy','2020 Buy','2021 Buy','2018 Sell','2019 Sell','2020 Sell','2021 Sell');
title('การฟเปรียบเทียบหน่ายซื้อ - จำหน่ายไฟฟ้าของ กฟน. รายเดือน')
    case 'PEA Yearly'
yyaxis left
plot(t,p_s(1:12),'o-b',t,p_s(13:24),'o-r',t,p_s(25:36),'o-m',[1:8],p_s(37:44),'o-k');
ylim([9000 15000]);
ylabel('Buy (GWh)');
yyaxis right
plot(t,p_b(1:12),'x--b',t,p_b(13:24),'x--r',t,p_b(25:36),'x--m',[1:8],p_b(37:44),'x--k');
ylim([7000 14000]);
set(gca,'xtick',1:12,'xticklabel',{'Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'})
xlim([0 13]);
ylabel('Sell (GWh)');
legend('2018 Buy','2019 Buy','2020 Buy','2021 Buy','2018 Sell','2019 Sell','2020 Sell','2021 Sell');
title('การฟเปรียบเทียบหน่ายซื้อ - จำหน่ายไฟฟ้าของ กฟภ. รายเดือน')
    case 'Household'
yyaxis left
plot(t_b,m_HH,'o-b');
ylim([800 2000]);
ylabel('MEA (GWh)');
yyaxis right
plot(t_a,p_HH,'o-r');
ylim([1600 4000]);
ylabel('PEA (GWh)');
legend('MEA','PEA');
title('การฟเปรียบเทียบการจำหน่ายไฟฟ้าของ กฟน. และ กฟภ. ให้แก่ผู้ใช้ไฟฟ้าประเภทครัวเรือน')
    case 'SMEs'
yyaxis left
plot(t_b,m_SME,'o-b');
ylim([450 900]);
ylabel('MEA (GWh)');
yyaxis right
plot(t_a,p_SME,'o-r');
ylim([700 1350]);
ylabel('PEA (GWh)');
legend('MEA','PEA');
title('การฟเปรียบเทียบการจำหน่ายไฟฟ้าของ กฟน. และ กฟภ. ให้แก่ผู้ใช้ไฟฟ้าประเภทกิจการขนาดเล็ก')
    case 'MMEs'
yyaxis left
plot(t_b,m_MME,'o-b');
ylim([550 900]);
ylabel('MEA (GWh)');
yyaxis right
plot(t_a,p_MME,'o-r');
ylim([1300 2100]);
ylabel('PEA (GWh)');
legend('MEA','PEA');
title('การฟเปรียบเทียบการจำหน่ายไฟฟ้าของ กฟน. และ กฟภ. ให้แก่ผู้ใช้ไฟฟ้าประเภทกิจการขนาดกลาง')
    case 'LMEs'
yyaxis left
plot(t_b,m_LME,'o-b');
ylim([1150 1850]);
ylabel('MEA (GWh)');
yyaxis right
plot(t_a,p_LME,'o-r');
ylim([3300 5300]);
ylabel('PEA (GWh)');
legend('MEA','PEA');
title('การฟเปรียบเทียบการจำหน่ายไฟฟ้าของ กฟน. และ กฟภ. ให้แก่ผู้ใช้ไฟฟ้าประเภทกิจการขนาดใหญ่')
    case 'Hotels and Rentals'
yyaxis left
plot(t_b,m_SPE,'o-b');
ylim([100 225]);
ylabel('MEA (GWh)');
yyaxis right
plot(t_a,p_SPE,'o-r');
ylim([100 450]);
ylabel('PEA (GWh)');
legend('MEA','PEA');
title('การฟเปรียบเทียบการจำหน่ายไฟฟ้าของ กฟน. และ กฟภ. ให้แก่ผู้ใช้ไฟฟ้าประเภทกิจการเฉพาะอย่าง')
    case 'Percent'
percent1 = (m_b./m_s)*100-100;
percent2 = (p_b./p_s)*100-100;
plot(t_b,percent1,'o-b',t_a,percent2,'o-r');
ylim([-2 14]);
legend('MEA','PEA');
ylabel('Percent (%)');
title('การฟเปรียบเทียบเปอร์เซ้นต์การซื้อเทียบกับการจำหน่ายไฟฟ้าของ กฟน. และ กฟภ.')
    case 'PEA SELL POLYFIT GRAPH (Jan)'
cla(handles.axes2,'reset');
YPs_all = log(table2array(readtable('stat.xlsx','Range','D136:U147')));
YPs_01 = YPs_all(1,1:17);
ty = linspace(2002,2022);
p1 = polyfit(2004:2020,YPs_01,1);
p2 = polyfit(2004:2020,YPs_01,2);
p3 = polyfit(2004:2020,YPs_01,3);
p4 = polyfit(2004:2020,YPs_01,4)
p5 = polyfit(2004:2020,YPs_01,5)
p6 = polyfit(2004:2020,YPs_01,6)
p7 = polyfit(2004:2020,YPs_01,7)
hold on
plot(2004:2021,YPs_all(1,:),'ok')
plot(ty,polyval(p1,ty),'-b');
plot(ty,polyval(p2,ty),'-r');
plot(ty,polyval(p3,ty),'-g');
plot(ty,polyval(p4,ty),'-m');
plot(ty,polyval(p5,ty),'-c');
plot(ty,polyval(p6,ty),'-k');
legend('real','n=1','n=2','n=3','n=4','n=5','n=6');
xlabel('Year (CE)');
ylabel('ln(Power Unit)');
title('กราฟ Natural Logarithm ของหน่วยขายไฟฟ้าของกฟภ. ในเดือนมกราคมในแต่ละปี');
hold off
    case 'PEA SELL R SQUARE (Jan)'
cla(handles.axes2,'reset');
YPs_all = log(table2array(readtable('stat.xlsx','Range','D136:U147')));
YPs_01 = YPs_all(1,1:17);
ty = linspace(2002,2022);
p1 = polyfit(2004:2020,YPs_01,1);
p2 = polyfit(2004:2020,YPs_01,2);
p3 = polyfit(2004:2020,YPs_01,3);
p4 = polyfit(2004:2020,YPs_01,4);
p5 = polyfit(2004:2020,YPs_01,5);
p6 = polyfit(2004:2020,YPs_01,6);
p7 = polyfit(2004:2020,YPs_01,7);
ss_t = sum((YPs_01-mean(YPs_01)).^2);
ss1_r = sum((YPs_01-polyval(p1,2004:2020)).^2);
ss2_r = sum((YPs_01-polyval(p2,2004:2020)).^2);
ss3_r = sum((YPs_01-polyval(p3,2004:2020)).^2);
ss4_r = sum((YPs_01-polyval(p4,2004:2020)).^2);
ss5_r = sum((YPs_01-polyval(p5,2004:2020)).^2);
ss6_r = sum((YPs_01-polyval(p6,2004:2020)).^2);
ss7_r = sum((YPs_01-polyval(p7,2004:2020)).^2);
R1_sq = 1-(ss1_r/ss_t);
R2_sq = 1-(ss2_r/ss_t);
R3_sq = 1-(ss3_r/ss_t);
R4_sq = 1-(ss4_r/ss_t);
R5_sq = 1-(ss5_r/ss_t);
R6_sq = 1-(ss6_r/ss_t);
R7_sq = 1-(ss7_r/ss_t);
R_sq = [R1_sq R2_sq R3_sq R4_sq R5_sq R6_sq R7_sq];
plot(1:7,R_sq,'o-b')
xlabel('n (Degree of Polynomial Regression)');
ylabel('R^2 (Coefficient of Determination)');
title('กราฟเปรียบเทียบค่าสัมประสิทธิ์ในการตัดสินใจของ Polynomial Regression ในแต่ละดีกรี');
end
