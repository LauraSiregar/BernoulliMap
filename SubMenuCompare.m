function varargout = SubMenuCompare(varargin)
% SUBMENUCOMPARE MATLAB code for SubMenuCompare.fig
%      SUBMENUCOMPARE, by itself, creates a new SUBMENUCOMPARE or raises the existing
%      singleton*.
%
%      H = SUBMENUCOMPARE returns the handle to a new SUBMENUCOMPARE or the handle to
%      the existing singleton*.
%
%      SUBMENUCOMPARE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUBMENUCOMPARE.M with the given input arguments.
%
%      SUBMENUCOMPARE('Property','Value',...) creates a new SUBMENUCOMPARE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SubMenuCompare_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SubMenuCompare_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SubMenuCompare

% Last Modified by GUIDE v2.5 09-Aug-2016 22:31:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SubMenuCompare_OpeningFcn, ...
                   'gui_OutputFcn',  @SubMenuCompare_OutputFcn, ...
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


% --- Executes just before SubMenuCompare is made visible.
function SubMenuCompare_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SubMenuCompare (see VARARGIN)

% Choose default command line output for SubMenuCompare
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SubMenuCompare wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SubMenuCompare_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
compareGrayscale;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
compareWarna;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
menu_utama;
close SubMenuCompare;
