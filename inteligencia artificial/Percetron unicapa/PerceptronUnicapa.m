function varargout = PerceptronUnicapa(varargin)
% PERCEPTRONUNICAPA MATLAB code for PerceptronUnicapa.fig
%      PERCEPTRONUNICAPA, by itself, creates a new PERCEPTRONUNICAPA or raises the existing
%      singleton*.
%
%      H = PERCEPTRONUNICAPA returns the handle to a new PERCEPTRONUNICAPA or the handle to
%      the existing singleton*.
%
%      PERCEPTRONUNICAPA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PERCEPTRONUNICAPA.M with the given input arguments.
%
%      PERCEPTRONUNICAPA('Property','Value',...) creates a new PERCEPTRONUNICAPA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PerceptronUnicapa_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PerceptronUnicapa_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PerceptronUnicapa

% Last Modified by GUIDE v2.5 30-Mar-2021 18:18:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PerceptronUnicapa_OpeningFcn, ...
                   'gui_OutputFcn',  @PerceptronUnicapa_OutputFcn, ...
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

function PerceptronUnicapa_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PerceptronUnicapa (see VARARGIN)

% Choose default command line output for PerceptronUnicapa
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

function varargout = PerceptronUnicapa_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


function PesoYUmbralbtton_Callback(hObject, eventdata, handles)
global yd1;
global u;
global x0;
global xentrada;
global numeroEntradas;
global w;
if(numeroEntradas==3)
x=-1 + (1+1)*rand(1,4);
w1=x(1);
w2=x(2);
w3=x(3);
u=x(4);
x0=1;
w=[w1,w2,w3];


set(handles.peso1txt,'string',w1);
set(handles.peso2txt,'string',w2);
set(handles.peso3txt,'string',w3);
set(handles.umbraltxt,'string',u);
set(handles.x0txt, 'string', x0);
else
x=-1 + (1+1)*rand(1,3);
w1=x(1);
w2=x(2);
u=x(3);
x0=1;
w=[w1,w2];
set(handles.peso1txt,'string',w1);
set(handles.peso2txt,'string',w2);
set(handles.umbraltxt,'string',u);
set(handles.x0txt, 'string', x0);
end



function StartBtton_Callback(hObject, eventdata, handles)

global w;
global xentrada;
global u;
global yd1;
global pesoideal;
global umbralideal;
iteraciones = str2double(get(handles.iteracionestxt,'String'));
error=str2double(get(handles.errortxt,'String'));
rata=str2double(get(handles.ratatxt,'String'));

myObj = train;
[erms,itera,pesoideal,umbralideal] = myObj.Entrenar(iteraciones, error, xentrada, yd1, w,u,rata)
plot (handles.axes2,itera,erms);

%guidata(hObject,handles);



% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% --------------------------------------------------------------------

function importarexcelMenu_Callback(hObject, eventdata, handles)
% hObject    handle to importarexcelMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global yd1;
global xentrada;
global validacion;
global numeroEntradas;

[nombre, direccion]=uigetfile({'*.xlsx','archivo excel'},'escoge un archivo');
[M, string, full] = xlsread([direccion, nombre]);
NombresCol = full(1,:);
full(1,:)=[];
NumeracionFilas= 1:size(full,1);
set(handles.patronesTable, 'Data', full, 'ColumnName', NombresCol, 'Rowname',...
    NumeracionFilas);

    x1 = xlsread([direccion, nombre],'A:A');
    x2 = xlsread([direccion, nombre],'B:B');
   validacion = xlsread([direccion, nombre],'D:D');
    
if isempty(validacion)
  yd1 = xlsread([direccion, nombre],'C:C') ;
  xentrada=[x1,x2]
 
  numeroEntradas=2;
else 
 x3 = xlsread([direccion, nombre],'C:C');
 xentrada=[x1,x2,x3]
 yd1 = xlsread([direccion, nombre],'D:D');
 
 numeroEntradas=3;
end

guidata(hObject,handles);
 
function iteracionestxt_Callback(hObject, eventdata, handles)
% hObject    handle to iteracionestxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of iteracionestxt as text
%        str2double(get(hObject,'String')) returns contents of iteracionestxt as a double
% --- Executes during object creation, after setting all properties.

function iteracionestxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iteracionestxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function errortxt_Callback(hObject, eventdata, handles)
% hObject    handle to errortxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of errortxt as text
%        str2double(get(hObject,'String')) returns contents of errortxt as a double
% --- Executes during object creation, after setting all properties.

function errortxt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to errortxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function ratatxt_Callback(hObject, eventdata, handles)
% hObject    handle to ratatxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of ratatxt as text
%        str2double(get(hObject,'String')) returns contents of ratatxt as a double
% --- Executes during object creation, after setting all properties.

function ratatxt_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on selection change in FuncionActivationbox.

function FuncionActivationbox_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% 


% --- Executes on button press in simulacionbtton.
function simulacionbtton_Callback(hObject, eventdata, handles)
global pesoideal;
global umbralideal;
handles.pesoi=pesoideal;
handles.umbrali=umbralideal;
guidata(hObject, handles);
handles
Simulacion;

% hObject    handle to simulacionbtton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
