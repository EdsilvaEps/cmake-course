# here we looked for the .so file on /usr using find -name *gtk*so
find_library(GTK3_LIBRARY 
                NAMES gtk-3) # look for the .so file on /usr/lib/x86_64-linux-gnu/libgtk-3.so

# here we looked for the .so file on /usr using find -name gtk.h
# result: 
# - standard path-   - header - 
# /usr/include/gtk-2.0/gtk/gtk.h
# /usr/include/gtk-3.0/gtk/gtk.h
find_path(GTK3_INCLUDE_DIR
            NAMES gtk/gtk.h
            PATH_SUFFIXES gtk-3.0)

    
find_path(GLIB_INCLUDE_DIR 
            NAMES glib.h
            PATH_SUFFIXES glib-2.0)   
            

# located in /usr/lib/x86_64-linux-gnu/glib-2.0/include/glibconfig.h
# a non-header location
find_path(GLIBCONFIG_INCLUDE_DIR
            NAMES glibconfig.h
            HINTS /usr/lib/x86_64-linux-gnu
            PATH_SUFFIXES glib-2.0/include)

find_path(PANGO_INCLUDE_DIR
            NAMES pango/pango.h
            PATH_SUFFIXES pango-1.0)   

find_path(HB_INCLUDE_DIR
            NAMES hb.h
            PATH_SUFFIXES harfbuzz)

find_path(CAIRO_INCLUDE_DIR
            NAMES cairo.h
            PATH_SUFFIXES cairo)

find_path(GDKPIXBUF_INCLUDE_DIR
            NAMES gdk-pixbuf/gdk-pixbuf.h
            PATH_SUFFIXES gdk-pixbuf-2.0)            

find_path(ATK_INCLUDE_DIR
            NAMES atk/atk.h
            PATH_SUFFIXES atk-1.0)            

# usr/bin/ld: /lib/x86_64-linux-gnu/libgio-2.0.so.0: error adding symbols: DSO missing from command line
# found /usr/lib/x86_64-linux-gnu/libgio-2.0.so
find_library(GIO_LIBRARY NAMES gio-2.0)
            
# /lib/x86_64-linux-gnu/libgobject-2.0.so.0
find_library(GOBJECT_LIBRARY NAMES gobject-2.0)

# checks if all the provided libraries and headers are set
# if so GTK3_FOUND is set true 
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(GTK3 DEFAULT_MSG
    GTK3_LIBRARY 
    GIO_LIBRARY 
    GOBJECT_LIBRARY
    GTK3_INCLUDE_DIR 
    GLIB_INCLUDE_DIR 
    GLIBCONFIG_INCLUDE_DIR
    PANGO_INCLUDE_DIR
    HB_INCLUDE_DIR
    GDKPIXBUF_INCLUDE_DIR
    ATK_INCLUDE_DIR)

if(GTK3_FOUND)

    set(GTK3_INCLUDE_DIRS 
        ${GTK3_INCLUDE_DIR} 
        ${GLIB_INCLUDE_DIR} 
        ${GLIBCONFIG_INCLUDE_DIR}
        ${PANGO_INCLUDE_DIR}
        ${HB_INCLUDE_DIR}
        ${CAIRO_INCLUDE_DIR}
        ${GDKPIXBUF_INCLUDE_DIR}
        ${ATK_INCLUDE_DIR})

    set(GTK3_LIBRARIES 
        ${GTK3_LIBRARY} 
        ${GIO_LIBRARY}
        ${GOBJECT_LIBRARY})

endif()



