function varargout = lti_giu(varargin)
% LTI_GIU MATLAB code for lti_giu.fig
%      LTI_GIU, by itself, creates a new LTI_GIU or raises the existing
%      singleton*.
%
%      H = LTI_GIU returns the handle to a new LTI_GIU or the handle to
%      the existing singleton*.
%
%      LTI_GIU('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LTI_GIU.M with the given input arguments.
%
%      LTI_GIU('Property','Value',...) creates a new LTI_GIU or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lti_giu_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lti_giu_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lti_giu

% Last Modified by GUIDE v2.5 16-Feb-2023 21:20:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lti_giu_OpeningFcn, ...
                   'gui_OutputFcn',  @lti_giu_OutputFcn, ...
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


% --- Executes just before lti_giu is made visible.
function lti_giu_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lti_giu (see VARARGIN)

% Choose default command line output for lti_giu
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lti_giu wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lti_giu_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function numerator_1_Callback(hObject, eventdata, handles)
% hObject    handle to numerator_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numerator_1 as text
%        str2double(get(hObject,'String')) returns contents of numerator_1 as a double

num=get(hObject,'String');
num=textscan(num,'%f');
handles.num=cell2mat(num).';
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function numerator_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numerator_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function denominator_1_Callback(hObject, eventdata, handles)
% hObject    handle to denominator_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of denominator_1 as text
%        str2double(get(hObject,'String')) returns contents of denominator_1 as a double

den=get(hObject,'String');

den=textscan(den,'%f');
handles.den=cell2mat(den).';
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function denominator_1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to denominator_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in find_tf.
function find_tf_Callback(hObject, eventdata, handles)
% hObject    handle to find_tf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

sys=tf(handles.num, handles.den);
T= evalc('sys');
set(handles.tf_text, 'String', T);

% --- Executes on button press in compute.
function compute_Callback(hObject, eventdata, handles)
% hObject    handle to compute (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

switch handles.response
    case'1'
        cla;
        tx=length(impulse(handles.num,handles.den));
        t=0:tx-1; ft=zeros(1,tx); %creates zero line
        impulse(handles.num, handles.den); hold on; plot(t,ft,'r'); hold off; grid;
    case'2'
        cla;
        tx=length(step(handles.num,handles.den));
        t=0:tx-1; ft=ones(1,tx); %creates step function
        step(handles.num, handles.den); hold on; plot(t,ft,'r'); hold off; grid;
    case'3'
        cla;
        [~,t0]=step(tf(handles.num, handles.den));
        T=t0(end);
        den1=[handles.den 0];
        [y, t]= step(tf(handles.num, den1));
        I=find(t==T);
        plot(t(1:I),y(1:I), t(1:I), t(1:I), 'r'); xlim([0,T]);
        title('Ramp Response'); xlabel('Time(seconds'); ylabel('Amplitude'); grid;

    case'4'
        cla;
        bode(handles.num, handles.den); grid;

    case'5'
        cla;
        rlocus(handles.num, handles.den); grid;

    case'6'
        cla;
        nyquist(handles.num, handles.den); grid;

    case'7'
        cla;
        nichols(handles.num, handles.den); grid;

    case'8'
        cla;
        sys=tf(handles.num, handles.den);
        pzmap(sys)
        h = findobj(gca, 'Type', 'Line');
        h(2).LineWidth = 3; h(2).MarkerSize=15; h(2).Color='b';
        h(3).LineWidth = 3; h(3).MarkerSize=15; h(3).Color='r';

end
guidata(hObject,handles);




% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

switch get(eventdata.NewValue, 'Tag') % get tag of selected object
    case 'impulse_button'
        handles.response='1';

    case 'step_button'
        handles.response='2';

    case 'ramp_button'
        handles.response='3';

    case 'freq_button'
        handles.response='4';

    case 'root_button'
        handles.response='5';

    case 'nyquist_plot'
        handles.response='6';

    case 'nichols_button'
        handles.response='7';

    case 'pole_0_button'
        handles.response='8';
end
guidata(hObject,handles);
