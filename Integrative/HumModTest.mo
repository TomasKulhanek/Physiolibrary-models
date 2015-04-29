model HumModTest
  extends HumMod.Main.test.HumMod_GolemEdition2;
  annotation(uses(Modelica(version = "3.2")), experiment(StartTime = 0, StopTime = 86400, Tolerance = 0.01, Interval = 1));
end HumModTest;