import
  std/[strutils, osproc]
proc getXbpsPkgs*(): string =
  let
    count = osproc.execCmdEx("cat ~/.x-q 2>/dev/null")[0]
  discard osproc.startProcess("setsid", workingDir = "/usr/bin", args = ["xbps-query -l >| ~/.x-q"])
  $(count.split("\n").len - 1)
