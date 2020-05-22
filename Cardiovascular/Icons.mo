within Cardiovascular;
package Icons
  model Arteries

    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Bitmap(
                extent={{-87.243,-87.3037},{87.243,87.3037}},
                fileName=
              "modelica://Cardiovascular/Resources/Icons/Arteries.png",
            origin={4.25124,18.8661},
                rotation=75)}), Diagram(coordinateSystem(preserveAspectRatio=
              false)));

  end Arteries;

  class Atrium

    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Bitmap(extent={{-100,-100},{100,100}}, fileName=
            "modelica://Cardiovascular/Resources/Icons/Atrium.png")}),
        Diagram(coordinateSystem(preserveAspectRatio=false)));
  end Atrium;

  class Cardio

    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Bitmap(extent={{-100,-100},{100,100}}, fileName=
            "modelica://Cardiovascular/Resources/Icons/Cardio.png"),Bitmap(
            extent={{-50,-38},{52,62}}, fileName=
            "modelica://Cardiovascular/Resources/Icons/Cross.png")}), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end Cardio;

  class ECMO

    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Bitmap(extent={{-100,-100},{100,100}}, fileName=
                "modelica://Cardiovascular/Resources/Icons/ECMO.png")}),
        Diagram(coordinateSystem(preserveAspectRatio=false)));
  end ECMO;

  class Heart_detailed

    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Bitmap(extent={{-100,-100},{100,100}}, fileName=
            "modelica://Cardiovascular/Resources/Icons/Heart_detailed.png")}),
        Diagram(coordinateSystem(preserveAspectRatio=false)));
  end Heart_detailed;

  class O2

    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Bitmap(extent={{-100,-100},{100,100}}, fileName=
            "modelica://Cardiovascular/Resources/Icons/O2.png")}), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end O2;

  class Screw

    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Bitmap(
            extent={{-100,-100},{100,100}},
                fileName=
              "modelica://Cardiovascular/Resources/Icons/Screw.png",
            origin={2,-4},
            rotation=90)}), Diagram(coordinateSystem(preserveAspectRatio=
              false)));
  end Screw;

  class Settings

    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Bitmap(extent={{-100,-100},{100,100}}, fileName=
                "modelica://Cardiovascular/Resources/Icons/Settings.png")}),
        Diagram(coordinateSystem(preserveAspectRatio=false)));
  end Settings;

    class Valve

    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Bitmap(extent={{-100,-100},{100,100}}, fileName=
            "modelica://Cardiovascular/Resources/Icons/Valve.png")}), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
    end Valve;

    class Ventricle

    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Bitmap(extent={{-100,-100},{100,100}}, fileName=
            "modelica://Cardiovascular/Resources/Icons/Ventricle.png")}),
        Diagram(coordinateSystem(preserveAspectRatio=false)));
    end Ventricle;

    class Vessels

    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
            Bitmap(
            extent={{-130.465,-88.1195},{130.465,88.1195}},
            origin={0.99971,8.9994},
            rotation=-68,
                fileName=
              "modelica://Cardiovascular/Resources/Icons/Vessels.png")}),
        Diagram(coordinateSystem(preserveAspectRatio=false)));

    end Vessels;

  model Runnable_System

    annotation (
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-20,-40},{
              20,40}}), graphics),
      Icon(coordinateSystem(extent={{-20,-40},{20,40}}, preserveAspectRatio=
              false), graphics={
          Text(
            extent={{-40,-42},{40,-50}},
            lineColor={0,0,255},
            textString="%name"),
          Ellipse(lineColor={75,138,73}, extent={{-20,-20},{20,20}}),
          Polygon(
            lineColor={0,0,255},
            fillColor={75,138,73},
            pattern=LinePattern.None,
            fillPattern=FillPattern.Solid,
            points={{-8,12},{12,0},{-8,-12},{-8,12}})}),
      Documentation(info="<html>
<p>Architectural model of cardiovascular subsystems. The partial subsystems are meant to be redeclared by the implemented submodels.</p>
</html>"));
  end Runnable_System;

  model Runnable_Shallow
    annotation (
      Diagram(coordinateSystem(extent={{-280,-140},{280,180}},
            preserveAspectRatio=false), graphics),
      Icon(coordinateSystem(extent={{-280,-140},{280,180}},
            preserveAspectRatio=false), graphics={Ellipse(
                lineColor={75,138,73},
                  fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                extent={{-156,-140},{164,180}}),Polygon(
                lineColor={0,0,255},
                fillColor={75,138,73},
                pattern=LinePattern.None,
                fillPattern=FillPattern.Solid,
                  points={{-68,118},{104,16},{-68,-82},{-68,118}})}),
      experiment(StopTime=5, __Dymola_NumberOfIntervals=5000),
      Documentation(info="<html>
<p>Cardiovascular model implemented per description of Meurs et al.</p>
<p>[9] J. A. Goodwin, W. L. van Meurs, C. D. S a Couto, J. E. W. Beneken, S. A. Graves, A Model for Educational Simulation of Infant Cardiovascular Physiology, Anesthesia &AMP; Analgesia 99 (6) (2004) 1655&ndash;1664. doi:10.1213/01.ANE.0000134797.52793.AF.</p>
<p>[10] C. D. S a Couto, W. L. van Meurs, J. A. Goodwin, P. Andriessen, A Model for Educational Simulation of Neonatal Cardiovascular Pathophysiology, Simulation in Healthcare 1 (Inaugural) (2006) 4&ndash;12.</p>
<p>[11] W. van Meurs, Modeling and Simulation in Biomedical Engineering: Applications in Cardiorespiratory Physiology, McGraw-Hill Professional, 2011.</p>
</html>"));
  end Runnable_Shallow;
end Icons;
