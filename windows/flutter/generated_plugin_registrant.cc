//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <platform_device_id_windows/platform_device_id_windows_plugin.h>
#include <sqlite3_flutter_libs/sqlite3_flutter_libs_plugin.h>
#include <url_launcher_windows/url_launcher_windows.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  PlatformDeviceIdWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("PlatformDeviceIdWindowsPlugin"));
  Sqlite3FlutterLibsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("Sqlite3FlutterLibsPlugin"));
  UrlLauncherWindowsRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("UrlLauncherWindows"));
}
