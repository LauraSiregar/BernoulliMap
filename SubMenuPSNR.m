function varargout = SubMenuPSNR(varargin)
% SUBMENUPSNR MATLAB code for SubMenuPSNR.fig
%      SUBMENUPSNR, by itself, creates a new SUBMENUPSNR or raises the existing
%      singleton*.
%
%      H = SUBMENUPSNR returns the handle to a new SUBMENUPSNR or the handle to
%      the existing singleton*.
%
%      SUBMENUPSNR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SUBMENUPSNR.M with the given input arguments.
%
%      SUBMENUPSNR('Property','Value',...) creates a new SUBMENUPSNR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SubMenuPSNR_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SubMenuPSNR_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SubMenuPSNR

% Last Modified by GUIDE v2.5 23-Aug-2016 10:09:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SubMenuPSNR_OpeningFcn, ...
                   'gui_OutputFcn',  @SubMenuPSNR_OutputFcn, ...
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


% --- Executes just before SubMenuPSNR is made visible.
function SubMenuPSNR_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SubMenuPSNR (see VARARGIN)

% Choose default command line output for SubMenuPSNR
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SubMenuPSNR wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SubMenuPSNR_OutputFcn(hObject, eventdata, handles) 
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
comMSEgray;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
comMSE;

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
menu_utama;
close SubMenuPSNR;
