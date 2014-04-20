-- ---------------------------------------------
-- egl.lua    2013/03/20
--   Copyright (c) 2013 Jun Mizutani, 
--   released under the MIT open source license.
-- ---------------------------------------------

local ffi = require "ffi"
local libegl = ffi.load("EGL")

ffi.cdef[[
  typedef int EGLint;
  typedef unsigned int EGLBoolean;
  typedef unsigned int EGLenum;
  typedef void *EGLConfig;
  typedef void *EGLContext;
  typedef void *EGLDisplay;
  typedef void *EGLSurface;
  typedef void *EGLClientBuffer;
  typedef void *EGLNativeDisplayType;
  typedef void *EGLNativePixmapType;
  typedef void *EGLNativeWindowType;

  EGLDisplay eglGetDisplay(EGLNativeDisplayType display_id);
  EGLBoolean eglInitialize(EGLDisplay dpy, EGLint *major, EGLint *minor);
  EGLBoolean eglChooseConfig(EGLDisplay dpy, const EGLint *attrib_list,
                           EGLConfig *configs, EGLint config_size,
                           EGLint *num_config);

  EGLSurface eglCreateWindowSurface(EGLDisplay dpy, EGLConfig config,
                                  EGLNativeWindowType win,
                                  const EGLint *attrib_list);

  EGLContext eglCreateContext(EGLDisplay dpy, EGLConfig config,
                            EGLContext share_context,
                            const EGLint *attrib_list);

  EGLBoolean eglMakeCurrent(EGLDisplay dpy, EGLSurface draw,
                          EGLSurface read, EGLContext ctx);

  EGLBoolean eglSwapBuffers(EGLDisplay dpy, EGLSurface surface);
]]

local egl = {
  NO_CONTEXT = ffi.cast("EGLContext", 0),
  NO_DISPLAY = ffi.cast("EGLDisplay", 0),
  NO_SURFACE = ffi.cast("EGLSurface", 0),
  ALPHA_SIZE = 0x3021,
  BLUE_SIZE  = 0x3022,
  GREEN_SIZE = 0x3023,
  RED_SIZE   = 0x3024,
  DEPTH_SIZE = 0x3025,
  NONE = 0x3038,
  CONTEXT_CLIENT_VERSION = 0x3098,
  DEFAULT_DISPLAY = 0,
  NO_CONTEXT = 0,
  NO_DISPLAY = 0,
  NO_SURFACE = 0,
  getDisplay = libegl.eglGetDisplay,
  initialize = libegl.eglInitialize,
  chooseConfig = libegl.eglChooseConfig,
  createWindowSurface = libegl.eglCreateWindowSurface,
  createContext = libegl.eglCreateContext,
  makeCurrent = libegl.eglMakeCurrent,
  swapBuffers = libegl.eglSwapBuffers
}

return egl