within ;
package Physiolibraryold "Physiological domains library"
  extends Physiolibraryold.Icons.GolemLib;

  package Interfaces "Abstract Interfaces"
    partial model BaseModel
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,127,0},
              fillColor={215,215,215},
              fillPattern=FillPattern.Sphere), Text(
              extent={{-100,-74},{100,-52}},
              lineColor={0,0,177},
              fillPattern=FillPattern.VerticalCylinder,
              fillColor={215,215,215},
              textString="%name")}), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end BaseModel;

    partial model BaseFactorIcon
      RealInput_ yBase annotation (Placement(transformation(extent={{-20,-20},{
                20,20}},
            rotation=270,
            origin={6,80}),
            iconTransformation(extent={{-10,10},{10,30}}, rotation=-90)));
      RealOutput_ y annotation (Placement(transformation(extent={{-20,-20},{20,
                20}},
            rotation=270,
            origin={0,-60}),
            iconTransformation(extent={{-10,-30},{10,-10}}, rotation=-90)));
     annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={95,95,95},
              fillColor={255,255,255},
              fillPattern=FillPattern.Sphere), Text(
              extent={{-90,-10},{92,10}},
              textString="%name",
              lineColor={0,0,0})}), Diagram(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics));
    end BaseFactorIcon;

    partial model BaseFactorIcon2
      RealInput_ yBase annotation (Placement(transformation(extent={{-20,-20},{
                20,20}},
            rotation=270,
            origin={6,100}),
            iconTransformation(extent={{-10,-10},{10,10}},rotation=270,
            origin={0,50})));
      RealOutput_ y annotation (Placement(transformation(extent={{-20,-20},{20,
                20}},
            rotation=270,
            origin={0,-80}),
            iconTransformation(extent={{-10,-10},{10,10}},  rotation=270,
            origin={0,-52})));
     annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,50},{100,-50}},
              lineColor={0,127,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Sphere), Text(
              extent={{-86,-36},{100,40}},
              textString="%name",
              lineColor={0,0,0},
              fillPattern=FillPattern.Sphere)}), Diagram(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics));
    end BaseFactorIcon2;

    partial model BaseFactorIcon3
      RealInput_ yBase annotation (Placement(transformation(extent={{-20,-20},{
                20,20}},
            rotation=270,
            origin={6,80}),
            iconTransformation(extent={{-10,10},{10,30}}, rotation=-90)));
      RealOutput_ y annotation (Placement(transformation(extent={{-20,-20},{20,
                20}},
            rotation=270,
            origin={0,-60}),
            iconTransformation(extent={{-10,-30},{10,-10}}, rotation=-90)));
     annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,127,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Sphere), Text(
              extent={{-90,-10},{92,10}},
              textString="%name",
              lineColor={0,0,0})}), Diagram(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics));
    end BaseFactorIcon3;

    partial model BaseFactorIcon4
      RealInput_ yBase annotation (Placement(transformation(extent={{-20,-20},{
                20,20}},
            rotation=270,
            origin={6,80}),
            iconTransformation(extent={{-10,10},{10,30}}, rotation=-90)));
      RealOutput_ y annotation (Placement(transformation(extent={{-20,-20},{20,
                20}},
            rotation=270,
            origin={0,-60}),
            iconTransformation(extent={{-10,-30},{10,-10}}, rotation=-90)));
     annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={127,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Sphere), Text(
              extent={{-90,-10},{92,10}},
              textString="%name",
              lineColor={0,0,0})}), Diagram(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics));
    end BaseFactorIcon4;

    partial model BaseFactorIcon5
      RealInput_ yBase annotation (Placement(transformation(extent={{-20,-20},{
                20,20}},
            rotation=270,
            origin={6,80}),
            iconTransformation(extent={{-10,10},{10,30}}, rotation=-90)));
      RealOutput_ y annotation (Placement(transformation(extent={{-20,-20},{20,
                20}},
            rotation=270,
            origin={0,-60}),
            iconTransformation(extent={{-10,-30},{10,-10}}, rotation=-90)));
     annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Sphere), Text(
              extent={{-90,-10},{92,10}},
              textString="%name",
              lineColor={0,0,0})}), Diagram(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics));
    end BaseFactorIcon5;

    partial model BaseFactorIcon6
      RealInput_ yBase annotation (Placement(transformation(extent={{-20,-20},{
                20,20}},
            rotation=270,
            origin={6,80}),
            iconTransformation(extent={{-10,10},{10,30}}, rotation=-90)));
      RealOutput_ y annotation (Placement(transformation(extent={{-20,-20},{20,
                20}},
            rotation=270,
            origin={0,-60}),
            iconTransformation(extent={{-10,-30},{10,-10}}, rotation=-90)));
     annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
            extent={{-100,20},{100,-20}},
            lineColor={0,87,87},
            fillColor={255,255,255},
            fillPattern=FillPattern.Sphere)}),
                                    Diagram(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics));
    end BaseFactorIcon6;

    partial connector SignalBusBlue "Icon for signal bus"
      annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.2), graphics={
            Rectangle(
              extent={{-20,2},{20,-2}},
              lineColor={255,204,51},
              lineThickness=0.5),
            Polygon(
              points={{-80,50},{80,50},{100,30},{80,-40},{60,-50},{-60,-50},{
                  -80,-40},{-100,30},{-80,50}},
              lineColor={0,0,0},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-65,25},{-55,15}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-5,25},{5,15}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{55,25},{65,15}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-35,-15},{-25,-25}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{25,-15},{35,-25}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.2), graphics={
            Polygon(
              points={{-40,25},{40,25},{50,15},{40,-20},{30,-25},{-30,-25},{-40,
                  -20},{-50,15},{-40,25}},
              lineColor={0,0,0},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-32.5,7.5},{-27.5,12.5}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-2.5,12.5},{2.5,7.5}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{27.5,12.5},{32.5,7.5}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-17.5,-7.5},{-12.5,-12.5}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{12.5,-7.5},{17.5,-12.5}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,70},{150,40}},
              lineColor={0,0,0},
              textString="%name")}),
        Documentation(info="<html>
<p>
This icon is designed for a <b>signal bus</b> connector.
</p>
</html>"));
    end SignalBusBlue;

    connector RealInput = input Real "'input Real' as connector"
      annotation (defaultComponentName="u",
      Icon(graphics={Polygon(
            points={{-100,100},{100,0},{-100,-100},{-100,100}},
            lineColor={0,0,127},
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid), Text(
            extent={{98,-50},{724,58}},
            lineColor={0,0,127},
            textString="%name")},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
            points={{0,50},{100,0},{0,-50},{0,50}},
            lineColor={0,0,127},
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid), Text(
            extent={{-10,85},{-10,60}},
            lineColor={0,0,127},
            textString="%name")}),
        Documentation(info="<html>
<p>
Connector with one input signal of type Real.
</p>
</html>"));
    connector RealInput_ =input Real "'input Real' as connector"
      annotation (defaultComponentName="u",
      Icon(graphics={Polygon(
            points={{-100,100},{100,0},{-100,-100},{-100,100}},
            lineColor={0,0,127},
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
            points={{0,50},{100,0},{0,-50},{0,50}},
            lineColor={0,0,127},
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid), Text(
            extent={{-10,85},{-10,60}},
            lineColor={0,0,127},
            textString="%name")}),
        Documentation(info="<html>
<p>
Connector with one input signal of type Real.
</p>
</html>"));
    connector RealInput_G=input Real "'input Real' as connector"
      annotation (defaultComponentName="u",
      Icon(graphics={Polygon(
            points={{-100,100},{100,0},{-100,-100},{-100,100}},
            lineColor={0,0,127},
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid), Text(
            extent={{-108,-36},{78,44}},
            lineColor={255,255,255},
            textString="%name")}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
            points={{0,50},{100,0},{0,-50},{0,50}},
            lineColor={0,0,127},
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid), Text(
            extent={{-10,85},{-10,60}},
            lineColor={0,0,127},
            textString="%name")}),
        Documentation(info="<html>
<p>
Connector with one input signal of type Real.
</p>
</html>"));
    connector RealOutput = output Real "'output Real' as connector"
      annotation (defaultComponentName="u",
      Icon(graphics={Polygon(
            points={{-100,100},{100,0},{-100,-100},{-100,100}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid), Text(
            extent={{-690,-58},{-100,60}},
            lineColor={0,0,127},
            textString="%name")},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
            points={{0,50},{100,0},{0,-50},{0,50}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid), Text(
            extent={{-10,85},{-10,60}},
            lineColor={0,0,127},
            textString="%name")}),
        Documentation(info="<html>
<p>
Connector with one input signal of type Real.
</p>
</html>"));
    connector RealOutput_ =output Real "'output Real' as connector"
      annotation (defaultComponentName="u",
      Icon(graphics={Polygon(
            points={{-100,100},{100,0},{-100,-100},{-100,100}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
            points={{0,50},{100,0},{0,-50},{0,50}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid), Text(
            extent={{-100,-50},{358,-92}},
            lineColor={0,0,255},
            textString="%name")}),
        Documentation(info="<html>
<p>
Connector with one input signal of type Real.
</p>
</html>"));
    connector RealOutput_G=output Real "'output Real' as connector"
      annotation (defaultComponentName="u",
      Icon(graphics={Polygon(
            points={{-100,100},{100,0},{-100,-100},{-100,100}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid), Text(
            extent={{-116,-36},{86,42}},
            lineColor={0,0,127},
            textString="%name")}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
            points={{0,50},{100,0},{0,-50},{0,50}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid), Text(
            extent={{-100,-50},{358,-92}},
            lineColor={0,0,255},
            textString="%name")}),
        Documentation(info="<html>
<p>
Connector with one input signal of type Real.
</p>
</html>"));
  connector BooleanInput = input Boolean "'input Boolean' as connector"
    annotation (defaultComponentName="u",
         Icon(graphics={Polygon(
            points={{-100,100},{100,0},{-100,-100},{-100,100}},
            lineColor={255,0,255},
            fillColor={255,0,255},
            fillPattern=FillPattern.Solid)},
              coordinateSystem(extent={{-100,-100},{100,100}},
          preserveAspectRatio=true, initialScale=0.2)),    Diagram(coordinateSystem(
          preserveAspectRatio=true, initialScale=0.2,
          extent={{-100,-100},{100,100}},
          grid={1,1}), graphics={Polygon(
            points={{0,50},{100,0},{0,-50},{0,50}},
            lineColor={255,0,255},
            fillColor={255,0,255},
            fillPattern=FillPattern.Solid), Text(
            extent={{-10,85},{-10,60}},
            lineColor={255,0,255},
            textString="%name")}),
      Documentation(info="<html>
<p>
Connector with one input signal of type Boolean.
</p>
</html>"));
  connector BooleanOutput =output Boolean "'output Boolean' as connector"
    annotation (defaultComponentName="u",
         Icon(graphics={Polygon(
            points={{-100,100},{100,0},{-100,-100},{-100,100}},
            lineColor={255,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)},
              coordinateSystem(extent={{-100,-100},{100,100}},
          preserveAspectRatio=true, initialScale=0.2)),    Diagram(coordinateSystem(
          preserveAspectRatio=true, initialScale=0.2,
          extent={{-100,-100},{100,100}},
          grid={1,1}), graphics={Polygon(
            points={{0,50},{100,0},{0,-50},{0,50}},
            lineColor={255,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid), Text(
            extent={{-10,85},{-10,60}},
            lineColor={255,0,255},
            textString="%name")}),
      Documentation(info="<html>
<p>
Connector with one input signal of type Boolean.
</p>
</html>"));
  partial block SIMO "Single Input Multiple Output continuous control block"
    parameter Integer nout=1 "Number of outputs";
        Modelica.Blocks.Interfaces.RealInput u "Connector of Real input signal"
          annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
              rotation=0)));
        Modelica.Blocks.Interfaces.RealOutput y[nout]
        "Connector of Real output signals"
          annotation (Placement(transformation(extent={{100,-10},{120,10}},
              rotation=0)));
    annotation (Documentation(info="<HTML>
<p> Block has one continuous Real input signal and a
    vector of continuous Real output signals.</p>
 
</HTML>
"), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
                100}}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}));
  end SIMO;

      partial block SISO "Single Input Single Output continuous control block"
        Modelica.Blocks.Interfaces.RealInput u
        "Connector of Real input signals"
          annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
              rotation=0)));
        Modelica.Blocks.Interfaces.RealOutput y
        "Connector of Real output signal"
          annotation (Placement(transformation(extent={{100,-10},{120,10}},
              rotation=0)));
        annotation (Documentation(info="<HTML>
<p>
Block has a vector of continuous Real input signals and
one continuous Real output signal.
</p>
</HTML>
"),       Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}));
      end SISO;

    partial class ConversionIcon "Base icon for conversion functions"
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={191,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-74,0},{30,0}}, color={191,0,0}),
            Polygon(
              points={{80,0},{20,20},{20,-20},{80,0}},
              lineColor={191,0,0},
              fillColor={191,0,0},
              fillPattern=FillPattern.Solid)}));
    end ConversionIcon;

      expandable connector BusConnector
      "Empty control bus that is adapted to the signals connected to it"
        extends Physiolibraryold.Interfaces.SignalBusBlue;
        annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics={Rectangle(
              extent={{-20,2},{22,-2}},
              lineColor={0,0,255},
              lineThickness=0.5)}),
          Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}),
                  graphics),
          Documentation(info="<html>
<p>
This connector defines the \"expandable connector\" ControlBus that
is used as bus in the
<a href=\"Modelica://Modelica.Blocks.Examples.BusUsage\">BusUsage</a> example.
Note, this connector is \"empty\". When using it, the actual content is
constructed by the signals connected to this bus.
</p>
</html>"));
      end BusConnector;

    expandable connector BusConnectorInternal
      "Main bus connector that connect all submodels with this huge set of variables"
      extends Physiolibraryold.Interfaces.SignalBusBlue;
     Real A2Pool_Log10Con(unit="1", nominal=1.29897876942049)
        "Decimal logarithm of angiotensin 2 extracelular concentration. Original name: A2Pool.Log10Conc";
     Real A2Pool_Log10Conc(unit="1", nominal=1.29897876942049)
        "Decimal logarithm of angiotensin 2 extracelular concentration. Original name: A2Pool.Log10Conc";
     Real ADHPool_Log10Conc(unit="1", nominal=0.2990222010403)
        "Decimal logarithm of vasopressin concentration. Original name: ADHPool.Log10Conc";
     Real ADH(unit="ng/l", nominal=1.99077510438026)
        "Vasopressin extracellular concentration. Original name: ADHPool.[ADH]";
     Real ANPPool_Log10Conc(unit="1", nominal=1.2990222010403)
        "Decimal logarithm of atrial natriuretic peptide concentration. Original name: ANPPool.Log10Conc";
     Real AdrenalNerve_NA(unit="1", nominal=1.00590910582759)
        "Nerve activity of adrenal nerve. Original name: AdrenalNerve.NA";
     Real AirSupplyInspiredAirPressure(unit="mmHg", nominal=760.)
        "Air pressure. Original name: AirSupply-InspiredAir.Pressure";
     Real Aldo_conc_in_nG_per_dl(unit="ng/dl", nominal=11.88)
        "Body aldosterone concentration. Original name: AldoPool.[Aldo(nG/dL)]";
     Real AldoPool_Aldo(unit="pmol/l", nominal=330.)
        "Body aldosterone concentration. Original name: AldoPool.[Aldo(pMol/L)]";
     Real AlphaBlocade_Effect(unit="1", nominal=1.)
        "Effect of alpha blocators. Original name: AlphaBlockade.Effect";
     Real AlphaPool_Effect(unit="1", nominal=0.99972591818532)
        "Humoral and neural effect on alpha receptor stimulation. Original name: AlphaPool.Effect";
     Real AnesthesiaTidalVolume(unit="ml", nominal=1.)
        "Anesthesia gas tidal volume. Original name: Anesthesia.TidalVolume";
     Real Anesthesia_VascularConductance(unit="1", nominal=1.)
        "Anesthesia tension effect on vascular conductance in some tissues. Original name: Anesthesia.VascularConductance";
     Real ArtysVol(unit="ml", nominal=1598.5)
        "Volume of oxygenated blood in body. Original name: ArtysVol.Vol";
     Real BarometerPressure(unit="mmHg", nominal=760.)
        "Ambient environment pressure. Original name: Barometer.Pressure";
     Real BetaBlocade_Effect(unit="1", nominal=1.)
        "Effect of beta blocators. Original name: BetaBlockade.Effect";
     Real BetaPool_Effect(unit="1", nominal=0.99972591818532)
        "Humoral and neural effect on beta receptor stimulation. Original name: BetaPool.Effect";
     Real BladderVoidFlow(unit="ml/min", nominal=1.7)
        "Urination flow. Original name: BladderVoidFlow";
     Real BladderVolume_Mass(unit="ml", nominal=200.)
        "Urine volume in bladder. Original name: BladderVolume.Mass";
     Real BloodCations(unit="mEq/l", nominal=147.735807515379)
        "Sum of all cations concentrations in blood. Original name: BloodIons.Cations";
     Real BloodIons_Cations(unit="mEq/l", nominal=147.735807515379)
        "Sum of all cations concentrations in blood. Original name: BloodIons.Cations";
     Real BloodIons_ProteinAnions(unit="mEq/l", nominal=15.0835337930175)
        "concentration of nonbicarbonate buffers in anion forms. Original name: BloodIons.Protein";
     Real Artys_pH(unit="1", nominal=7.4)
        "Acidity (pH) of arterial blood. Original name: BloodPh.ArtysPh";
     Real BloodPh_ArtysPh(unit="1", nominal=7.4)
        "Acidity (pH) of arterial blood. Original name: BloodPh.ArtysPh";
     Real BloodVol_Hct(unit="1", nominal=0.44)
        "Heamatocrit = red cells / blood. Original name: BloodVol.Hct";
     Real BloodVol_PVCrit(unit="1", nominal=0.56)
        "Plasma volume fraction = plasma / blood. Original name: BloodVol.PVCrit";
     Real BodyH2O_Vol(unit="ml", nominal=40842.2008941024)
        "Body water volume. Original name: BodyH2O.Vol";
     Real bone_CO2FromMetabolism(unit="ml/min", nominal=0.510087812548753)
        "Bone carbondioxyde outflow from cells metabolism. Original name: Bone-CO2.OutflowBase";
     Real Bone_BloodFlow(unit="ml/min", nominal=324.086048840702)
        "Bone blood flow. Original name: Bone-Flow.BloodFlow";
     Real bone_BloodFlow(unit="ml/min", nominal=324.086048840702)
        "Bone blood flow. Original name: Bone-Flow.BloodFlow";
     Real bone_O2Use(unit="ml/min", nominal=14.2961830871287)
        "Bone oxygen consumption. Original name: Bone-Flow.O2Use";
     Real Bone_PO2(unit="mmHg", nominal=42.2937436361259)
        "Partial oxygen pressure in bone blood venules. Original name: Bone-Flow.PO2";
     Real bone_Fuel_FractUseDelay(unit="1", nominal=1.)
        "Bone deficiency of nutrients needed by cells metabolism. Original name: Bone-Fuel.FractUseDelay";
     Real bone_LactateFromMetabolism(unit="mEq/min", nominal=5.09422470717388e-005)
        "Lactate flow from bone cells. Original name: Bone-Lactate.Outflux";
     Real bone_cLactate(unit="meq/l", nominal=1.28169548960037)
        "Bone intracellular lactate concentration. Original name: Bone-Lactate.[Lac-(mEq/L)]";
     Real bone_pH_intracellular(unit="1", nominal=7.03009381463384)
        "Acidity (pH) in bone cells. Original name: Bone-Ph.Ph";
     Real bone_InterstitialWater(unit="ml", nominal=856.611751624329)
        "Bone interstitial water volume. Original name: Bone-Size.IFV";
     Real Bone_LiquidVol(unit="ml", nominal=2738.56)
        "Bone water volume = sum of bone interstitial and bone intracellular water. Original name: Bone-Size.LiquidVol";
     Real Bone_StructureEffect(unit="1", nominal=1.)
        "Bone tissue structural damage effect. Original name: Bone-Structure.Effect";
     Real brain_CO2FromMetabolism(unit="ml/min", nominal=1.40245737390225)
        "Brain carbondioxyde outflow from cells metabolism. Original name: Brain-CO2.OutflowBase";
     Real Brain_PCO2(unit="mmHg", nominal=46.5805596402771)
        "Partial carbondioxyde pressure in brain venules. Original name: Brain-CO2.PCO2";
     Real Brain_BloodFlow(unit="ml/min", nominal=817.030903292828)
        "Brain blood flow. Original name: Brain-Flow.BloodFlow";
     Real brain_BloodFlow(unit="ml/min", nominal=817.030903292828)
        "Brain blood flow. Original name: Brain-Flow.BloodFlow";
     Real brain_O2Use(unit="ml/min", nominal=39.3065407483815)
        "Brain oxygen consumption. Original name: Brain-Flow.O2Use";
     Real Brain_PO2(unit="mmHg", nominal=40.3699717617139)
        "Partial oxygen pressure in brain blood venules. Original name: Brain-Flow.PO2";
     Real BrainFuel_FractUseDelay(unit="1", nominal=1.)
        "Brain deficiency of nutrients needed by cells metabolism. Original name: Brain-Fuel.FractUseDelay";
     Real brain_Fuel_FractUseDelay(unit="1", nominal=1.)
        "Brain deficiency of nutrients needed by cells metabolism. Original name: Brain-Fuel.FractUseDelay";
     Real brain_FunctionEffect(unit="1", nominal=1.)
        "Brain tissue function effect. Original name: Brain-Function.Effect";
     Real brain_LactateFromMetabolism(unit="mEq/min", nominal=0.)
        "Lactate flow from brain cells. Original name: Brain-Lactate.Outflux";
     Real brain_cLactate(unit="meq/l", nominal=1.05762236174812)
        "Brain intracellular lactate concentration. Original name: Brain-Lactate.[Lac-(mEq/L)]";
     Real brain_pH_intracellular(unit="1", nominal=7.13738448029574)
        "Acidity (pH) in brain cells. Original name: Brain-Ph.Ph";
     Real brain_InterstitialWater(unit="ml", nominal=242.518568049041)
        "Brain interstitial water volume. Original name: Brain-Size.IFV";
     Real Brain_LiquidVol(unit="ml", nominal=775.324)
        "Brain water volume = sum of brain interstitial and brain intracellular water. Original name: Brain-Size.LiquidVol";
     Real Brain_StructureEffect(unit="1", nominal=1.)
        "Brain tissue structural damage effect. Original name: Brain-Structure.Effect";
     Real BreathingTotalVentilation(unit="ml/min", nominal=6152.76967874893)
        "Gas exchange rate through perfused alveoli. Original name: Breathing.TotalVentilation";
     Real CD_Glucose_Outflow(unit="mg/min", nominal=0.)
        "Collecting duct glucose outflow to urine. Original name: CD_Glucose.Outflow";
     Real CD_H2O_Outflow(unit="ml/min", nominal=0.778920248478402)
        "Collecting duct water outflow to urine. Original name: CD_H2O.Outflow";
     Real CD_H2O_Reab(unit="ml/min", nominal=3.77977991766273)
        "Collecting duct water reabsorbtion. Original name: CD_H2O.Reab";
     Real CD_K_Outflow(unit="mEq/min", nominal=5.37344289504483e-002)
        "Collecting duct potassium outflow to urine. Original name: CD_K.Outflow";
     Real CD_KA_Outflow(unit="mg/min", nominal=0.)
        "Collecting duct keto-acids outflow to urine. Original name: CD_KA.Outflow";
     Real CD_NH4_Outflow(unit="mEq/min", nominal=2.81943560926806e-002)
        "Collecting duct amonia ions outflow to urine. Original name: CD_NH4.Outflow";
     Real CD_Na_Outflow(unit="mEq/min", nominal=0.125408921478924)
        "Collecting duct sodium outflow to urine. Original name: CD_Na.Outflow";
     Real CD_PO4_Outflow(unit="mEq/min", nominal=2.30917372066747e-002)
        "Collecting duct phosphates outflow to urine. Original name: CD_PO4.Outflow";
     Real CO2Veins_cHCO3(unit="meq/l", nominal=25.6)
        "Bicarbonate concentration in mixed venous blood. Original name: CO2Veins.[HCO3(mEq/L)]";
     Real CardiacOutput(unit="ml/min", nominal=5504.05387990819)
        "Cardiac output. Original name: CardiacOutput.Flow";
     Real CarotidSinusHeight(unit="m", nominal=0.)
        "Height of carotid sinus above heart level. Original name: CarotidSinus.Level";
     Real CarotidSinusArteryPressure(unit="mmHg", nominal=96.1290322580645)
        "Mean blood pressure in carotid sinus artery. Original name: CarotidSinus.Pressure";
     Real CellH2O_Vol(unit="ml", nominal=24914.8813825901)
        "Intracellular water volume. Original name: CellH2O.Vol";
     Real CellProtein_Mass(unit="mg", nominal=6000000.)
        "Weight of all cellular proteins. Original name: CellProtein.Mass";
     Real DT_AldosteroneEffect(unit="1", nominal=1)
        "Aldosterone effect to distal tubule reabsorbtion. Original name: DT_AldosteroneEffect";
     Real DT_Na_Outflow(unit="mEq/min", nominal=0.501457018275525)
        "Distal tubule sodium outflow. Original name: DT_Na.Outflow";
     Real DT_Na_Reab(unit="mEq/min", nominal=1.37104712291894)
        "Distal tubule sodium reabsorbtion. Original name: DT_Na.Reab";
     Real DialyzerActivity_Cl_Flux(unit="mEq/min", nominal=0.)
        "Outflow of chloride ions through dialyzer. Original name: DialyzerActivity.Cl-Flux";
     Real DialyzerActivity_K_Flux(unit="mEq/min", nominal=0.)
        "Outflow of potassium ions through dialyzer. Original name: DialyzerActivity.K+Flux";
     Real DialyzerActivity_Na_Flux(unit="mEq/min", nominal=0.)
        "Outflow of sodium ions through dialyzer. Original name: DialyzerActivity.Na+Flux";
     Real DietGoalH2O_DegK(unit="K", nominal=294.261111111111)
        "Temperature of water in diet (consumed oraly). Original name: DietGoalH2O.DegK";
     Real DietIntakeElectrolytes_Cl(unit="mEq/min", nominal=0.13910967422831)
        "Intake of chlorides through GIT. Original name: DietIntakeElectrolytes.Cl-_mEq/Min";
     Real DietIntakeElectrolytes_K(unit="mEq/min", nominal=4.86883859799086e-002)
        "Intake of potassium through GIT. Original name: DietIntakeElectrolytes.K+_mEq/Min";
     Real DietIntakeElectrolytes_Na(unit="mEq/min", nominal=0.125198706805479)
        "Intake of sodium through GIT. Original name: DietIntakeElectrolytes.Na+_mEq/Min";
     Real DietIntakeElectrolytes_PO4(unit="mEq/min", nominal=2.08664511342466e-002)
        "Intake of phosphates through GIT. Original name: DietIntakeElectrolytes.PO4--mEq/Min";
     Real DietIntakeElectrolytes_SO4(unit="mEq/min", nominal=3.47774185570776e-002)
        "Intake of sulphates through GIT. Original name: DietIntakeElectrolytes.SO4--mEq/Min";
     Real ECFV_Vol(unit="ml", nominal=14361.0097207699)
        "Extracellular fluid volume. Original name: ECFV.Vol";
     Real EPOPool_Log10Conc(unit="1", nominal=1.2990222010403)
        "Dacimal logarithm of erythropoetin concentration. Original name: EPOPool.Log10Conc";
     Real EpiPool_Epi(unit="pg/ml", nominal=39.8155020876053)
        "Epinephrine extracelular concentration. Original name: EpiPool.[Epi(pG/mL)]";
     Real ExcessLungWater_Volume(unit="ml", nominal=0.)
        "Pulmonary edema water. Original name: ExcessLungWater.Volume";
     Real Exercise_Metabolism_ContractionRate(unit="1/min", nominal=0.)
        "Rate of muscle contraction through excercise. Original name: Exercise-Metabolism.ContractionRate";
     Real ExerciseMetabolism_MotionCals(unit="Cal", nominal=0.)
        "Calories consumed with exercise. Original name: Exercise-Metabolism.MotionCals";
     Real Exercise_Metabolism_MotionWatts(unit="w", nominal=0.)
        "Mechanical performance of excercise. Original name: Exercise-Metabolism.MotionWatts";
     Real ExerciseMetabolism_TotalWatts(unit="w", nominal=0.)
        "Termodynamical performance of excercise. Original name: Exercise-Metabolism.TotalWatts";
     Real Exercise_MusclePump_Effect(unit="1", nominal=1.)
        "Excercise effect to blood flow through veins with valves. Original name: Exercise-MusclePump.Effect";
     Real FHbF(unit="1", nominal=0.005)
        "Fetal heamoglobin fraction. Original name: FHbF";
     Real FMetHb(unit="1", nominal=0.005)
        "Methemoglobin fraction. Original name: FMetHb";
     Real fat_CO2FromMetabolism(unit="ml/min", nominal=0.219871145602797)
        "Fat carbondioxyde outflow from cells metabolism. Original name: Fat-CO2.OutflowBase";
     Real Fat_BloodFlow(unit="ml/min", nominal=241.149275495811)
        "Fat blood flow. Original name: Fat-Flow.BloodFlow";
     Real fat_BloodFlow(unit="ml/min", nominal=241.149275495811)
        "Fat blood flow. Original name: Fat-Flow.BloodFlow";
     Real fat_O2Use(unit="ml/min", nominal=6.16230789245506)
        "Fat oxygen consumption. Original name: Fat-Flow.O2Use";
     Real Fat_PO2(unit="mmHg", nominal=53.2028712998172)
        "Partial oxygen pressure in fat blood venules. Original name: Fat-Flow.PO2";
     Real fat_Fuel_FractUseDelay(unit="1", nominal=1.)
        "Fat deficiency of nutrients needed by cells metabolism. Original name: Fat-Fuel.FractUseDelay";
     Real FatFunctionEffect(unit="1", nominal=1.00000000000068)
        "Fat tissue function effect. Original name: Fat-Function.Effect";
     Real fat_LactateFromMetabolism(unit="mEq/min", nominal=0.)
        "Lactate flow from fat cells. Original name: Fat-Lactate.Outflux";
     Real fat_cLactate(unit="meq/l", nominal=1.)
        "Fat intracellular lactate concentration. Original name: Fat-Lactate.[Lac-(mEq/L)]";
     Real fat_pH_intracellular(unit="1", nominal=7.30413901261407)
        "Acidity (pH) in fat cells. Original name: Fat-Ph.Ph";
     Real fat_InterstitialWater(unit="ml", nominal=778.863074588316)
        "Fat interstitial water volume. Original name: Fat-Size.IFV";
     Real Fat_LiquidVol(unit="ml", nominal=2490.)
        "Fat water volume = sum of fat interstitial and fat intracellular water. Original name: Fat-Size.LiquidVol";
     Real Fat_StructureEffect(unit="1", nominal=1.)
        "Fat tissue structural damage effect. Original name: Fat-Structure.Effect";
     Real FurosemidePool_Loss(unit="mg/min", nominal=0.)
        "Furosemide outflow from body. Original name: FurosemidePool.Loss";
     Real FurosemidePool_Furosemide_conc(unit="ug/ml", nominal=0.)
        "Furosemide extracellular concentration. Original name: FurosemidePool.[Furosemide]";
     Real GILumenDiarrhea_KLoss(unit="meq/min", nominal=0)
        "Outflow of potassium by diarrhea. Original name: GILumenDiarrhea.K+Loss";
     Real GILumenDiarrhea_NaLoss(unit="meq/min", nominal=0.)
        "Outflow of sodium by diarrhea. Original name: GILumenDiarrhea.Na+Loss";
     Real GILumenPotassium_Mass(unit="mEq", nominal=25.)
        "Potasium mass in intestines. Original name: GILumenPotassium.Mass";
     Real GILumenSodium_Mass(unit="mEq", nominal=80.)
        "Sodium mass in intestines. Original name: GILumenSodium.Mass";
     Real GILumenVolume_Absorption(unit="ml/min", nominal=1.94)
        "Water absorbtion through intestines. Original name: GILumenVolume.Absorption";
     Real GILumenVolume_Intake(unit="ml/min", nominal=1.94)
        "Water intake to intestines. Original name: GILumenVolume.Intake";
     Real GILumenVolume_Mass(unit="ml", nominal=1000.)
        "Water in intestines. Original name: GILumenVolume.Mass";
     Real GILumenVomitus_ClLoss(unit="meq/min", nominal=0.)
        "Chloride outflow by vomitus. Original name: GILumenVomitus.Cl-Loss";
     Real GITract_CO2FromMetabolism(unit="ml/min", nominal=0.671834975908416)
        "GITract carbondioxyde outflow from cells metabolism. Original name: GITract-CO2.OutflowBase";
     Real GITract_BloodFlow(unit="ml/min", nominal=1153.680894008123)
        "GITract blood flow. Original name: GITract-Flow.BloodFlow";
     Real GITract_O2Use(unit="ml/min", nominal=18.8294556028143)
        "GITract oxygen consumption. Original name: GITract-Flow.O2Use";
     Real GITract_PO2(unit="mmHg", nominal=58.8550845443996)
        "Partial oxygen pressure in gITract blood venules. Original name: GITract-Flow.PO2";
     Real GITract_Fuel_FractUseDelay(unit="1", nominal=1.)
        "GITract deficiency of nutrients needed by cells metabolism. Original name: GITract-Fuel.FractUseDelay";
     Real GITractFunctionEffect(unit="1", nominal=1.00000000000068)
        "GITract tissue function effect. Original name: GITract-Function.Effect";
     Real GITract_LactateFromMetabolism(unit="mEq/min", nominal=7.46238924200865e-005)
        "Lactate flow from gITract cells. Original name: GITract-Lactate.Outflux";
     Real GITract_cLactate(unit="meq/l", nominal=1.29112224345401)
        "GITract intracellular lactate concentration. Original name: GITract-Lactate.[Lac-(mEq/L)]";
     Real GITract_pH_intracellular(unit="1", nominal=7.02397749899767)
        "Acidity (pH) in gITract cells. Original name: GITract-Ph.Ph";
     Real GITract_InterstitialWater(unit="ml", nominal=266.493787704079)
        "GITract interstitial water volume. Original name: GITract-Size.IFV";
     Real GITract_LiquidVol(unit="ml", nominal=851.972)
        "GITract water volume = sum of gITract interstitial and gITract intracellular water. Original name: GITract-Size.LiquidVol";
     Real GITract_StructureEffect(unit="1", nominal=1.)
        "GITract tissue structural damage effect. Original name: GITract-Structure.Effect";
     Real GangliaGeneral_NA(unit="hz", nominal=1.50810960393941)
        "Neural activity of autonomous sympathetic nervous system. Original name: GangliaGeneral.NA(Hz)";
     Real GangliaKidney_NA(unit="hz", nominal=1.49161825060908)
        "Sympathetis kidney ganglia neural activity. Original name: GangliaKidney.NA(Hz)";
     Real GlomerulusFiltrate_GFR(unit="ml/min", nominal=129.49686727571)
        "Glomerulus filtration rate. Original name: GlomerulusFiltrate.GFR";
     Real Glomerulus_GFR(unit="ml/min", nominal=129.49686727571)
        "Glomerulus filtration rate. Original name: GlomerulusFiltrate.GFR";
     Real GlomerulusBloodPressure(unit="mmHg", nominal=60.7727410497984)
        "Blood pressure in glomerulus capilaries. Original name: GlomerulusFiltrate.Pressure";
     Real Glucagon_conc(unit="ng/l", nominal=69.6771286533093)
        "Extracellular glucagon concentration. Original name: GlucagonPool.[Glucagon]";
     Real GlucoseECF_Osmoles(unit="mOsm/ml", nominal=87.3569296901635)
        "Extracellular glucose osmolarity. Original name: GlucosePool.Osmoles";
     Real Glucose(unit="mg/dl", nominal=109.492630740915)
        "Extracellular glucose concentration. Original name: GlucosePool.[Glucose(mG/dL)]";
     Real G(unit="1", nominal=1.)
        "Earth gravity fraction. Original name: Gravity.Gz";
     Real Gravity_Gz(unit="1", nominal=1.)
        "Earth gravity fraction. Original name: Gravity.Gz";
     Real HeartVentricleRate(unit="1/min", nominal=72.1519231143317)
        "Heart rate. Original name: Heart-Ventricles.Rate";
     Real GITract_T(unit="degC", nominal=37)
        "Body core temperature. Original name: HeatCore.Temp(C)";
     Real HeatCore_Temp(unit="degC", nominal=37)
        "Body core temperature. Original name: HeatCore.Temp(C)";
     Real bone_T(unit="degC", nominal=37)
        "Body core temperature. Original name: HeatCore.Temp(C)";
     Real brain_T(unit="degC", nominal=37)
        "Body core temperature. Original name: HeatCore.Temp(C)";
     Real core_T(unit="degC", nominal=37)
        "Body core temperature. Original name: HeatCore.Temp(C)";
     Real fat_T(unit="degC", nominal=37)
        "Body core temperature. Original name: HeatCore.Temp(C)";
     Real kidney_T(unit="degC", nominal=37)
        "Body core temperature. Original name: HeatCore.Temp(C)";
     Real liver_T(unit="degC", nominal=37)
        "Body core temperature. Original name: HeatCore.Temp(C)";
     Real otherTissue_T(unit="degC", nominal=37)
        "Body core temperature. Original name: HeatCore.Temp(C)";
     Real respiratoryMuscle_T(unit="degC", nominal=37)
        "Body core temperature. Original name: HeatCore.Temp(C)";
     Real rightHeart_T(unit="degC", nominal=37)
        "Body core temperature. Original name: HeatCore.Temp(C)";
     Real HeatInsensibleLung_H2O(unit="g/min", nominal=0.265354795938769)
        "Vaporized water outflow by breathing. Original name: HeatInsensibleLung.H2O";
     Real HeatInsensibleSkin_H2O(unit="g/min", nominal=0.37)
        "Vaporized water outflow from skin. Original name: HeatInsensibleSkin.H2O";
     Real skeletalMuscle_T(unit="c", nominal=37.0555555555556)
        "Skeletal muscle temperature. Original name: HeatSkeletalMuscle.Temp(C)";
     Real skin_T(unit="c", nominal=28.8888888888889)
        "Skin temperature. Original name: HeatSkin.Temp(C)";
     Real Hemorrhage_ClRate(unit="mEq/min", nominal=0.)
        "Chloride outflow by hemorrhage. Original name: Hemorrhage.ClRate";
     Real Hemorrhage_KRate(unit="mEq/min", nominal=0.)
        "Potassium outflow by hemorrhage. Original name: Hemorrhage.KRate";
     Real Hemorrhage_NaRate(unit="mEq/min", nominal=0.)
        "Sodium outflow by hemorrhage. Original name: Hemorrhage.NaRate";
     Real Hemorrhage_PlasmaRate(unit="ml/min", nominal=0.)
        "Plasma outflow by hemorrhage. Original name: Hemorrhage.PlasmaRate";
     Real Hemorrhage_ProteinRate(unit="mg/min", nominal=0.)
        "Protein outflow by hemorrhage. Original name: Hemorrhage.ProteinRate";
     Real Hemorrhage_RBCRate(unit="ml/min", nominal=0.)
        "Erythrocytes outflow by hemorrhage. Original name: Hemorrhage.RBCRate";
     Real HepaticArty_BloodFlow(unit="ml/min", nominal=246.447690322581)
        "Hepatic artery blood flow. Original name: HepaticArty.Flow";
     Real LowerTorsoArtyHeight(unit="mmHg", nominal=0.)
        "Mean height of lower torso arteries below heart. Original name: Hydrostatics.LowerTorsoArtyGradient";
     Real LowerTorsoVeinHeight(unit="mmHg", nominal=0.)
        "Mean height of lower torso veins below heart. Original name: Hydrostatics.LowerTorsoVeinGradient";
     Real HypothalamusShivering_NerveActivity(unit="1", nominal=0.)
        "Hypothalamus shivering nerve activity. Original name: HypothalamusShivering.NerveActivity";
     Real HypothalamusSkinFlow_NervesActivity(unit="1", nominal=1.0000000000001)
        "Hypothalamus nerve activity affecting skin blood flow. Original name: HypothalamusSkinFlow.NerveActivity";
     Real ICFV_Vol(unit="ml", nominal=26481.1911733325)
        "Intracellular water volume. Original name: ICFV.Vol";
     Real IVDrip_ClRate(unit="mEq/min", nominal=0.)
        "Intravenous chloride intake. Original name: IVDrip.ClRate";
     Real IVDrip_H2ORate(unit="ml/min", nominal=0.)
        "Intravenous water intake. Original name: IVDrip.H2ORate";
     Real IVDrip_KRate(unit="mEq/min", nominal=0.)
        "Intravenous potassium intake. Original name: IVDrip.KRate";
     Real IVDrip_NaRate(unit="mEq/min", nominal=0.)
        "Intravenous sodium intake. Original name: IVDrip.NaRate";
     Real Insulin(unit="uU/ml", nominal=19.9077510438027)
        "Insulin extracellular concentration. Original name: InsulinPool.[Insulin]";
     Real KA_Change(unit="mg/min", nominal=1.68416089014077)
        "Change of keto-acids extracellular mass. Original name: KAPool.Change";
     Real KAPool_Osmoles(unit="mOsm/ml", nominal=0.700443745333856)
        "Keto-acids extracellular osmolarity. Original name: KAPool.Osmoles";
     Real PotassiumToCells(unit="1", nominal=0)
        "PotasiumToCells Original name: KCell.Change";
     Real KCell_conc(unit="meq/l", nominal=151.304559096149)
        "Intracellular potassium concentration. Original name: KCell.[K+(mEq/L)]";
     Real KPool_per_liter(unit="meq/l", nominal=4.4)
        "Potassium extracellular concentration. Original name: KPool.[K+(mEq/L)]";
     Real Kidney_Alpha_NA(unit="1", nominal=1.)
        "Kidney alpha neural activity effect. Original name: Kidney-Alpha.NA";
     Real KidneyAlpha_PT_NA(unit="1", nominal=1.)
        "Kidney alpha proximal tubule neural activity effect. Original name: Kidney-Alpha.PT_NA";
     Real kidney_CO2FromMetabolism(unit="ml/min", nominal=0.725345054073534)
        "Kidney carbondioxyde outflow from cells metabolism. Original name: Kidney-CO2.OutflowBase";
     Real Kidney_BloodFlow(unit="ml/min", nominal=1242.65169526077)
        "Kidney blood flow. Original name: Kidney-Flow.BloodFlow";
     Real kidney_BloodFlow(unit="ml/min", nominal=1242.65169526077)
        "Kidney blood flow. Original name: Kidney-Flow.BloodFlow";
     Real KidneyPlasmaFlow(unit="ml/min", nominal=695.884949346032)
        "Kidney plasma flow. Original name: Kidney-Flow.PlasmaFlow";
     Real kidney_Fuel_FractUseDelay(unit="1", nominal=1.)
        "Kidney deficiency of nutrients needed by cells metabolism. Original name: Kidney-Fuel.FractUseDelay";
     Real KidneyFunctionEffect(unit="1", nominal=1.00000000000068)
        "Kidney tissue function effect. Original name: Kidney-Function.Effect";
     Real KidneyFunction_Effect(unit="1", nominal=1.00000000000068)
        "Kidney tissue function effect. Original name: Kidney-Function.Effect";
     Real kidney_LactateFromMetabolism(unit="mEq/min", nominal=0.)
        "Lactate flow from kidney cells. Original name: Kidney-Lactate.Outflux";
     Real kidney_cLactate(unit="meq/l", nominal=1.05273008000749)
        "Kidney intracellular lactate concentration. Original name: Kidney-Lactate.[Lac-(mEq/L)]";
     Real Kidney_NephronCount_Filtering_xNormal(unit="xnormal", nominal=1.)
        "Fraction of nephron filtering. Original name: Kidney-NephronCount.Filtering(xNormal)";
     Real Kidney_NephronCount_Total_xNormal(unit="xnormal", nominal=1.)
        "Fraction of nephron count. Original name: Kidney-NephronCount.Total(xNormal)";
     Real kidney_O2Use(unit="ml/min", nominal=20.3291775244825)
        "Kidney O2 consumption. Original name: Kidney-O2.O2Use";
     Real KidneyO2_TubulePO2(unit="mmHg", nominal=39.0972281495236)
        "Kidney tubule partial O2 pressure.  Original name: Kidney-O2.TubulePO2";
     Real Kidney_PO2(unit="mmHg", nominal=61.791105140278)
        "Kidney vein partial O2 pressure. Original name: Kidney-O2.VeinPO2";
     Real kidney_pH_intracellular(unit="1", nominal=6.90408555471023)
        "Acidity (pH) in kidney cells. Original name: Kidney-Ph.Ph";
     Real kidney_InterstitialWater(unit="ml", nominal=53.483182307393)
        "Kidney interstitial water volume. Original name: Kidney-Size.IFV";
     Real Kidney_LiquidVol(unit="ml", nominal=170.984)
        "Kidney water volume = sum of kidney interstitial and kidney intracellular water. Original name: Kidney-Size.LiquidVol";
     Real Kidney_StructureEffect(unit="1", nominal=1.)
        "Kidney tissue structural damage effect. Original name: Kidney-Structure.Effect";
     Real LH_H2O_Outflow(unit="ml/min", nominal=39.1458494104607)
        "Water outflow from loop of Henle to distal tubule. Original name: LH_H2O.Outflow";
     Real LH_Na_FractReab(unit="1", nominal=0.744455551715471)
        "Sodium reabsorbtion fraction (=reabsorbed/inflowed) in loop of Henle. Original name: LH_Na.FractReab";
     Real LH_Na_Reab(unit="ml/min", nominal=5.455004453747)
        "Sodium reabsorbtion in loop of Henle. Original name: LH_Na.Reab";
     Real liver_GlucoseToCellStorageFlow(unit="mg/min", nominal=148.405541658881)
        "Liver glycogen gain from glucose. Original name: LM_Glycogen.Gain";
     Real LM_Insulin_InsulinDelayed(unit="uU/l", nominal=50.)
        "Insulin concentration delayed in liver. Original name: LM_Insulin.[InsulinDelayed]";
     Real LT_InterstitialProtein_Mass(unit="mg", nominal=75.)
        "Lower torso interstitial protein mass. Original name: LT_InterstitialProtein.Mass";
     Real LT_InterstitialWater_Vol(unit="ml", nominal=3402.17328522297)
        "Lower torso interstitial water. Original name: LT_InterstitialWater.Vol";
     Real LT_LymphFlow(unit="ml/min", nominal=1.2323274384069)
        "Flow of lymph water from lower torso. Original name: LT_LymphWater.Rate";
     Real LactateFromTissues(unit="mEq/min", nominal=4.46331709204733e-004)
        "Change of extracellular lactate mass. Original name: LacPool.Change";
     Real LacPool_Mass_mEq(unit="mEq", nominal=15.)
        "Extracellular lactate mass. Original name: LacPool.Mass";
     Real LacPool_Lac_mEq_per_litre(unit="meq/l", nominal=1.04449480166467)
        "Lactate extracellular concentration. Original name: LacPool.[Lac-(mEq/L)]";
     Real LeftAtrium_TMP(unit="mmHg", nominal=8.16)
        "Left atrium pressure gradient between inside and pericardium. Original name: LeftAtrium.TMP";
     Real leftAtrium_TMP(unit="mmHg", nominal=8.16)
        "Left atrium pressure gradient between inside and pericardium. Original name: LeftAtrium.TMP";
     Real leftHeart_CO2FromMetabolism(unit="ml/min", nominal=0.942645555600772)
        "LeftHeart carbondioxyde outflow from cells metabolism. Original name: LeftHeart-CO2.OutflowBase";
     Real LeftHeart_BloodFlow(unit="ml/min", nominal=186.157520521048)
        "LeftHeart blood flow. Original name: LeftHeart-Flow.BloodFlow";
     Real leftHeart_BloodFlow(unit="ml/min", nominal=186.157520521048)
        "LeftHeart blood flow. Original name: LeftHeart-Flow.BloodFlow";
     Real leftHeart_O2Use(unit="ml/min", nominal=26.4194382175104)
        "LeftHeart oxygen consumption. Original name: LeftHeart-Flow.O2Use";
     Real LeftHeart_PO2(unit="mmHg", nominal=17.2959653996553)
        "Partial oxygen pressure in leftHeart blood venules. Original name: LeftHeart-Flow.PO2";
     Real leftHeart_Fuel_FractUseDelay(unit="1", nominal=1.)
        "LeftHeart deficiency of nutrients needed by cells metabolism. Original name: LeftHeart-Fuel.FractUseDelay";
     Real leftHeart_LactateFromMetabolism(unit="mEq/min", nominal=0.)
        "Lactate flow from leftHeart cells. Original name: LeftHeart-Lactate.Outflux";
     Real leftHeart_cLactate(unit="meq/l", nominal=1.09840408347871)
        "LeftHeart intracellular lactate concentration. Original name: LeftHeart-Lactate.[Lac-(mEq/L)]";
     Real LeftHeart_O2Need(unit="ml/min", nominal=26.4194382175104)
        "Oxygen needed to be consumed by left heart cells if only aerobic metabolism is running. Original name: LeftHeart-Metabolism.O2Need";
     Real leftHeart_pH_intracellular(unit="1", nominal=6.95022466817416)
        "Acidity (pH) in leftHeart cells. Original name: LeftHeart-Ph.Ph";
     Real leftHeart_InterstitialWater(unit="ml", nominal=48.4115012265195)
        "LeftHeart interstitial water volume. Original name: LeftHeart-Size.IFV";
     Real LeftHeart_LiquidVol(unit="ml", nominal=154.77)
        "LeftHeart water volume = sum of leftHeart interstitial and leftHeart intracellular water. Original name: LeftHeart-Size.LiquidVol";
     Real LeftHeart_StructureEffect(unit="1", nominal=1.)
        "LeftHeart tissue structural damage effect. Original name: LeftHeart-Structure.Effect";
     Real LegMusclePump_Effect(unit="1", nominal=1.)
        "Effect to blood flow through veins with valves without exercise. Original name: LegMusclePump.Effect";
     Real Leptin(unit="ng/ml", nominal=7.96310041752106)
        "Leptin extracellular concentration. Original name: LeptinPool.[Leptin(nG/mL)]";
     Real LipidDeposits_Mass(unit="mg", nominal=12557.9)
        "Mass of lipids in fat cells. Original name: LipidDeposits.Mass";
     Real liver_CO2FromMetabolism(unit="ml/min", nominal=1.06673414961083)
        "Liver carbondioxyde outflow from cells metabolism. Original name: Liver-CO2.OutflowBase";
     Real liver_Fuel_FractUseDelay(unit="1", nominal=1.)
        "Liver deficiency of nutrients needed by cells metabolism. Original name: Liver-Fuel.FractUseDelay";
     Real LiverFunctionEffect(unit="1", nominal=1.00000000000068)
        "Liver tissue function effect. Original name: Liver-Function.Effect";
     Real liver_LactateFromMetabolism(unit="mEq/min", nominal=2.69489936147329e-004)
        "Lactate flow from liver cells. Original name: Liver-Lactate.Outflux";
     Real liver_cLactate(unit="meq/l", nominal=1.38395043328294)
        "Liver intracellular lactate concentration. Original name: Liver-Lactate.[Lac-(mEq/L)]";
     Real liver_O2Use(unit="ml/min", nominal=29.8972575563573)
        "Oxygen comsuption by liver. Original name: Liver-O2.O2Use";
     Real Liver_PO2(unit="mmHg", nominal=44.4830320222965)
        "Partial oxygen pressure in hepatic vein. Original name: Liver-O2.PO2";
     Real liver_pH_intracellular(unit="1", nominal=6.96530584524228)
        "Acidity (pH) in liver cells. Original name: Liver-Ph.Ph";
     Real liver_InterstitialWater(unit="ml", nominal=323.204403426573)
        "Liver interstitial water volume. Original name: Liver-Size.IFV";
     Real Liver_LiquidVol(unit="ml", nominal=1033.274)
        "Liver water volume = sum of liver interstitial and liver intracellular water. Original name: Liver-Size.LiquidVol";
     Real Liver_StructureEffect(unit="1", nominal=1.)
        "Liver tissue structural damage effect. Original name: Liver-Structure.Effect";
     Real AlveolarVentilated_BloodFlow(unit="ml/min", nominal=5154.40525020509)
        "Blood flow through ventilated alveoli. Original name: LungBloodFlow.AlveolarVentilated";
     Real MD_Na(unit="meq/l", nominal=47.8340403745099)
        "Kidney nephron - Maculla densa sodium concentration. Original name: MD_Na.[Na+(mEq/L)]";
     Real MT_InterstitialProtein_Mass(unit="mg", nominal=150.)
        "Middle torso interstitional proteins. Original name: MT_InterstitialProtein.Mass";
     Real MT_InterstitialWater_Vol(unit="ml", nominal=5670.28880870495)
        "Middle torso interstitional water. Original name: MT_InterstitialWater.Vol";
     Real MT_LymphFlow(unit="ml/min", nominal=0.768959151661487)
        "Middle torso lymph flow. Original name: MT_LymphWater.Rate";
     Real Medulla_Volume(unit="ml", nominal=31.)
        "Kidney medulla interstitial water volume. Original name: Medulla.Volume";
     Real MedullaNa_Osmolarity(unit="Osm/l", nominal=838.709677419355)
        "Kidney medulla interstitial sodium osmolarity. Original name: MedullaNa.Osmolarity";
     Real MedullaNa_conc(unit="meq/l", nominal=419.354838709677)
        "Kidney medulla interstitial sodium concentration. Original name: MedullaNa.[Na+(mEq/L)]";
     Real MedullaUrea_Osmolarity(unit="Osm/l", nominal=317.267741935484)
        "Kidney medulla interstitial urea osmolarity. Original name: MedullaUrea.Osmolarity";
     Real MetabolicH2O_Rate(unit="ml/min", nominal=0.17577819959993)
        "Water synthesis in metabolism. Original name: MetabolicH2O.Rate";
     Real NephronADH(unit="ng/l", nominal=2.)
        "Nephron vasopresine concentration. Original name: NephronADH.[ADH]";
     Real NephronADH_conc(unit="ng/l", nominal=2.)
        "Nephron vasopresine concentration. Original name: NephronADH.[ADH]";
     Real NephronANP_Log10Conc(unit="1", nominal=1.30102999566398)
        "Decimal logarithm of nephrone atrial natriuretic peptide concentration. Original name: NephronANP.Log10Conc";
     Real NephronAldo_conc_in_nG_per_dl(unit="ng/dl", nominal=11.)
        "Nephrone aldosterone concentration. Original name: NephronAldo.[Aldo(nG/dL)]";
     Real Osmreceptors(unit="Osm/l", nominal=0.260447746661318)
        "Osmolarity in hypothalamic osmoreceptors. Original name: OsmBody.[Osm]-Osmoreceptors";
     Real OsmCell_Electrolytes(unit="mOsm", nominal=7923.4702850513)
        "Intracellular electrolites osmoles. Original name: OsmCell.Electrolytes";
     Real OsmECFV_Electrolytes(unit="mOsm", nominal=4330.66)
        "Extracellular electrolites osmoles. Original name: OsmECFV.Electrolytes";
     Real otherTissue_CO2FromMetabolism(unit="ml/min", nominal=0.283139288504164)
        "OtherTissue carbondioxyde outflow from cells metabolism. Original name: OtherTissue-CO2.OutflowBase";
     Real OtherTissue_BloodFlow(unit="ml/min", nominal=375.121095215705)
        "OtherTissue blood flow. Original name: OtherTissue-Flow.BloodFlow";
     Real otherTissue_BloodFlow(unit="ml/min", nominal=375.121095215705)
        "OtherTissue blood flow. Original name: OtherTissue-Flow.BloodFlow";
     Real otherTissue_O2Use(unit="ml/min", nominal=7.93551817556513)
        "OtherTissue oxygen consumption. Original name: OtherTissue-Flow.O2Use";
     Real OtherTissue_PO2(unit="mmHg", nominal=56.8995160542686)
        "Partial oxygen pressure in otherTissue blood venules. Original name: OtherTissue-Flow.PO2";
     Real otherTissue_Fuel_FractUseDelay(unit="1", nominal=1.)
        "OtherTissue deficiency of nutrients needed by cells metabolism. Original name: OtherTissue-Fuel.FractUseDelay";
     Real OtherTissueFunctionEffect(unit="1", nominal=1.00000000000068)
        "OtherTissue tissue function effect. Original name: OtherTissue-Function.Effect";
     Real otherTissue_LactateFromMetabolism(unit="mEq/min", nominal=3.58314143292407e-005)
        "Lactate flow from otherTissue cells. Original name: OtherTissue-Lactate.Outflux";
     Real otherTissue_cLactate(unit="meq/l", nominal=1.30340035360388)
        "OtherTissue intracellular lactate concentration. Original name: OtherTissue-Lactate.[Lac-(mEq/L)]";
     Real otherTissue_pH_intracellular(unit="1", nominal=7.01567605859914)
        "Acidity (pH) in otherTissue cells. Original name: OtherTissue-Ph.Ph";
     Real otherTissue_InterstitialWater(unit="ml", nominal=760.752162131021)
        "OtherTissue interstitial water volume. Original name: OtherTissue-Size.IFV";
     Real OtherTissue_LiquidVol(unit="ml", nominal=2432.1)
        "OtherTissue water volume = sum of otherTissue interstitial and otherTissue intracellular water. Original name: OtherTissue-Size.LiquidVol";
     Real OtherTissue_StructureEffect(unit="1", nominal=1.)
        "OtherTissue tissue structural damage effect. Original name: OtherTissue-Structure.Effect";
     Real ctPO4(unit="meq/l", nominal=0.169215883872323)
        "Extracellular phosphates concentration. Original name: PO4Pool.[PO4--(mEq/L)]";
     Real PT_Na_FractReab(unit="1", nominal=0.582787577230245)
        "Proximal tubule sodium reabsorbtion fraction (=reabsorbed/inflowed). Original name: PT_Na.FractReab";
     Real PT_Na_Reab(unit="mEq/min", nominal=10.2355077368739)
        "Proximal tubule sodium reabsorbtion. Original name: PT_Na.Reab";
     Real Pericardium_Pressure(unit="mmHg", nominal=-3.34522126058954)
        "Pericardium cavity pressure. Original name: Pericardium-Cavity.Pressure";
     Real PeritoneumSpace_Gain(unit="ml/min", nominal=0.)
        "Water inflow to pericardium interstitial space. Original name: PeritoneumSpace.Gain";
     Real PeritoneumSpace_Loss(unit="ml/min", nominal=0.)
        "Water outflow from pericardium interstitial space. Original name: PeritoneumSpace.Loss";
     Real PeritoneumSpace_Vol(unit="ml", nominal=0.)
        "Water in pericardium interstitial space. Original name: PeritoneumSpace.Volume";
     Real PlasmaProtein_Mass(unit="mg", nominal=210.)
        "Plasma proteins. Original name: PlasmaProtein.Mass";
     Real PlasmaVol(unit="ml", nominal=3020.43210336)
        "Plasma volume. Original name: PlasmaVol.Vol";
     Real PlasmaVol_Vol(unit="ml", nominal=3020.43210336)
        "Plasma volume. Original name: PlasmaVol.Vol";
     Real PortalVein_Glucagon(unit="ng/l", nominal=160.397183960179)
        "Glucagon portal vein concentration. Original name: PortalVein-Glucagon.[Glucagon]";
     Real PortalVein_Insulin(unit="uU/l", nominal=52.444538843581)
        "Insulin portal vein concentration. Original name: PortalVein-Insulin.[Insulin]";
     Real PortalVein_BloodFlow(unit="ml/min", nominal=985.260894008123)
        "Portal vein blood flow. Original name: PortalVein.BloodFlow";
     Real PortalVein_PlasmaFlow(unit="ml/min", nominal=551.746100644549)
        "Portal vein plasma flow. Original name: PortalVein.PlasmaFlow";
     Real PulmCapys_Pressure(unit="mmHg", nominal=9.04347826086957)
        "Blood pressure in pulmonary capylaries. Original name: PulmCapys.Pressure";
     Real RBCH2O_Vol(unit="ml", nominal=1566.3097907424)
        "Intracellular water in erythrocytes. Original name: RBCH2O.Vol";
     Real RespiratoryCenter_MotorNerveActivity(unit="1", nominal=0.943462424759193)
        "Neural activity from respiratory center to respiratory muscle. Original name: RespiratoryCenter-Output.MotorNerveActivity";
     Real RespiratoryCenter_RespRate(unit="1/min", nominal=11.7241515181155)
        "Respiration rate. Original name: RespiratoryCenter-Output.Rate";
     Real respiratoryMuscle_CO2FromMetabolism(unit="ml/min", nominal=0.20215249198237)
        "RespiratoryMuscle carbondioxyde outflow from cells metabolism. Original name: RespiratoryMuscle-CO2.OutflowBase";
     Real RespiratoryMuscle_BloodFlow(unit="ml/min", nominal=98.2460011279228)
        "RespiratoryMuscle blood flow. Original name: RespiratoryMuscle-Flow.BloodFlow";
     Real respiratoryMuscle_BloodFlow(unit="ml/min", nominal=98.2460011279228)
        "RespiratoryMuscle blood flow. Original name: RespiratoryMuscle-Flow.BloodFlow";
     Real respiratoryMuscle_O2Use(unit="ml/min", nominal=5.66570885600814)
        "RespiratoryMuscle oxygen consumption. Original name: RespiratoryMuscle-Flow.O2Use";
     Real RespiratoryMuscle_PO2(unit="mmHg", nominal=36.8940260458383)
        "Partial oxygen pressure in respiratoryMuscle blood venules. Original name: RespiratoryMuscle-Flow.PO2";
     Real respiratoryMuscle_Fuel_FractUseDelay(unit="1", nominal=1.)
        "RespiratoryMuscle deficiency of nutrients needed by cells metabolism. Original name: RespiratoryMuscle-Fuel.FractUseDelay";
     Real RespiratoryMuscleFunctionEffect(unit="1", nominal=1.00000000000068)
        "RespiratoryMuscle tissue function effect. Original name: RespiratoryMuscle-Function.Effect";
     Real respiratoryMuscle_GlucoseToCellStorageFlow(unit="mg/min", nominal=0.)
        "Glycogen synthesis in skeletal muscle cells of respiratory muscles. Original name: RespiratoryMuscle-Glycogen.Synthesis";
     Real respiratoryMuscle_LactateFromMetabolism(unit="mEq/min", nominal=1.1082997070175e-005)
        "Lactate flow from respiratoryMuscle cells. Original name: RespiratoryMuscle-Lactate.Outflux";
     Real respiratoryMuscle_cLactate(unit="meq/l", nominal=1.23705408515535)
        "RespiratoryMuscle intracellular lactate concentration. Original name: RespiratoryMuscle-Lactate.[Lac-(mEq/L)]";
     Real RespiratoryMuscle_O2Need(unit="ml/min", nominal=5.66570885600814)
        "Oxygen needed to be consumed by respiratory muscle cells if only aerobic metabolism is running. Original name: RespiratoryMuscle-Metabolism.O2Need";
     Real respiratoryMuscle_pH_intracellular(unit="1", nominal=7.06537038555618)
        "Acidity (pH) in respiratoryMuscle cells. Original name: RespiratoryMuscle-Ph.Ph";
     Real respiratoryMuscle_InterstitialWater(unit="ml", nominal=761.096238188068)
        "RespiratoryMuscle interstitial water volume. Original name: RespiratoryMuscle-Size.IFV";
     Real RespiratoryMuscle_LiquidVol(unit="ml", nominal=2433.2)
        "RespiratoryMuscle water volume = sum of respiratoryMuscle interstitial and respiratoryMuscle intracellular water. Original name: RespiratoryMuscle-Size.LiquidVol";
     Real RespiratoryMuscle_StructureEffect(unit="1", nominal=1.)
        "RespiratoryMuscle tissue structural damage effect. Original name: RespiratoryMuscle-Structure.Effect";
     Real RightAtrium_Pressure(unit="mmHg", nominal=0.734778739410459)
        "Blood pressure in right atrium. Original name: RightAtrium.Pressure";
     Real RightAtrium_TMP(unit="mmHg", nominal=4.8)
        "Right atrium pressure gradient between inside and pericardium. Original name: RightAtrium.TMP";
     Real rightAtrium_TMP(unit="mmHg", nominal=4.8)
        "Right atrium pressure gradient between inside and pericardium. Original name: RightAtrium.TMP";
     Real rightHeart_CO2FromMetabolism(unit="ml/min", nominal=0.181290198493389)
        "RightHeart carbondioxyde outflow from cells metabolism. Original name: RightHeart-CO2.OutflowBase";
     Real RightHeart_BloodFlow(unit="ml/min", nominal=34.955556585178)
        "RightHeart blood flow. Original name: RightHeart-Flow.BloodFlow";
     Real rightHeart_BloodFlow(unit="ml/min", nominal=34.955556585178)
        "RightHeart blood flow. Original name: RightHeart-Flow.BloodFlow";
     Real rightHeart_O2Use(unit="ml/min", nominal=5.08100332100305)
        "RightHeart oxygen consumption. Original name: RightHeart-Flow.O2Use";
     Real RightHeart_PO2(unit="mmHg", nominal=16.7304160413847)
        "Partial oxygen pressure in rightHeart blood venules. Original name: RightHeart-Flow.PO2";
     Real rightHeart_Fuel_FractUseDelay(unit="1", nominal=1.)
        "RightHeart deficiency of nutrients needed by cells metabolism. Original name: RightHeart-Fuel.FractUseDelay";
     Real rightHeart_LactateFromMetabolism(unit="mEq/min", nominal=1.73444291670095e-006)
        "Lactate flow from rightHeart cells. Original name: RightHeart-Lactate.Outflux";
     Real rightHeart_cLactate(unit="meq/l", nominal=1.16301608838922)
        "RightHeart intracellular lactate concentration. Original name: RightHeart-Lactate.[Lac-(mEq/L)]";
     Real rightHeart_pH_intracellular(unit="1", nominal=6.92622678830646)
        "Acidity (pH) in rightHeart cells. Original name: RightHeart-Ph.Ph";
     Real rightHeart_InterstitialWater(unit="ml", nominal=8.06858353775326)
        "RightHeart interstitial water volume. Original name: RightHeart-Size.IFV";
     Real RightHeart_LiquidVol(unit="ml", nominal=25.795)
        "RightHeart water volume = sum of rightHeart interstitial and rightHeart intracellular water. Original name: RightHeart-Size.LiquidVol";
     Real RightHeart_StructureEffect(unit="1", nominal=1.)
        "RightHeart tissue structural damage effect. Original name: RightHeart-Structure.Effect";
     Real skeletalMuscle_CO2FromMetabolism(unit="ml/min", nominal=1.04285332261612)
        "SkeletalMuscle carbondioxyde outflow from cells metabolism. Original name: SkeletalMuscle-CO2.OutflowBase";
     Real SkeletalMuscle_BloodFlow(unit="ml/min", nominal=643.197470590973)
        "SkeletalMuscle blood flow. Original name: SkeletalMuscle-Flow.BloodFlow";
     Real skeletalMuscle_BloodFlow(unit="ml/min", nominal=643.197470590973)
        "SkeletalMuscle blood flow. Original name: SkeletalMuscle-Flow.BloodFlow";
     Real skeletalMuscle_O2Use(unit="ml/min", nominal=29.2279518670436)
        "SkeletalMuscle oxygen consumption. Original name: SkeletalMuscle-Flow.O2Use";
     Real SkeletalMuscle_PO2(unit="mmHg", nominal=41.696434578854)
        "Partial oxygen pressure in skeletalMuscle blood venules. Original name: SkeletalMuscle-Flow.PO2";
     Real skeletalMuscle_Fuel_FractUseDelay(unit="1", nominal=1.)
        "SkeletalMuscle deficiency of nutrients needed by cells metabolism. Original name: SkeletalMuscle-Fuel.FractUseDelay";
     Real skeletalMuscle_GlucoseToCellStorageFlow(unit="mg/min", nominal=0.)
        "Skeletal muscle glycogen synthesis rate. Original name: SkeletalMuscle-Glycogen.Synthesis";
     Real skeletalMuscle_LactateFromMetabolism(unit="mEq/min", nominal=0.)
        "Lactate flow from skeletalMuscle cells. Original name: SkeletalMuscle-Lactate.Outflux";
     Real skeletalMuscle_cLactate(unit="meq/l", nominal=0.93550771505128)
        "SkeletalMuscle intracellular lactate concentration. Original name: SkeletalMuscle-Lactate.[Lac-(mEq/L)]";
     Real SkeletalMuscle_O2Need(unit="ml/min", nominal=29.2279518670436)
        "Oxygen needed to be consumed by skeletal muscle cells if only aerobic metabolism is running. Original name: SkeletalMuscle-Metabolism.O2Need";
     Real skeletalMuscle_pH_intracellular(unit="1", nominal=7.39907006272829)
        "Acidity (pH) in skeletalMuscle cells. Original name: SkeletalMuscle-Ph.Ph";
     Real skeletalMuscle_InterstitialWater(unit="ml", nominal=6770.79120985489)
        "SkeletalMuscle interstitial water volume. Original name: SkeletalMuscle-Size.IFV";
     Real SkeletalMuscle_LiquidVol(unit="ml", nominal=21646.)
        "SkeletalMuscle water volume = sum of skeletalMuscle interstitial and skeletalMuscle intracellular water. Original name: SkeletalMuscle-Size.LiquidVol";
     Real skeletalMuscle_SizeMass(unit="g", nominal=27400.)
        "Weight of skeletal muscle tissues. Original name: SkeletalMuscle-Size.Mass";
     Real SkeletalMuscle_StructureEffect(unit="1", nominal=1.)
        "SkeletalMuscle tissue structural damage effect. Original name: SkeletalMuscle-Structure.Effect";
     Real skin_CO2FromMetabolism(unit="ml/min", nominal=0.210001458708568)
        "Skin carbondioxyde outflow from cells metabolism. Original name: Skin-CO2.OutflowBase";
     Real Skin_BloodFlow(unit="ml/min", nominal=141.322057495783)
        "Skin blood flow. Original name: Skin-Flow.BloodFlow";
     Real skin_BloodFlow(unit="ml/min", nominal=141.322057495783)
        "Skin blood flow. Original name: Skin-Flow.BloodFlow";
     Real skin_O2Use(unit="ml/min", nominal=5.88569110730292)
        "Skin oxygen consumption. Original name: Skin-Flow.O2Use";
     Real Skin_PO2(unit="mmHg", nominal=43.4499604248239)
        "Partial oxygen pressure in skin blood venules. Original name: Skin-Flow.PO2";
     Real skin_Fuel_FractUseDelay(unit="1", nominal=1.)
        "Skin deficiency of nutrients needed by cells metabolism. Original name: Skin-Fuel.FractUseDelay";
     Real skin_LactateFromMetabolism(unit="mEq/min", nominal=2.62677924946138e-006)
        "Lactate flow from skin cells. Original name: Skin-Lactate.Outflux";
     Real skin_cLactate(unit="meq/l", nominal=1.17061750073164)
        "Skin intracellular lactate concentration. Original name: Skin-Lactate.[Lac-(mEq/L)]";
     Real skin_pH_intracellular(unit="1", nominal=7.1177616785739)
        "Acidity (pH) in skin cells. Original name: Skin-Ph.Ph";
     Real skin_InterstitialWater(unit="ml", nominal=470.283154771904)
        "Skin interstitial water volume. Original name: Skin-Size.IFV";
     Real Skin_LiquidVol(unit="ml", nominal=1503.48)
        "Skin water volume = sum of skin interstitial and skin intracellular water. Original name: Skin-Size.LiquidVol";
     Real skinSizeMass(unit="g", nominal=2244.)
        "Weight of skin. Original name: Skin-Size.Mass";
     Real Skin_StructureEffect(unit="1", nominal=1.)
        "Skin tissue structural damage effect. Original name: Skin-Structure.Effect";
     Real SplanchnicVeins_Pressure(unit="mmHg", nominal=8.112)
        "Splanchnic (=portal vein) veins blood pressure. Original name: SplanchnicVeins.Pressure";
     Real SplanchnicCirculation_DeoxygenatedBloodVolume(unit="ml", nominal=1007.)
        "Splanchnic (=portal vein and venules) veins blood volume. Original name: SplanchnicVeins.Vol";
     Real Status_Posture(unit="1", nominal=1.)
        "Posture of body (0..NONE Original name: Status.Posture";
     Real SweatDuct_ClRate(unit="mEq/min", nominal=0.)
        "Chloride outflow through sweat ducts. Original name: SweatDuct.ClOutflow";
     Real SweatDuct_H2OOutflow(unit="mEq/min", nominal=0.)
        "Water outflow through sweat ducts. Original name: SweatDuct.H2OOutflow";
     Real SweatDuct_KRate(unit="mEq/min", nominal=0.)
        "Potassium outflow through sweat ducts. Original name: SweatDuct.KOutflow";
     Real SweatDuct_NaRate(unit="mEq/min", nominal=0.)
        "Sodium outflow through sweat ducts. Original name: SweatDuct.NaOutflow";
     Real SympsCNS_PituitaryNA(unit="1", nominal=1.00901292567802)
        "Sympathetis pituitary nerve activity. Original name: SympsCNS.PituitaryNA";
     Real SystemicArtys_Pressure(unit="mmHg", nominal=96.1290322580645)
        "Mean systemic arteries blood pressure. Original name: SystemicArtys.Pressure";
     Real ThiazidePool_Thiazide_conc(unit="ug/ml", nominal=0.)
        "Tiazide extracellular conentration. Original name: ThiazidePool.[Thiazide]";
     Real Thorax_AvePressure(unit="mmHg", nominal=-4.)
        "Intrathorax pressure. Original name: Thorax.AvePressure";
     Real Thorax_LungInflation(unit="1", nominal=1.)
        "Lungs inflation effect. Original name: Thorax.LungInflation";
     Real ThyroidEffect(unit="1", nominal=0.985356922586166)
        "Triiodothyronine  and thyroxine effect to metabolism. Original name: Thyroid.Effect";
     Real Transfusion_ClRate(unit="mEq/min", nominal=0.)
        "Chloride intake by transfusion. Original name: Transfusion.ClRate";
     Real Transfusion_KRate(unit="mEq/min", nominal=0.)
        "Potassium intake by transfusion. Original name: Transfusion.KRate";
     Real Transfusion_NaRate(unit="mEq/min", nominal=0.)
        "Sodium intake by transfusion. Original name: Transfusion.NaRate";
     Real Transfusion_PlasmaRate(unit="ml/min", nominal=0.)
        "Plasma intake by transfusion. Original name: Transfusion.PlasmaRate";
     Real Transfusion_ProteinRate(unit="mg/min", nominal=0.)
        "Protein intake by transfusion. Original name: Transfusion.ProteinRate";
     Real Transfusion_RBCRate(unit="ml/min", nominal=0.)
        "Erythrocytes intake by transfusion. Original name: Transfusion.RBCRate";
     Real UT_InterstitialProtein_Mass(unit="mg", nominal=75.)
        "Upper tissue interstitial protein. Original name: UT_InterstitialProtein.Mass";
     Real UT_InterstitialWater_Vol(unit="ml", nominal=2268.11552348198)
        "Upper tissue interstitial water. Original name: UT_InterstitialWater.Vol";
     Real UT_LymphFlow(unit="ml/min", nominal=0.37412994236873)
        "Upper tissue lypmh outflow. Original name: UT_LymphWater.Rate";
     Real UreaICF_Osmoles(unit="Osm/l", nominal=169.2005)
        "Intracellular urea osmoles. Original name: UreaCell.Osmoles";
     Real UreaECF_Osmoles(unit="Osm/l", nominal=95.3175284466562)
        "Extracellular urea osmoles. Original name: UreaPool.Osmoles";
     Real Urine_pH(unit="1", nominal=5.7)
        "Acidity (pH) of urine. Original name: Urine_pH";
     Real VasaRecta_Outflow(unit="ml/min", nominal=24.3304317899118)
        "Kidney vasa recta blood outflow to kidney veins. Original name: VasaRecta.Outflow";
     Real VeinsVol(unit="ml", nominal=3795.128756)
        "Volume of deoxygenated blood in body. Original name: VeinsVol.Vol";
     Real WeightCore(unit="g", nominal=41757.328756)
        "Weight of whole body. Original name: Weight.Core";
     Real cDPG(unit="mmol/l", nominal=5.4)
        "Blood 2,3-diphosphoglycerate concentration. Original name: cDPG";
     Real ctAlb(unit="mmol/l", nominal=0.66)
        "Blood molar albumin concentration. Original name: ctAlb";
     Real ctGlb(unit="g/l", nominal=28)
        "Blood globolins concentration. Original name: ctGlb";
     Real ctHb(unit="mmol/l", nominal=8.4)
        "Hemoglobin concentration in blood. Original name: ctHb";
     Real ctHb_ery(unit="mmol/l", nominal=21)
        "Hemoglobin concentration in erythrocytes. Original name: ctHb_ery";
     Real pCO(unit="mmHg", nominal=0)
        "Partial pressure of carbonmonoxyde. Original name: pCO";
    end BusConnectorInternal;

    model BaseFactorIcon0
      annotation (Icon(graphics={  Rectangle(
              extent={{-100,60},{100,-40}},
              lineColor={0,127,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Sphere), Text(
              extent={{-76,44},{64,-22}},
              lineColor={0,0,0},
              textString="%name")}));
    end BaseFactorIcon0;

      partial block BlockIcon_G "Basic graphical layout of input/output block"
        annotation (
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={255,255,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255})}),
        Documentation(info="<html>
<p>
Block that has only the basic icon for an input/output
block (no declarations, no equations). Most blocks
of package Modelica.Blocks inherit directly or indirectly
from this block.
</p>
</html>"));
      end BlockIcon_G;

    model MultXIcon "y na X"
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(extent={{-100,100},{
                  100,-100}}, lineColor={0,0,0}), Text(
              extent={{-100,40},{100,-20}},
              lineColor={0,0,0},
              textString="%u^%x")}), Diagram(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics={Text(
              extent={{-100,40},{100,-20}},
              lineColor={0,0,0},
              textString="%u^%x")}));
    end MultXIcon;

    partial model IVascularElasticBloodCompartment
     //extends QHP.Library.Interfaces.BaseModel;
      extends Physiolibraryold.Icons.BloodElasticCompartment;
      Physiolibraryold.PressureFlow.PositivePressureFlow referencePoint
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{-110,-10},{-90,10}}), iconTransformation(extent={{-10,-10},{
                10,10}})));
      Physiolibraryold.Interfaces.RealInput_ V0(final quantity="Volume", final
          unit="ml") "maximal nonstressed volume"
        annotation (extent=[-70,90; -50,110], rotation=-90);
      Physiolibraryold.Interfaces.RealInput_ ExternalPressure(final quantity=
            "Pressure", final unit="mmHg")
        "external pressure around the compartment"
        annotation (extent=[-10,90; 10,110], rotation=-90);
      Physiolibraryold.Interfaces.RealInput_ Compliance(final quantity=
            "Compliance", final unit="ml/mmHg")
        "elasticity of the stressed walls"
        annotation (extent=[50,90; 70,110], rotation=-90);
      Modelica.Blocks.Interfaces.RealOutput Pressure(  final quantity="Pressure", final unit="mmHg")
        "blod pressure in compartment"
        annotation (Placement(transformation(extent={{30,-110},{50,-90}}, rotation=-90)));
     // Real Vol "blood volume in compartment";
      parameter Real initialVol = 0;
      Modelica.Blocks.Interfaces.RealOutput Vol(start=initialVol, final
          quantity =                                                             "Volume", final unit=
           "ml") "blood volume in compartment"
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-40,-100})));
     // parameter Real initialVol = 0;
     annotation (
        preferredView = text,
        Documentation(info="<HTML>
<PRE>
  Elastic blood flow compartment. 
 
like 
QHP 2008 / VascularCompartments/SystemicArtys.DES
 
Created : 21-Oct-04
Last Modified : 13-Aug-08
Author : Tom Coleman
Copyright : 2008-2008
By : University of Mississippi Medical Center
Solver : DES 2008
Schema : 2008.0
</PRE>
</HTML>
",   revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> january 2009 </i><br> 
       by Marek Matejak in Modelica initially implemented (consulted with Jiri Kofranek), Charles University, Prague<br>
       orginaly described by Tom Coleman in QHP 2008 beta 3, University of Mississippi Medical Center
       </li>
</ul>
</html>"),
         Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                -100},{100,100}}), graphics),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                            graphics));
    end IVascularElasticBloodCompartment;
  end Interfaces;

  package Blocks "Base Signal Blocks Library"
      block BooleanConstant "Generate constant signal of type Boolean"
        parameter Boolean k=true "Constant output value";
        extends Modelica.Blocks.Interfaces.partialBooleanSource;
      equation
        y = k;
        annotation (
          Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Line(points={{-80,0},{80,0}}, color={0,0,0}),
              Text(
              extent={{-150,-140},{150,-110}},
              lineColor={0,0,0},
              textString="%k")}),
          Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Line(
              points={{-70,0},{80,0}},
              color={0,0,255},
              thickness=0.5),
            Text(
              extent={{-69,20},{-49,0}},
              lineColor={0,0,0},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid,
              textString="k"),
            Text(
              extent={{-96,6},{-76,-4}},
              lineColor={0,0,0},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid,
              textString="true"),
            Text(
              extent={{-98,-58},{-72,-68}},
              lineColor={0,0,0},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid,
              textString="false")}),
          Documentation(info="<html>
<p>
The Boolean output y is a constant signal:
</p>
 
<p>
<img src=\"../Images/Blocks/Sources/BooleanConstant.png\">
</p>
</html>"));
      end BooleanConstant;

        block Parts "Divide the input value by weights"
          extends Physiolibraryold.Interfaces.SIMO;
          parameter Real w[nout]=ones(nout) "Optional: weight coeficients";
    protected
         Real coef;
         Real weight[nout];
        equation
          ones(nout)*weight = 1;
          for i in 1:nout loop
              weight[i] = w[i] * coef;
              y[i] = u * weight[i];
          end for;
          annotation (defaultComponentName="parts1",
            Documentation(info="
<HTML>
<p>
This blocks divide input value <b>y</b> to
<i>outputs</i> by weights. The sum of output values is equal to input value.
<b>u</b>:
</p>
<pre>
    <b>y</b> = (<b>u</b>[1] + <b>u</b>[2] + ... + <b>u</b>[n]) / n;
</pre>
<p>
Example:
</p>
<pre>
     parameter:   nin = 3;
 
  results in the following equations:
 
     y = (u[1] + u[2] + u[3]) / 3;
</pre>
 
</HTML>
"),         Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="Parts")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,255},
              textString="AVG")}));
        end Parts;

        block Add "Output the addition of a value with the input signal"
          parameter Real k(start=1) "value added to input signal";
    public
          Modelica.Blocks.Interfaces.RealInput u "Input signal connector"
            annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
              rotation=0)));
          Modelica.Blocks.Interfaces.RealOutput y "Output signal connector"
            annotation (Placement(transformation(extent={{100,-10},{120,10}},
              rotation=0)));
        equation
          y = k+u;
          annotation (
            Documentation(info="
<HTML>
<p>
This block computes output <i>y</i> as
<i>product</i> of gain <i>k</i> with the
input <i>u</i>:
</p>
<pre>
    y = k * u;
</pre>
 
</HTML>
"),         Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Polygon(
              points={{-100,-100},{-100,100},{100,0},{-100,-100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-98,-52},{30,34}},
              lineColor={0,0,0},
              textString="%k+u"),
            Text(
              extent={{-150,140},{150,100}},
              textString="%name",
              lineColor={0,0,255})}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Polygon(
              points={{-100,-100},{-100,100},{100,0},{-100,-100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-76,38},{0,-34}},
              lineColor={0,0,255},
              textString="k")}));
        end Add;

        block Pow "the power of parameter"
          extends Physiolibraryold.Interfaces.SISO;
          parameter Real power_base=10 "base";
        equation
          y = power_base^u;
           annotation (defaultComponentName="avg1",
            Documentation(info="
<HTML>
<p>
This blocks computes output <b>y</b> as
<i>average value</i> of the elements of the input signal vector
<b>u</b>:
</p>
<pre>
    <b>y</b> = (<b>u</b>[1] + <b>u</b>[2] + ... + <b>u</b>[n]) / n;
</pre>
<p>
Example:
</p>
<pre>
     parameter:   nin = 3;
 
  results in the following equations:
 
     y = (u[1] + u[2] + u[3]) / 3;
</pre>
 
</HTML>
"),         Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
                initialScale=0.04), graphics={Text(
              extent={{-100,-40},{100,40}},
              lineColor={0,0,0},
              textString="%power_base^u")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
                initialScale=0.04), graphics={Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-100,-46},{100,52}},
              lineColor={0,0,255},
              textString="Pow")}));
        end Pow;

        block Inv "Output the inverse value of the input"
          extends Modelica.Blocks.Interfaces.SISO;
        equation
          y = 1/u;
          annotation (defaultComponentName="inv1",
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              textString="1/u")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics),
            Documentation(info="<HTML>
<p>
This blocks computes the output <b>y</b>
as <i>inverse value</i> of the input <b>u</b>:
</p>
<pre>
    y = 1 / u ;
</pre>
 
</HTML>
"));
        end Inv;

        block MultiProduct
      "Output the product of the elements of the input vector"
          extends Modelica.Blocks.Interfaces.MISO;
        equation
          y = product(u);
          annotation (defaultComponentName="product1",
            Documentation(info="
<HTML>
<p>
This blocks computes output <b>y</b> as
<i>product</i> of the elements of the input signal vector
<b>u</b>:
</p>
<pre>
    <b>y</b> = <b>u</b>[1] * <b>u</b>[2] * ...;
</pre>
<p>
Example:
</p>
<pre>
     parameter:   nin = 3;

  results in the following equations:

     y = u[1] * u[2] * u[3];
</pre>

</HTML>
"),         Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              points={{56,38},{-48,38},{-10,38},{-10,-42},{-10,-42}},
              color={0,0,0},
              thickness=0.25),
            Line(
              points={{16,38},{16,-44}},
              color={0,0,0},
              smooth=Smooth.None)}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{26,42},{-34,42},{-10,42},{-10,-38},{-10,-38}},
              color={0,0,0},
              thickness=0.25),
            Line(
              points={{0,42},{0,-38}},
              color={0,0,0},
              smooth=Smooth.None)}));
        end MultiProduct;

        block Log10AsEffect
      "Output the base 10 logarithm of the input > 1, or 0 otherwise"
          extends Modelica.Blocks.Interfaces.SISO;
        equation
          y = if u>1 then Modelica.Math.log10(u) else 0;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Polygon(
              points={{90,0},{68,8},{68,-8},{90,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{68,0}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,-80},{-80,68}}, color={192,192,192}),
            Text(
              extent={{-44,-56},{94,-80}},
              lineColor={192,192,192},
              textString="max(log10,0)"),
            Line(points={{-100,0},{-80,0},{-78,0},{-74,0},{-76,0},{-74,0},{-72,
                  0},{-69.5,6.08},{-64.7,15.9},{-57.5,26},{-47,36.1},{-31.8,
                  46.1},{-10.1,56},{22.1,66},{68.7,76.1},{80,78}}, color={0,0,
                  0})}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Line(points={{-80,80},{-88,80}}, color={192,192,192}),
            Line(points={{-80,-80},{-88,-80}}, color={192,192,192}),
            Line(points={{-80,-90},{-80,84}}, color={192,192,192}),
            Text(
              extent={{-65,96},{-38,78}},
              lineColor={160,160,164},
              textString="y"),
            Polygon(
              points={{-80,100},{-86,84},{-74,84},{-80,100}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-100,0},{84,0}}, color={192,192,192}),
            Polygon(
              points={{100,0},{84,6},{84,-6},{100,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-100,0},{-80,0},{-78,0},{-74,0},{-76,0},{-74,0},{-72,
                  0},{-69.5,6.08},{-64.7,15.9},{-57.5,26},{-47,36.1},{-31.8,
                  46.1},{-10.1,56},{22.1,66},{68.7,76.1},{80,78}}, color={0,0,
                  0}),
            Text(
              extent={{70,-3},{90,-23}},
              textString="20",
              lineColor={0,0,255}),
            Text(
              extent={{-78,-1},{-58,-21}},
              textString="1",
              lineColor={0,0,255}),
            Text(
              extent={{-109,72},{-89,88}},
              textString=" 1.3",
              lineColor={0,0,255}),
            Text(
              extent={{-109,-88},{-89,-72}},
              textString="-1.3",
              lineColor={0,0,255}),
            Text(
              extent={{62,30},{90,10}},
              lineColor={160,160,164},
              textString="u")}),
            Documentation(info="<HTML>
<p>
This blocks computes the output <b>y</b> as the
<i>base 10 logarithm</i> of the input <b>u</b>:
</p>
<pre>
    y = <b>log10</b>( u );
</pre>
<p>
An error occurs if the elements of the input <b>u</b> are
zero or negative.
</p>

<p>
<img src=\"../Images/Math/log10.png\">
</p>

</HTML>
"));
        end Log10AsEffect;

    block IntegratorWithRestart "Output the integral of the input signal"
      import Modelica.Blocks.Types.Init;
      parameter Real k=1/SecPerMin
        "Integrator gain .. default derivation per minute -> do a smaller steps per seconds";
      /* InitialState is the default, because it was the default in Modelica 2.2
     and therefore this setting is backward compatible
  */
      parameter Modelica.Blocks.Types.Init initType=Modelica.Blocks.Types.Init.InitialState
        "Type of initialization (1: no init, 2: steady state, 3,4: initial output)"
                                                                                        annotation(Evaluate=true,
          Dialog(group="Initialization"));
      parameter Real y_start=0 "Initial or guess value of output (= state)"
        annotation (Dialog(group="Initialization"));
      extends Modelica.Blocks.Interfaces.SISO(y(start=y_start));
      Interfaces.BooleanInput restart annotation (Placement(transformation(extent={{-100,
                60},{-60,100}}), iconTransformation(extent={{-140,-100},{-100,-60}})));
    initial equation
      if initType == Init.SteadyState then
         der(y) = 0;
      elseif initType == Init.InitialState or
             initType == Init.InitialOutput then
        y = y_start;
      end if;
    equation
        der(y) = k*u;
      when restart then
        reinit(y,y_start);
      end when;
      annotation (
        Documentation(info="<html>
<p>
This blocks computes output <b>y</b> (element-wise) as
<i>integral</i> of the input <b>u</b> multiplied with
the gain <i>k</i>:
</p>
<pre>
         k
     y = - u
         s
</pre>

<p>
It might be difficult to initialize the integrator in steady state.
This is discussed in the description of package
<a href=\"Modelica://Modelica.Blocks.Continuous#info\">Continuous</a>.
</p>

</html>
"),     Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Line(points={{-80,78},{-80,-90}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,-80},{82,-80}}, color={192,192,192}),
            Polygon(
              points={{90,-80},{68,-72},{68,-88},{90,-80}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{0,-10},{60,-70}},
              lineColor={192,192,192},
              textString="I"),
            Text(
              extent={{-150,-150},{150,-110}},
              lineColor={0,0,0},
              textString="k=%k"),
            Line(points={{-80,-80},{80,80}}, color={0,0,127})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
            Line(points={{-100,0},{-60,0}}, color={0,0,255}),
            Line(points={{60,0},{100,0}}, color={0,0,255}),
            Text(
              extent={{-36,60},{32,2}},
              lineColor={0,0,0},
              textString="k"),
            Text(
              extent={{-32,0},{36,-58}},
              lineColor={0,0,0},
              textString="s"),
            Line(points={{-46,0},{46,0}}, color={0,0,0})}));
    end IntegratorWithRestart;

        block Constant "Generate constant signal of type Real"
          parameter Real k(start=1) "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y
        "Connector of Real output signal" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Rectangle(
              extent={{-100,100},{100,-80}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-32},{100,46}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-168,-96},{180,-130}},
              lineColor={0,0,255},
              textString="%name")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end Constant;

        block FractConstant "Generate constant signal in part from 1"
          parameter Real k(start=1, final unit="%") "Part in percent";
          Physiolibraryold.Interfaces.RealOutput_ y(final unit="1")
        "Connector of Real output signal" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k/100;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-94,-50},{94,56}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              textString="%k%%")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end FractConstant;

        block Fract2Constant
      "Generate constant signal y as part on interval <0,1> and signal 1-y"
          parameter Real k(start=1, final unit="%") "Part in percent";
          Physiolibraryold.Interfaces.RealOutput_ y(final unit="1")
        "Connector of Real output signal" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0), iconTransformation(
              extent={{100,48},{120,68}})));
          Physiolibraryold.Interfaces.RealOutput_ y2(final unit="1")
        "Connector of Real output signal" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0), iconTransformation(
              extent={{100,-62},{120,-42}})));
        equation
          y = k/100;
          y2 = 1-y;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,2},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k %%"),
            Text(
              extent={{-100,-100},{100,-2}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="100-%k %%")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end Fract2Constant;

        block PressureConstant "Generate constant signal of type Pressure_mmHg"
          parameter Real k(start=1, final quantity="Pressure", final unit="mmHg")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Pressure",
          final unit="mmHg") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
      /*connect(y, y) annotation (Line(
          points={{110,0},{110,0}},
          color={0,0,127},
          smooth=Smooth.None)); */
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,-6},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-98,-82},{98,-20}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="mmHg")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end PressureConstant;

        block VolumeConstant "Generate constant signal of type Volume_ml"
          parameter Real k(start=1, final quantity="Volume", final unit="ml")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Volume",
          final unit="ml") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k ml")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end VolumeConstant;

        block OsmolarityConstant "Generate constant signal of type mOsm"
          parameter Real k(start=1, final quantity="Osmolarity", final unit="mOsm")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Osmolarity",
          final unit="mOsm") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-98,6},{100,86}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-80},{100,-18}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="mOsm")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end OsmolarityConstant;

        block TemperatureConstant
      "Generate constant signal of type temperature in Celsius degrees"
          parameter Real k(start=1, final quantity="Temperature", final unit="degC")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity=
            "Temperature", final unit="degC") "Connector of Real output signal"
        annotation (Placement(transformation(extent={{100,-10},{120,10}},
              rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k °C")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end TemperatureConstant;

        block TimeConstant "Generate constant signal in minutes"
          parameter Real k(start=1, final quantity="Time", final unit="min")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Time",
          final unit="min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,0},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="min")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end TimeConstant;

        block FlowConstant "Generate constant signal in units ml/min"
          parameter Real k(start=1, final quantity="Flow", final unit="ml/min")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Flow",
          final unit="ml/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,0},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="min"),
            Text(
              extent={{-100,-46},{100,30}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="____"),
            Text(
              extent={{-100,-38},{100,16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="ml")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end FlowConstant;

        block CaloriesConstant
      "Generate constant signal of type Energy in calories"
          parameter Real k(start=1, final quantity="Energy", final unit="cal")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Energy",
          final unit="Cal") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-40},{100,44}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k cal")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end CaloriesConstant;

        block ElectrolytesMassConstant
      "Generate constant signal of type Mass_mEq"
          parameter Real k(start=1, final quantity="Mass", final unit="mEq")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Mass",
          final unit="mEq") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k mEq")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end ElectrolytesMassConstant;

        block ComplianceConstant "Generate constant signal in units ml/mmHg"
          parameter Real k(start=1, final quantity="Compliance", final unit="ml/mmHg")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Compliance",
          final unit="ml/mmHg") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,0},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="mmHg"),
            Text(
              extent={{-100,-46},{100,30}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="____"),
            Text(
              extent={{-100,-38},{100,16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="ml")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end ComplianceConstant;

        block CondConstant "Generate constant signal in units (ml/min)/mmHg"
          parameter Real k(start=1, final quantity="Conductance", final unit="ml/(min.mmHg)")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity=
            "Conductance", final unit="ml/(min.mmHg)")
        "Connector of Real output signal" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,0},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-86},{98,-50}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="min.mmHg"),
            Text(
              extent={{-100,-46},{100,30}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="____"),
            Text(
              extent={{-98,-40},{94,0}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="ml")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end CondConstant;

        block ElectrolytesConcentrationConstant_per_l
      "Generate constant signal of type mEq/L"
          parameter Real k(start=1, final quantity="Concentration", final unit="mEq/l")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity=
            "Concentration", final unit="mEq/l")
        "Connector of Real output signal" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,0},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-38},{100,16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="mEq"),
            Text(
              extent={{-100,-46},{100,30}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="____"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="l")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end ElectrolytesConcentrationConstant_per_l;

        block ConcentrationConstant_pg_per_ml
      "Generate constant signal in units pg/ml"
          parameter Real k(start=1, final quantity="Concentration", final unit="pg/ml")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity=
            "Concentration", final unit="pg/ml")
        "Connector of Real output signal" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,0},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="ml"),
            Text(
              extent={{-100,-46},{100,30}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="____"),
            Text(
              extent={{-100,-38},{100,16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="pG")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end ConcentrationConstant_pg_per_ml;

        block ConcentrationConstant_uU_per_ml
      "Generate constant signal in units uU/ml"
          parameter Real k(start=1, final quantity="Concentration", final unit="uU/ml")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity=
            "Concentration", final unit="uU/ml")
        "Connector of Real output signal" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,0},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="ml"),
            Text(
              extent={{-100,-46},{100,30}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="____"),
            Text(
              extent={{-100,-38},{100,16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="uU")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end ConcentrationConstant_uU_per_ml;

        block MassFlowConstant "Generate constant signal in units mg/min"
          parameter Real k(start=1, final quantity="Flow", final unit="mg/min")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Flow",
          final unit="mg/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,0},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="min"),
            Text(
              extent={{-100,-46},{100,30}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="____"),
            Text(
              extent={{-100,-38},{100,16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="mg")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end MassFlowConstant;

        block ElectrolytesFlowConstant
      "Generate constant signal of type Mass_mEq_per_min"
          parameter Real k(start=1, final quantity="Flow", final unit="mEq/min")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Flow",
          final unit="mEq/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,-6},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="min"),
            Text(
              extent={{-100,-46},{100,30}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="____"),
            Text(
              extent={{-100,-38},{100,16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="mEq")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end ElectrolytesFlowConstant;

    block HeightConstant "Generate height constant signal in meter"
      parameter Real k(start=1, final quantity="Height", final unit="m")
        "Constant output value";
      Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Height", final
          unit="m") "Connector of Real output signal" annotation (Placement(
            transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      annotation (
        Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,0},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="m")}),
        Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
    Documentation(info="<html>
<p>
The Real output y is a constant height:
</p>
</html>"));
    end HeightConstant;

    block GConstant "Generate gravity constant signal in meter/s.s"
      parameter Real k(start=1, final quantity="G", final unit="m/(s.s)")
        "Constant output value";
      Physiolibraryold.Interfaces.RealOutput_ y(final quantity="G", final unit=
            "m/(s.s)") "Connector of Real output signal" annotation (Placement(
            transformation(extent={{100,-10},{120,10}}, rotation=0)));
    equation
      y = k;
      annotation (
        Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,0},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="m/(s.s)")}),
        Diagram(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
    Documentation(info="<html>
<p>
The Real output y is a constant height:
</p>
</html>"));
    end GConstant;

        block HormoneFlowConstant_mU "Generate constant signal in units mU/min"
          parameter Real k(start=1, final quantity="Flow", final unit="mU/min")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Flow",
          final unit="mU/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,0},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="min"),
            Text(
              extent={{-100,-46},{100,30}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="____"),
            Text(
              extent={{-100,-38},{100,16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="mU")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end HormoneFlowConstant_mU;

        block HormoneFlowConstant_nG "Generate constant signal in units nG/min"
          parameter Real k(start=1, final quantity="Flow", final unit="ng/min")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Flow",
          final unit="ng/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,0},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="min"),
            Text(
              extent={{-100,-46},{100,30}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="____"),
            Text(
              extent={{-100,-38},{100,16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="nG")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end HormoneFlowConstant_nG;

        block HormoneFlowConstant_pmol
      "Generate constant signal in units pmol/min"
          parameter Real k(start=1, final quantity="Flow", final unit="pmol/min")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Flow",
          final unit="pmol/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,0},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="min"),
            Text(
              extent={{-100,-46},{100,30}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="____"),
            Text(
              extent={{-100,-38},{100,16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="pmol")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end HormoneFlowConstant_pmol;

        block HormoneFlowConstant_uG "Generate constant signal in units uG/min"
          parameter Real k(start=1, final quantity="Flow", final unit="ug/min")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Flow",
          final unit="ug/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,0},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="min"),
            Text(
              extent={{-100,-46},{100,30}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="____"),
            Text(
              extent={{-100,-38},{100,16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="uG")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end HormoneFlowConstant_uG;

        block HormoneFlowConstant_GU "Generate constant signal in units U/min"
          parameter Real k(start=1, final quantity="Flow", final unit="GU/min")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Flow",
          final unit="GU/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,0},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="min"),
            Text(
              extent={{-100,-46},{100,30}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="____"),
            Text(
              extent={{-100,-38},{100,16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="GU")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end HormoneFlowConstant_GU;

        block CaloriesFlowConstant
      "Generate constant signal of type Energy Flow in calories per minute"
          parameter Real k(start=1, final quantity="Flow", final unit="cal/min")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Flow",
          final unit="Cal/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,2},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-52},{100,24}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="____"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="min"),
            Text(
              extent={{-100,-44},{100,16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="cal")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end CaloriesFlowConstant;

        block HormoneFlowConstant_nmol
      "Generate constant signal in units nmol/min"
          parameter Real k(start=1, final quantity="Flow", final unit="nmol/min")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Flow",
          final unit="nmol/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,0},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="min"),
            Text(
              extent={{-100,-46},{100,30}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="____"),
            Text(
              extent={{-100,-38},{100,16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="nmol")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end HormoneFlowConstant_nmol;

        block HormoneFlowConstant_IU "Generate constant signal in units IU/min"
          parameter Real k(start=1, final quantity="Flow", final unit="IU/min")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Flow",
          final unit="IU/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,0},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="min"),
            Text(
              extent={{-100,-46},{100,30}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="____"),
            Text(
              extent={{-100,-38},{100,16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="IU")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end HormoneFlowConstant_IU;

        block MassFlowConstant_kg "Generate constant signal in units kg/min"
          parameter Real k(start=1, final quantity="Flow", final unit="kg/min")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Flow",
          final unit="kg/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,20},{100,92}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="min"),
            Text(
              extent={{-100,-46},{100,30}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="____"),
            Text(
              extent={{-100,-38},{100,16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="kg")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end MassFlowConstant_kg;

        block SafeDivision
      "Output first input divided by second input, if the second input is zero return parameter"
          extends Modelica.Blocks.Interfaces.SI2SO;
          parameter Real ZeroDivisorResult=0;
          parameter Real Zero=1e-20;
        equation
          y = if u2<=Zero and u2>=-Zero then ZeroDivisorResult else u1/u2;
          annotation (
            Documentation(info="
<HTML>
<p>
This block computes the output <b>y</b> (element-wise)
by <i>dividing</i> the corresponding elements of
the two inputs <b>u1</b> and <b>u2</b>:
</p>
<pre>
    y = u1 / u2;
</pre>

</HTML>
"),         Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Line(points={{50,0},{100,0}}, color={0,0,127}),
            Line(points={{-30,0},{30,0}}, color={0,0,0}),
            Ellipse(
              extent={{-5,20},{5,30}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-5,-20},{5,-30}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(extent={{-50,50},{50,-50}}, lineColor={0,0,127}),
            Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255}),
            Line(points={{-100,60},{-66,60},{-40,30}}, color={0,0,127}),
            Line(points={{-100,-60},{0,-60},{0,-50}}, color={0,0,127}),
            Text(
              extent={{-96,-62},{98,-98}},
              lineColor={0,0,0},
              textString="u/0 = %ZeroDivisorResult")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{50,0},{100,0}}, color={0,0,255}),
            Line(points={{-30,0},{30,0}}, color={0,0,0}),
            Ellipse(
              extent={{-5,20},{5,30}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(
              extent={{-5,-20},{5,-30}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Ellipse(extent={{-50,50},{50,-50}}, lineColor={0,0,255}),
            Line(points={{-100,60},{-66,60},{-40,30}}, color={0,0,255}),
            Line(points={{-100,-60},{0,-60},{0,-50}}, color={0,0,255})}),
            uses(Modelica(version="3.1")));
        end SafeDivision;

    block Min "Pass through the smallest signal"
      extends Modelica.Blocks.Interfaces.MISO;
    equation
       y = min(u);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Text(
              extent={{-90,36},{90,-36}},
              lineColor={160,160,164},
              textString="min()")}),
                              Documentation(info="<html>
<p>
This block computes the output <b>y</b> as <i>minimum</i> of
the Real inputs <b>u[1]</b>,<b>u[2]</b> .. <b>u[nin]</b>:
</p>
<pre>    y = <b>min</b> ( u );
</pre>
</html>
"));
    end Min;

    block WriteValue
      parameter String VariableName;
      inner parameter String FileName;
    Interfaces.RealInput_ u
        annotation (Placement(transformation(extent={{-48,2},{-34,16}}),
             iconTransformation(extent={{-100,-20},{-60,20}})));
    algorithm
      when ( terminal()) then
          Modelica.Utilities.Streams.print(VariableName+"|"+String(u),FileName);
      end when;
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,40},{100,-60}},
              lineColor={0,0,0},
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-98,-22},{100,-52}},
              lineColor={0,0,0},
              textString="%VariableName"),
            Text(
              extent={{-36,16},{68,-14}},
              lineColor={0,0,0},
              textString="write")}));
    end WriteValue;

        block HormoneFlowConstant_U "Generate constant signal in units U/min"
          parameter Real k(start=1, final quantity="Flow", final unit="U/min")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Flow",
          final unit="U/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,0},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="min"),
            Text(
              extent={{-100,-46},{100,30}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="____"),
            Text(
              extent={{-100,-38},{100,16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="U")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end HormoneFlowConstant_U;

        block HormoneFlowConstant_mmol
      "Generate constant signal in units mmol/min"
          parameter Real k(start=1, final quantity="Flow", final unit="mmol/min")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Flow",
          final unit="mmol/min") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,0},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="min"),
            Text(
              extent={{-100,-46},{100,30}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="____"),
            Text(
              extent={{-100,-38},{100,16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="mmol")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end HormoneFlowConstant_mmol;

        block SoluteMassConstant "Generate constant signal of type mMol"
          parameter Real k(start=1, final quantity="Mass", final unit="mmol")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Mass",
          final unit="mmol") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,4},{100,74}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-96},{100,-20}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="mmol")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end SoluteMassConstant;

        block FlowConstant_mmol_per_hour
      "Generate constant signal in units mmol/h"
          parameter Real k(start=1, final quantity="Flow", final unit="mmol/h")
        "Constant output value";
          Physiolibraryold.Interfaces.RealOutput_ y(final quantity="Flow",
          final unit="mmol/h") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{100,-10},{120,10}}, rotation=0)));
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-100,0},{100,100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k"),
            Text(
              extent={{-100,-100},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="h"),
            Text(
              extent={{-100,-46},{100,30}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="____"),
            Text(
              extent={{-100,-38},{100,16}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="mmol")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end FlowConstant_mmol_per_hour;

    model Integrator
      extends Utilities.DynamicState;
      parameter Real k=1 "Integrator gain";
      parameter Real y_start=0 "Initial or guess value of output (= state)"
        annotation (Dialog(group="Initialization"));
      extends Interfaces.SISO(y(start=y_start));
    equation
      stateValue = y;
      changePerMin = u*SecPerMin;
      annotation (
        Documentation(info="<html>
<p>
This blocks computes output <b>y</b> (element-wise) as
<i>integral</i> of the input <b>u</b> multiplied with
the gain <i>k</i>:
</p>
<pre>
         k
     y = - u
         s
</pre>

<p>
It might be difficult to initialize the integrator in steady state.
This is discussed in the description of package
<a href=\"Modelica://Modelica.Blocks.Continuous#info\">Continuous</a>.
</p>

</html>
"),     Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Line(points={{-80,78},{-80,-90}}, color={192,192,192}),
            Polygon(
              points={{-80,90},{-88,68},{-72,68},{-80,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,-80},{82,-80}}, color={192,192,192}),
            Polygon(
              points={{90,-80},{68,-72},{68,-88},{90,-80}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{0,-10},{60,-70}},
              lineColor={192,192,192},
              textString="I"),
            Text(
              extent={{-150,-150},{150,-110}},
              lineColor={0,0,0},
              textString="k=%k"),
            Line(points={{-80,-80},{80,80}}, color={0,0,127}),
            Text(
              extent={{-150,106},{150,146}},
              lineColor={0,0,0},
              textString="%stateName")}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255}),
            Line(points={{-100,0},{-60,0}}, color={0,0,255}),
            Line(points={{60,0},{100,0}}, color={0,0,255}),
            Text(
              extent={{-36,60},{32,2}},
              lineColor={0,0,0},
              textString="k"),
            Text(
              extent={{-32,0},{36,-58}},
              lineColor={0,0,0},
              textString="s"),
            Line(points={{-46,0},{46,0}}, color={0,0,0})}));
    end Integrator;

        model InitialVolumeConstant "Set initial value of input signal"
          parameter Real k(start=1, final quantity="Volume", final unit="ml")
        "Constant output value";
          Physiolibraryold.Interfaces.RealInput_ y(final quantity="Volume",
          final unit="ml") "Connector of Real output signal" annotation (
          Placement(transformation(extent={{-120,-14},{-100,6}}, rotation=0),
            iconTransformation(extent={{-120,-10},{-100,10}})));
        initial equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-46},{100,54}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%k ml")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Text(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,0},
              textString="%k")}),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end InitialVolumeConstant;

        block Limiter_ "Limit the range of a signal. Better solution."
          parameter Real uMax(start=1) "Upper limits of input signals";
          parameter Real uMin= -uMax "Lower limits of input signals";
          parameter Boolean limitsAtInit = true
        "= false, if limits are ignored during initializiation (i.e., y=u)";
          extends Modelica.Blocks.Interfaces.SISO;
        equation
          assert(uMax >= uMin, "Limiter: Limits must be consistent. However, uMax (=" + String(uMax) +
                               ") < uMin (=" + String(uMin) + ")");
          if initial() and not limitsAtInit then
             y = u;
             assert(u >= uMin - 0.01*abs(uMin) and
                    u <= uMax + 0.01*abs(uMax),
                   "Limiter: During initialization the limits have been ignored.\n"+
                   "However, the result is that the input u is not within the required limits:\n"+
                   "  u = " + String(u) + ", uMin = " + String(uMin) + ", uMax = " + String(uMax));
          else
             y = smooth(0,if u > uMax then uMax else if u < uMin then uMin else u);
          end if;
          annotation (
            Documentation(info="
<HTML>
<p>
The Limiter block passes its input signal as output signal
as long as the input is within the specified upper and lower
limits. If this is not the case, the corresponding limits are passed
as output.
</p>
</HTML>
"),         Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Line(points={{0,-90},{0,68}}, color={192,192,192}),
            Polygon(
              points={{0,90},{-8,68},{8,68},{0,90}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{68,0}}, color={192,192,192}),
            Polygon(
              points={{90,0},{68,-8},{68,8},{90,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-80,-70},{-50,-70},{50,70},{80,70}}, color={0,0,0}),
            Text(
              extent={{-150,-150},{150,-110}},
              lineColor={0,0,0},
              textString="uMax=%uMax"),
            Text(
              extent={{-150,150},{150,110}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{-150,-180},{150,-140}},
              lineColor={0,0,0},
              textString="uMin=%uMin")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Line(points={{0,-60},{0,50}}, color={192,192,192}),
            Polygon(
              points={{0,60},{-5,50},{5,50},{0,60}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-60,0},{50,0}}, color={192,192,192}),
            Polygon(
              points={{60,0},{50,-5},{50,5},{60,0}},
              lineColor={192,192,192},
              fillColor={192,192,192},
              fillPattern=FillPattern.Solid),
            Line(points={{-50,-40},{-30,-40},{30,40},{50,40}}, color={0,0,0}),
            Text(
              extent={{46,-6},{68,-18}},
              lineColor={128,128,128},
              textString="u"),
            Text(
              extent={{-30,70},{-5,50}},
              lineColor={128,128,128},
              textString="y"),
            Text(
              extent={{-58,-54},{-28,-42}},
              lineColor={128,128,128},
              textString="uMin"),
            Text(
              extent={{26,40},{66,56}},
              lineColor={128,128,128},
              textString="uMax")}));
        end Limiter_;

    model u_0_625 "u ^ 0.625"
      extends Interfaces.MultXIcon;
      parameter Real x=0.625;
      Interfaces.RealInput_G u1 annotation (Placement(transformation(extent={{-140,-20},
                {-100,20}}), iconTransformation(extent={{-140,-20},{-100,20}})));
      Interfaces.RealOutput_G y annotation (Placement(transformation(extent={{100,-10},
                {120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
    equation
      y = u1^x;
      annotation (Icon(graphics), Diagram(coordinateSystem(preserveAspectRatio=true,
              extent={{-100,-100},{100,100}}), graphics));
    end u_0_625;

        block deprecated_HomotopyStrongComponentBreaker
      "break the strong component in normalized signal with default value"
          extends Physiolibraryold.Interfaces.SISO;
          parameter Real defaultValue=1;
          parameter Real defaultSlope=0;
        equation
          y = homotopy(u,defaultValue + defaultSlope*(u-defaultValue));
           annotation (defaultComponentName="homotopyOperator",
            Documentation(info="
<HTML>
<p>
This blocks computes output <b>y</b> as
<i>average value</i> of the elements of the input signal vector
<b>u</b>:
</p>
<pre>
    <b>y</b> = (<b>u</b>[1] + <b>u</b>[2] + ... + <b>u</b>[n]) / n;
</pre>
<p>
Example:
</p>
<pre>
     parameter:   nin = 3;
 
  results in the following equations:
 
     y = (u[1] + u[2] + u[3]) / 3;
</pre>
 
</HTML>
"),         Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
                initialScale=0.04), graphics={Text(
              extent={{-100,-24},{96,20}},
              lineColor={0,0,255},
                  textString="Homotopy")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
                initialScale=0.04), graphics={Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-98,-18},{98,26}},
              lineColor={0,0,255},
                  textString="Homotopy")}));
        end deprecated_HomotopyStrongComponentBreaker;

        block WithStartValue
      "break the strong component in normalized signal with default value"
          extends Physiolibraryold.Interfaces.SISO(y(start=startValue));
          parameter Real startValue=1;
        equation
          y = u;
           annotation (defaultComponentName="homotopyOperator",
            Documentation(info="
<HTML>
<p>
This blocks computes output <b>y</b> as
<i>average value</i> of the elements of the input signal vector
<b>u</b>:
</p>
<pre>
    <b>y</b> = (<b>u</b>[1] + <b>u</b>[2] + ... + <b>u</b>[n]) / n;
</pre>
<p>
Example:
</p>
<pre>
     parameter:   nin = 3;
 
  results in the following equations:
 
     y = (u[1] + u[2] + u[3]) / 3;
</pre>
 
</HTML>
"),         Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
                initialScale=0.04), graphics={Text(
              extent={{-100,-24},{96,20}},
              lineColor={0,0,255},
                  textString="Homotopy")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
                initialScale=0.04), graphics={Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-98,-18},{98,26}},
              lineColor={0,0,255},
                  textString="Homotopy")}));
        end WithStartValue;
  end Blocks;

  package Curves "Empirical Dependence of Two Variables"
    //OpenModelica bez ExternalObject
    /*#if OMC
    model Curve
      extends pavol_version.Curve;
      parameter Boolean INVERSION=false "only for compatibility";
    end Curve;
    #endif OMC*/
    //#if not OMC
    model Curve
      extends pavol_version.Curve;
      parameter Boolean INVERSION=false "only for compatibility";
    end Curve;
    //#endif not OMC
    model Curve_
      extends CubicCurve;
    /*
 parameter Integer iconNP(fixed=true) = 20;
 parameter Real iconU[iconNP](fixed=false);
 parameter Real iconPoint[iconNP,2](final unit="mm",fixed=false); // = {{-70,-42},{-22,38},{32,36},{82,-74},{72,-36}};
 parameter Integer iconFrom[20](fixed=false);
 Real iconActualPoint[2,2](final unit="mm");
*/
     parameter Integer iconNP(fixed=true) = 20;
     parameter Real iconPoint[iconNP,2](final unit="mm",fixed=false);
     Real iconActualPoint[2,2](final unit="mm");
    initial equation
      for i in 1:iconNP loop
        iconPoint[i,1] = i*(160/(iconNP-1)) - 80;
    //x.. min(x)+ (i*(max(x)-min(x)))/(iconNP-1);
        iconPoint[i,2] = (-50 +
                      (100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1)))) *
                        ( value(curveID,(min(x[j] for j in 1:size(x,1))+(i*(max(x[j] for j in 1:size(x,1))-min(x[j] for j in 1:size(x,1))))/(iconNP-1)))
                           - min(y[j] for j in 1:size(y,1))));
      end for;
    equation
     iconActualPoint[1,1]=(u-min(x[j] for j in 1:size(x,1)))*160/(max(x[j] for j in 1:size(x,1))-min(x[j] for j in 1:size(x,1))) - 80 -2;
     iconActualPoint[1,2]=(val-min(y[j] for j in 1:size(y,1)))*100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1))) - 50 -2;
     iconActualPoint[2,1]=iconActualPoint[1,1]+4;
     iconActualPoint[2,2]=iconActualPoint[1,2]+4;
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-94,-44},{100,-100}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%name"),
            Text(
              extent={{-100,100},{100,50}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="curve"),
            Line(
              points=DynamicSelect({{-100,0},{100,0}}, iconPoint),
              color={0,0,0},
              smooth=Smooth.None),
            Ellipse(
              extent=DynamicSelect({{0,0},{0,0}}, iconActualPoint),
              lineColor={0,0,0},
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid)}),
     Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Curve_;

    model CubicCurve
     parameter Boolean INVERSION(fixed=true)=false;
     parameter Real x[:](fixed=true);
     parameter Real y[:](fixed=true);
     parameter Real slope[:](fixed=true);
    /*
 Real u;
 Real val;
*/
     Interfaces.RealInput_ u
                  annotation (Placement(transformation(extent={{-90,-50},{-50,-10}}),
            iconTransformation(extent={{-120,-20},{-80,20}})));
     Interfaces.RealOutput_ val
                     annotation (Placement(transformation(extent={{70,-10},{110,30}}),
            iconTransformation(extent={{80,-20},{120,20}})));
     parameter Integer curveID(fixed=false);
     function initCubicCurve
      input Real xs[:];
      input Real ys[:];
      input Real slopes[:];
      input Boolean inversible;
      output Integer curveID;
      external "C" curveID =
                           initCubicCurve( xs, size(xs,1), ys, size(ys,1), slopes, size(slopes,1), inversible)
         annotation (Include="#include <./numericalSolutions/CubicCurve/CubicCurve/CubicCurve.h>", Library="./numericalSolutions/CubicCurve/Release/CubicCurve");
        //     annotation (Include="#include <./numericalSolutions/CubicCurve/CubicCurve/CubicCurve.h>", Library="./numericalSolutions/CubicCurve/Debug/CubicCurve");
     end initCubicCurve;

     function value
      input Integer curveID;
      input Real u;
      output Real val;
      external "C" val =
                       value(curveID,u)
        annotation (Include="#include <./numericalSolutions/CubicCurve/CubicCurve/CubicCurve.h>", Library="./numericalSolutions/CubicCurve/Release/CubicCurve");
        //     annotation (Include="#include <./numericalSolutions/CubicCurve/CubicCurve/CubicCurve.h>", Library="./numericalSolutions/CubicCurve/Debug/CubicCurve");
     end value;

     function inverse
      input Integer curveID;
      input Real val;
      output Real u;
      external "C" u =
                     inverse(curveID,val)
         annotation (Include="#include <./numericalSolutions/CubicCurve/CubicCurve/CubicCurve.h>", Library="./numericalSolutions/CubicCurve/Release/CubicCurve");
        //  annotation (Include="#include <./numericalSolutions/CubicCurve/CubicCurve/CubicCurve.h>", Library="./numericalSolutions/CubicCurve/Debug/CubicCurve");
     end inverse;
    initial equation
       curveID=initCubicCurve(x,y,slope,INVERSION);
    equation
        if INVERSION then
         u = inverse(curveID,val);
        else
         val = value(curveID,u);
        end if;
    end CubicCurve;

    package NonlinearSystemPatch
       model Curve2
        "2D natural cubic interpolation spline defined with (x,y,slope) points"
          // extends Library.BaseModel;
           parameter Real x[2];
           parameter Real y[2];
           parameter Real slope[2];
           Physiolibraryold.Interfaces.RealInput_ u annotation (Placement(
              transformation(extent={{-100,-60},{-60,-20}}), iconTransformation(
                extent={{-120,-20},{-80,20}})));
           Physiolibraryold.Interfaces.RealOutput_ val annotation (Placement(
              transformation(extent={{60,-20},{100,20}}), iconTransformation(
                extent={{82,-20},{122,20}})));
           //parameter Integer iconNP = 20;
           //Real iconU[iconNP];
           //Real iconPoint[iconNP,2](final unit="mm"); // = {{-70,-42},{-22,38},{32,36},{82,-74},{72,-36}};
           //Real iconActualPoint[2,2](final unit="mm");
      protected
           Real a[size(x,1)-1,4];
           Real c1;
           Real c2;
           Integer iFrom;
           //Integer iconFrom[20];
       equation
           // only icon drawing
           /*
       iconPoint[1,1] = -80;
       iconU[1]=min(x[j] for j in 1:size(x,1));
       iconPoint[1,2] = (-50 +
                        (100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1)))) *
                          (a[iconFrom[1],1]*(min(x[j] for j in 1:size(x,1)))^3 +
                           a[iconFrom[1],2]*(min(x[j] for j in 1:size(x,1)))^2 +
                           a[iconFrom[1],3]*(min(x[j] for j in 1:size(x,1))) +
                           a[iconFrom[1],4]
                           - min(y[j] for j in 1:size(y,1))));
       iconFrom[1] = if (size(x,1)==4) then (if (min(x[j] for j in 1:size(x,1)))<=x[2] then 1 else 
                          if (min(x[j] for j in 1:size(x,1)))<=x[3] then 2 else 3) else 
                     if (size(x,1)==3) then (if (min(x[j] for j in 1:size(x,1)))<=x[2] then 1 else 2) else 
                     1;

       for i in 1:(iconNP-1) loop
          iconPoint[i+1,1] = i*(160/(iconNP-1)) - 80;
      //x.. min(x)+ (i*(max(x)-min(x)))/(iconNP-1);
          iconU[i+1]=(min(x[j] for j in 1:size(x,1))+(i*(max(x[j] for j in 1:size(x,1))-min(x[j] for j in 1:size(x,1))))/(iconNP-1));
          iconPoint[i+1,2] = (-50 +
                        (100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1)))) *
                          (a[iconFrom[i],1]*iconU[i+1]^3 +
                           a[iconFrom[i],2]*iconU[i+1]^2 +
                           a[iconFrom[i],3]*iconU[i+1] +
                           a[iconFrom[i],4]
                           - min(y[j] for j in 1:size(y,1))));
          iconFrom[i+1] = if (size(x,1)==8) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else if iconU[i+1]<x[5] then 4 else if iconU[i+1]<x[6] then 5 else if iconU[i+1]<x[7] then 6 else 7) else 
                          if (size(x,1)==7) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else if iconU[i+1]<x[5] then 4 else if iconU[i+1]<x[6] then 5 else 6) else 
                          if (size(x,1)==6) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else if iconU[i+1]<x[4] then 4 else 5) else 
                          if (size(x,1)==5) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else 4) else 
                          if (size(x,1)==4) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else 3) else 
                          if (size(x,1)==3) then (if iconU[i+1]<=x[2] then 1 else 2) else 
                             1;
       end for;

       iconActualPoint[1,1]=(u-min(x[j] for j in 1:size(x,1)))*160/(max(x[j] for j in 1:size(x,1))-min(x[j] for j in 1:size(x,1))) - 80 -2;
       iconActualPoint[1,2]=(val-min(y[j] for j in 1:size(y,1)))*100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1))) - 50 -2;
       iconActualPoint[2,1]=iconActualPoint[1,1]+4;
       iconActualPoint[2,2]=iconActualPoint[1,2]+4;
*/
          //main equations
           for i in 1:size(x,1)-1 loop
             a[i,1]*x[i]^3 + a[i,2]*x[i]^2 + a[i,3]*x[i] + a[i,4] = y[i];
             3*a[i,1]*x[i]^2 + 2*a[i,2]*x[i] + a[i,3] = slope[i];
             a[i,1]*x[i+1]^3 + a[i,2]*x[i+1]^2 + a[i,3]*x[i+1] + a[i,4] = y[i+1];
             3*a[i,1]*x[i+1]^2 + 2*a[i,2]*x[i+1] + a[i,3] = slope[i+1];
           end for;
           slope[1]*x[1]+c1 = y[1];
           slope[size(x,1)]*x[size(x,1)]+c2 = y[size(x,1)];
           val = if (u<x[1]) then slope[1]*u + c1 else
                  if (u>x[size(x,1)]) then slope[size(x,1)]*u + c2 else
                  a[iFrom,1]*u^3 + a[iFrom,2]*u^2 + a[iFrom,3]*u + a[iFrom,4];
           iFrom =   1;
                     //if (size(x,1)==8) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else if u<x[5] then 4 else if u<x[6] then 5 else if u<x[7] then 6 else 7) else
                     //if (size(x,1)==7) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else if u<x[5] then 4 else if u<x[6] then 5 else 6) else
                     //if (size(x,1)==6) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else if u<x[4] then 4 else 5) else
                     //if (size(x,1)==5) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else 4) else
                     //if (size(x,1)==4) then (if u<=x[2] then 1 else if u<=x[3] then 2 else 3) else
                     //if (size(x,1)==3) then (if u<=x[2] then 1 else 2) else
                     //    1;
                     //if u<=x[2] then 1 else 2;
       end Curve2;

        model Curve3
        "2D natural cubic interpolation spline defined with (x,y,slope) points"
          // extends Library.BaseModel;
           parameter Real x[3];
           parameter Real y[3];
           parameter Real slope[3];
           Physiolibraryold.Interfaces.RealInput_ u annotation (Placement(
              transformation(extent={{-100,-60},{-60,-20}}), iconTransformation(
                extent={{-120,-20},{-80,20}})));
           Physiolibraryold.Interfaces.RealOutput_ val annotation (Placement(
              transformation(extent={{60,-20},{100,20}}), iconTransformation(
                extent={{82,-20},{122,20}})));
           //parameter Integer iconNP = 20;
           //Real iconU[iconNP];
           //Real iconPoint[iconNP,2](final unit="mm"); // = {{-70,-42},{-22,38},{32,36},{82,-74},{72,-36}};
           //Real iconActualPoint[2,2](final unit="mm");
      protected
           Real a[size(x,1)-1,4];
           Real c1;
           Real c2;
           Integer iFrom;
           //Integer iconFrom[20];
        equation
           // only icon drawing
           /*
       iconPoint[1,1] = -80;
       iconU[1]=min(x[j] for j in 1:size(x,1));
       iconPoint[1,2] = (-50 +
                        (100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1)))) *
                          (a[iconFrom[1],1]*(min(x[j] for j in 1:size(x,1)))^3 +
                           a[iconFrom[1],2]*(min(x[j] for j in 1:size(x,1)))^2 +
                           a[iconFrom[1],3]*(min(x[j] for j in 1:size(x,1))) +
                           a[iconFrom[1],4]
                           - min(y[j] for j in 1:size(y,1))));
       iconFrom[1] = if (size(x,1)==4) then (if (min(x[j] for j in 1:size(x,1)))<=x[2] then 1 else 
                          if (min(x[j] for j in 1:size(x,1)))<=x[3] then 2 else 3) else 
                     if (size(x,1)==3) then (if (min(x[j] for j in 1:size(x,1)))<=x[2] then 1 else 2) else 
                     1;

       for i in 1:(iconNP-1) loop
          iconPoint[i+1,1] = i*(160/(iconNP-1)) - 80;
      //x.. min(x)+ (i*(max(x)-min(x)))/(iconNP-1);
          iconU[i+1]=(min(x[j] for j in 1:size(x,1))+(i*(max(x[j] for j in 1:size(x,1))-min(x[j] for j in 1:size(x,1))))/(iconNP-1));
          iconPoint[i+1,2] = (-50 +
                        (100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1)))) *
                          (a[iconFrom[i],1]*iconU[i+1]^3 +
                           a[iconFrom[i],2]*iconU[i+1]^2 +
                           a[iconFrom[i],3]*iconU[i+1] +
                           a[iconFrom[i],4]
                           - min(y[j] for j in 1:size(y,1))));
          iconFrom[i+1] = if (size(x,1)==8) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else if iconU[i+1]<x[5] then 4 else if iconU[i+1]<x[6] then 5 else if iconU[i+1]<x[7] then 6 else 7) else 
                          if (size(x,1)==7) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else if iconU[i+1]<x[5] then 4 else if iconU[i+1]<x[6] then 5 else 6) else 
                          if (size(x,1)==6) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else if iconU[i+1]<x[4] then 4 else 5) else 
                          if (size(x,1)==5) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else 4) else 
                          if (size(x,1)==4) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else 3) else 
                          if (size(x,1)==3) then (if iconU[i+1]<=x[2] then 1 else 2) else 
                             1;
       end for;

       iconActualPoint[1,1]=(u-min(x[j] for j in 1:size(x,1)))*160/(max(x[j] for j in 1:size(x,1))-min(x[j] for j in 1:size(x,1))) - 80 -2;
       iconActualPoint[1,2]=(val-min(y[j] for j in 1:size(y,1)))*100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1))) - 50 -2;
       iconActualPoint[2,1]=iconActualPoint[1,1]+4;
       iconActualPoint[2,2]=iconActualPoint[1,2]+4;
*/
          //main equations
           for i in 1:size(x,1)-1 loop
             a[i,1]*x[i]^3 + a[i,2]*x[i]^2 + a[i,3]*x[i] + a[i,4] = y[i];
             3*a[i,1]*x[i]^2 + 2*a[i,2]*x[i] + a[i,3] = slope[i];
             a[i,1]*x[i+1]^3 + a[i,2]*x[i+1]^2 + a[i,3]*x[i+1] + a[i,4] = y[i+1];
             3*a[i,1]*x[i+1]^2 + 2*a[i,2]*x[i+1] + a[i,3] = slope[i+1];
           end for;
           slope[1]*x[1]+c1 = y[1];
           slope[size(x,1)]*x[size(x,1)]+c2 = y[size(x,1)];
           val = if (u<x[1]) then slope[1]*u + c1 else
                  if (u>x[size(x,1)]) then slope[size(x,1)]*u + c2 else
                  a[iFrom,1]*u^3 + a[iFrom,2]*u^2 + a[iFrom,3]*u + a[iFrom,4];
           iFrom =   if u<=x[2] then 1 else 2;
                     //if (size(x,1)==8) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else if u<x[5] then 4 else if u<x[6] then 5 else if u<x[7] then 6 else 7) else
                     //if (size(x,1)==7) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else if u<x[5] then 4 else if u<x[6] then 5 else 6) else
                     //if (size(x,1)==6) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else if u<x[4] then 4 else 5) else
                     //if (size(x,1)==5) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else 4) else
                     //if (size(x,1)==4) then (if u<=x[2] then 1 else if u<=x[3] then 2 else 3) else
                     //if (size(x,1)==3) then (if u<=x[2] then 1 else 2) else
                     //    1;
        end Curve3;
    end NonlinearSystemPatch;

    package old_version
      model Curve
        "2D natural cubic interpolation curve defined with (x,y,slope) points"
      // extends Library.BaseModel;
       parameter Real x[:];
       parameter Real y[:];
       parameter Real slope[:];
       Physiolibraryold.Interfaces.RealInput_ u annotation (Placement(
              transformation(extent={{-100,-60},{-60,-20}}), iconTransformation(
                extent={{-120,-20},{-80,20}})));
       Physiolibraryold.Interfaces.RealOutput_ val annotation (Placement(
              transformation(extent={{60,-20},{100,20}}), iconTransformation(
                extent={{82,-20},{122,20}})));
       parameter Integer iconNP = 20;
       Real iconU[iconNP];
       Real iconPoint[iconNP,2](final unit="mm"); // = {{-70,-42},{-22,38},{32,36},{82,-74},{72,-36}};
       Real iconActualPoint[2,2](final unit="mm");
       Integer iFrom;
      protected
       Real a[size(x,1)-1,4];
       Real c1;
       Real c2;
       Integer iconFrom[20];
      equation
       // only icon drawing
       iconPoint[1,1] = -80;
       iconU[1]=min(x[j] for j in 1:size(x,1));
       iconPoint[1,2] = (-50 +
                        (100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1)))) *
                          (a[iconFrom[1],1]*(min(x[j] for j in 1:size(x,1)))^3 +
                           a[iconFrom[1],2]*(min(x[j] for j in 1:size(x,1)))^2 +
                           a[iconFrom[1],3]*(min(x[j] for j in 1:size(x,1))) +
                           a[iconFrom[1],4]
                           - min(y[j] for j in 1:size(y,1))));
       iconFrom[1] = if (size(x,1)==4) then (if (min(x[j] for j in 1:size(x,1)))<=x[2] then 1 else
                          if (min(x[j] for j in 1:size(x,1)))<=x[3] then 2 else 3) else
                     if (size(x,1)==3) then (if (min(x[j] for j in 1:size(x,1)))<=x[2] then 1 else 2) else
                     1;
       for i in 1:(iconNP-1) loop
          iconPoint[i+1,1] = i*(160/(iconNP-1)) - 80;
      //x.. min(x)+ (i*(max(x)-min(x)))/(iconNP-1);
          iconU[i+1]=(min(x[j] for j in 1:size(x,1))+(i*(max(x[j] for j in 1:size(x,1))-min(x[j] for j in 1:size(x,1))))/(iconNP-1));
          iconPoint[i+1,2] = (-50 +
                        (100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1)))) *
                          (a[iconFrom[i],1]*iconU[i+1]^3 +
                           a[iconFrom[i],2]*iconU[i+1]^2 +
                           a[iconFrom[i],3]*iconU[i+1] +
                           a[iconFrom[i],4]
                           - min(y[j] for j in 1:size(y,1))));
          iconFrom[i+1] = if (size(x,1)==8) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else if iconU[i+1]<x[5] then 4 else if iconU[i+1]<x[6] then 5 else if iconU[i+1]<x[7] then 6 else 7) else
                          if (size(x,1)==7) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else if iconU[i+1]<x[5] then 4 else if iconU[i+1]<x[6] then 5 else 6) else
                          if (size(x,1)==6) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else if iconU[i+1]<x[4] then 4 else 5) else
                          if (size(x,1)==5) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else 4) else
                          if (size(x,1)==4) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else 3) else
                          if (size(x,1)==3) then (if iconU[i+1]<=x[2] then 1 else 2) else
                             1;
       end for;
       iconActualPoint[1,1]=(u-min(x[j] for j in 1:size(x,1)))*160/(max(x[j] for j in 1:size(x,1))-min(x[j] for j in 1:size(x,1))) - 80 -2;
       iconActualPoint[1,2]=(val-min(y[j] for j in 1:size(y,1)))*100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1))) - 50 -2;
       iconActualPoint[2,1]=iconActualPoint[1,1]+4;
       iconActualPoint[2,2]=iconActualPoint[1,2]+4;
      //main equations
       for i in 1:size(x,1)-1 loop
         a[i,1]*x[i]^3 + a[i,2]*x[i]^2 + a[i,3]*x[i] + a[i,4] = y[i];
         3*a[i,1]*x[i]^2 + 2*a[i,2]*x[i] + a[i,3] = slope[i];
         a[i,1]*x[i+1]^3 + a[i,2]*x[i+1]^2 + a[i,3]*x[i+1] + a[i,4] = y[i+1];
         3*a[i,1]*x[i+1]^2 + 2*a[i,2]*x[i+1] + a[i,3] = slope[i+1];
       end for;
       slope[1]*x[1]+c1 = y[1];
       slope[size(x,1)]*x[size(x,1)]+c2 = y[size(x,1)];
       val = if (u<x[1]) then slope[1]*u + c1 else
              if (u>x[size(x,1)]) then slope[size(x,1)]*u + c2 else
              a[iFrom,1]*u^3 + a[iFrom,2]*u^2 + a[iFrom,3]*u + a[iFrom,4];
       iFrom =   if (size(x,1)==8) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else if u<x[5] then 4 else if u<x[6] then 5 else if u<x[7] then 6 else 7) else
                 if (size(x,1)==7) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else if u<x[5] then 4 else if u<x[6] then 5 else 6) else
                 if (size(x,1)==6) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else if u<x[4] then 4 else 5) else
                 if (size(x,1)==5) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else 4) else
                 if (size(x,1)==4) then (if u<=x[2] then 1 else if u<=x[3] then 2 else 3) else
                 if (size(x,1)==3) then (if u<=x[2] then 1 else 2) else
                     1;
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}),
              Text(
                extent={{-94,-44},{100,-100}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%name"),
              Text(
                extent={{-100,100},{100,50}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="curve"),
              Line(
                points=DynamicSelect({{-100,0},{100,0}}, iconPoint),
                color={0,0,0},
                smooth=Smooth.None),
              Ellipse(
                extent=DynamicSelect({{0,0},{0,0}}, iconActualPoint),
                lineColor={0,0,0},
                fillColor={255,0,0},
                fillPattern=FillPattern.Solid)}),
       Diagram(coordinateSystem(preserveAspectRatio=false,
                         extent={{-100,-100},{100,100}}), graphics),
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Curve;

      model CurveBase
        "2D natural cubic interpolation curve defined with (x,y,slope) points"
      // extends Library.BaseModel;
       parameter Real x[:];
       parameter Real y[:];
       parameter Real slope[:];
       Real u;
       Real val;
       parameter Integer iconNP = 20;
       Real iconU[iconNP];
       Real iconPoint[iconNP,2](final unit="mm"); // = {{-70,-42},{-22,38},{32,36},{82,-74},{72,-36}};
       Real iconActualPoint[2,2](final unit="mm");
      protected
       Real a[size(x,1)-1,4];
       Real c1;
       Real c2;
       Integer iFrom;
       Integer iconFrom[20];
      equation
       // only icon drawing
       iconPoint[1,1] = -80;
       iconU[1]=min(x[j] for j in 1:size(x,1));
       iconPoint[1,2] = (-50 +
                        (100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1)))) *
                          (a[iconFrom[1],1]*(min(x[j] for j in 1:size(x,1)))^3 +
                           a[iconFrom[1],2]*(min(x[j] for j in 1:size(x,1)))^2 +
                           a[iconFrom[1],3]*(min(x[j] for j in 1:size(x,1))) +
                           a[iconFrom[1],4]
                           - min(y[j] for j in 1:size(y,1))));
       iconFrom[1] = if (size(x,1)==4) then (if (min(x[j] for j in 1:size(x,1)))<=x[2] then 1 else
                          if (min(x[j] for j in 1:size(x,1)))<=x[3] then 2 else 3) else
                     if (size(x,1)==3) then (if (min(x[j] for j in 1:size(x,1)))<=x[2] then 1 else 2) else
                     1;
       for i in 1:(iconNP-1) loop
          iconPoint[i+1,1] = i*(160/(iconNP-1)) - 80;
      //x.. min(x)+ (i*(max(x)-min(x)))/(iconNP-1);
          iconU[i+1]=(min(x[j] for j in 1:size(x,1))+(i*(max(x[j] for j in 1:size(x,1))-min(x[j] for j in 1:size(x,1))))/(iconNP-1));
          iconPoint[i+1,2] = (-50 +
                        (100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1)))) *
                          (a[iconFrom[i],1]*iconU[i+1]^3 +
                           a[iconFrom[i],2]*iconU[i+1]^2 +
                           a[iconFrom[i],3]*iconU[i+1] +
                           a[iconFrom[i],4]
                           - min(y[j] for j in 1:size(y,1))));
          iconFrom[i+1] = if (size(x,1)==8) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else if iconU[i+1]<x[5] then 4 else if iconU[i+1]<x[6] then 5 else if iconU[i+1]<x[7] then 6 else 7) else
                          if (size(x,1)==7) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else if iconU[i+1]<x[5] then 4 else if iconU[i+1]<x[6] then 5 else 6) else
                          if (size(x,1)==6) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else if iconU[i+1]<x[4] then 4 else 5) else
                          if (size(x,1)==5) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else 4) else
                          if (size(x,1)==4) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else 3) else
                          if (size(x,1)==3) then (if iconU[i+1]<=x[2] then 1 else 2) else
                             1;
       end for;
       iconActualPoint[1,1]=(u-min(x[j] for j in 1:size(x,1)))*160/(max(x[j] for j in 1:size(x,1))-min(x[j] for j in 1:size(x,1))) - 80 -2;
       iconActualPoint[1,2]=(val-min(y[j] for j in 1:size(y,1)))*100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1))) - 50 -2;
       iconActualPoint[2,1]=iconActualPoint[1,1]+4;
       iconActualPoint[2,2]=iconActualPoint[1,2]+4;
      //main equations
       for i in 1:size(x,1)-1 loop
         a[i,1]*x[i]^3 + a[i,2]*x[i]^2 + a[i,3]*x[i] + a[i,4] = y[i];
         3*a[i,1]*x[i]^2 + 2*a[i,2]*x[i] + a[i,3] = slope[i];
         a[i,1]*x[i+1]^3 + a[i,2]*x[i+1]^2 + a[i,3]*x[i+1] + a[i,4] = y[i+1];
         3*a[i,1]*x[i+1]^2 + 2*a[i,2]*x[i+1] + a[i,3] = slope[i+1];
       end for;
       slope[1]*x[1]+c1 = y[1];
       slope[size(x,1)]*x[size(x,1)]+c2 = y[size(x,1)];
       val = if (u<x[1]) then slope[1]*u + c1 else
              if (u>x[size(x,1)]) then slope[size(x,1)]*u + c2 else
              a[iFrom,1]*u^3 + a[iFrom,2]*u^2 + a[iFrom,3]*u + a[iFrom,4];
       iFrom =   if (size(x,1)==8) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else if u<x[5] then 4 else if u<x[6] then 5 else if u<x[7] then 6 else 7) else
                 if (size(x,1)==7) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else if u<x[5] then 4 else if u<x[6] then 5 else 6) else
                 if (size(x,1)==6) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else if u<x[4] then 4 else 5) else
                 if (size(x,1)==5) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else 4) else
                 if (size(x,1)==4) then (if u<=x[2] then 1 else if u<=x[3] then 2 else 3) else
                 if (size(x,1)==3) then (if u<=x[2] then 1 else 2) else
                     1;
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}),
              Text(
                extent={{-94,-44},{100,-100}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%name"),
              Line(
                points=DynamicSelect({{-100,0},{100,0}}, iconPoint),
                color={0,0,0},
                smooth=Smooth.None),
              Ellipse(
                extent=DynamicSelect({{0,0},{0,0}}, iconActualPoint),
                lineColor={0,0,0},
                fillColor={255,0,0},
                fillPattern=FillPattern.Solid)}),
       Diagram(coordinateSystem(preserveAspectRatio=false,
                         extent={{-100,-100},{100,100}}), graphics),
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end CurveBase;
    end old_version;

    package old_version2
      model Curve_
        "2D natural cubic interpolation curve defined with (x,y,slope) points"
      // extends Library.BaseModel;
       parameter Real x[:](fixed=true);
       parameter Real y[:](fixed=true);
       parameter Real slope[:](fixed=true);
       Physiolibraryold.Interfaces.RealInput_ u annotation (Placement(
              transformation(extent={{-100,-60},{-60,-20}}), iconTransformation(
                extent={{-120,-20},{-80,20}})));
       Physiolibraryold.Interfaces.RealOutput_ val annotation (Placement(
              transformation(extent={{60,-20},{100,20}}), iconTransformation(
                extent={{82,-20},{122,20}})));
       parameter Integer iconNP(fixed=true) = 20;
       parameter Real iconU[iconNP](fixed=false);
       parameter Real iconPoint[iconNP,2](final unit="mm",fixed=false); // = {{-70,-42},{-22,38},{32,36},{82,-74},{72,-36}};
       parameter Integer iconFrom[20](fixed=false);
       Real iconActualPoint[2,2](final unit="mm");
       Integer iFrom(start=1);
       parameter Real a[size(x,1)-1,4](fixed=false);
      //   parameter Real a[:,:] = QHP.Library.Curves.pavol_version.SplineCoeficients( x,y,slope);
       parameter Real c1(fixed=false);
       parameter Real c2(fixed=false);
      initial equation
        // only icon drawing
       iconPoint[1,1] = -80;
       iconU[1]=min(x[j] for j in 1:size(x,1));
       iconPoint[1,2] = (-50 +
                        (100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1)))) *
                          (a[iconFrom[1],1]*(min(x[j] for j in 1:size(x,1)))^3 +
                           a[iconFrom[1],2]*(min(x[j] for j in 1:size(x,1)))^2 +
                           a[iconFrom[1],3]*(min(x[j] for j in 1:size(x,1))) +
                           a[iconFrom[1],4]
                           - min(y[j] for j in 1:size(y,1))));
       iconFrom[1] = if (size(x,1)==4) then (if (min(x[j] for j in 1:size(x,1)))<=x[2] then 1 else
                          if (min(x[j] for j in 1:size(x,1)))<=x[3] then 2 else 3) else
                     if (size(x,1)==3) then (if (min(x[j] for j in 1:size(x,1)))<=x[2] then 1 else 2) else
                     1;
       for i in 1:(iconNP-1) loop
          iconPoint[i+1,1] = i*(160/(iconNP-1)) - 80;
      //x.. min(x)+ (i*(max(x)-min(x)))/(iconNP-1);
          iconU[i+1]=(min(x[j] for j in 1:size(x,1))+(i*(max(x[j] for j in 1:size(x,1))-min(x[j] for j in 1:size(x,1))))/(iconNP-1));
          iconPoint[i+1,2] = (-50 +
                        (100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1)))) *
                          (a[iconFrom[i],1]*iconU[i+1]^3 +
                           a[iconFrom[i],2]*iconU[i+1]^2 +
                           a[iconFrom[i],3]*iconU[i+1] +
                           a[iconFrom[i],4]
                           - min(y[j] for j in 1:size(y,1))));
          iconFrom[i+1] = if (size(x,1)==8) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else if iconU[i+1]<x[5] then 4 else if iconU[i+1]<x[6] then 5 else if iconU[i+1]<x[7] then 6 else 7) else
                          if (size(x,1)==7) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else if iconU[i+1]<x[5] then 4 else if iconU[i+1]<x[6] then 5 else 6) else
                          if (size(x,1)==6) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else if iconU[i+1]<x[5] then 4 else 5) else
                          if (size(x,1)==5) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else 4) else
                          if (size(x,1)==4) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else 3) else
                          if (size(x,1)==3) then (if iconU[i+1]<=x[2] then 1 else 2) else
                             1;
       end for;
        //main curve
        for i in 1:size(x,1)-1 loop
         a[i,1]*x[i]^3 + a[i,2]*x[i]^2 + a[i,3]*x[i] + a[i,4] = y[i];
         3*a[i,1]*x[i]^2 + 2*a[i,2]*x[i] + a[i,3] = slope[i];
         a[i,1]*x[i+1]^3 + a[i,2]*x[i+1]^2 + a[i,3]*x[i+1] + a[i,4] = y[i+1];
         3*a[i,1]*x[i+1]^2 + 2*a[i,2]*x[i+1] + a[i,3] = slope[i+1];
        end for;
        slope[1]*x[1]+c1 = y[1];
        slope[size(x,1)]*x[size(x,1)]+c2 = y[size(x,1)];
      equation
       // only icon drawing
       iconActualPoint[1,1]=(u-min(x[j] for j in 1:size(x,1)))*160/(max(x[j] for j in 1:size(x,1))-min(x[j] for j in 1:size(x,1))) - 80 -2;
       iconActualPoint[1,2]=(val-min(y[j] for j in 1:size(y,1)))*100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1))) - 50 -2;
       iconActualPoint[2,1]=iconActualPoint[1,1]+4;
       iconActualPoint[2,2]=iconActualPoint[1,2]+4;
      //main equations
       val = if (u<x[1]) then slope[1]*u + c1 else
              if (u>x[size(x,1)]) then slope[size(x,1)]*u + c2 else
              a[iFrom,1]*u^3 + a[iFrom,2]*u^2 + a[iFrom,3]*u + a[iFrom,4];
       iFrom =   if (size(x,1)==8) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else if u<x[5] then 4 else if u<x[6] then 5 else if u<x[7] then 6 else 7) else
                 if (size(x,1)==7) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else if u<x[5] then 4 else if u<x[6] then 5 else 6) else
                 if (size(x,1)==6) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else if u<x[5] then 4 else 5) else
                 if (size(x,1)==5) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else 4) else
                 if (size(x,1)==4) then (if u<=x[2] then 1 else if u<=x[3] then 2 else 3) else
                 if (size(x,1)==3) then (if u<=x[2] then 1 else 2) else
                     1;
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}),
              Text(
                extent={{-94,-44},{100,-100}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%name"),
              Text(
                extent={{-100,100},{100,50}},
                lineColor={0,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="curve"),
              Line(
                points=DynamicSelect({{-100,0},{100,0}}, iconPoint),
                color={0,0,0},
                smooth=Smooth.None),
              Ellipse(
                extent=DynamicSelect({{0,0},{0,0}}, iconActualPoint),
                lineColor={0,0,0},
                fillColor={255,0,0},
                fillPattern=FillPattern.Solid)}),
       Diagram(coordinateSystem(preserveAspectRatio=true,
                         extent={{-100,-100},{100,100}}), graphics),
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Curve_;

      model CurveBase_
        "2D natural cubic interpolation spline defined with (x,y,slope) points"
      // extends Library.BaseModel;
       parameter Real x[:];
       parameter Real y[:];
       parameter Real slope[:];
       Real u;
       Real val;
       parameter Integer iconNP = 20;
       Real iconU[iconNP];
       Real iconPoint[iconNP,2](final unit="mm"); // = {{-70,-42},{-22,38},{32,36},{82,-74},{72,-36}};
       Real iconActualPoint[2,2](final unit="mm");
      protected
       Real a[size(x,1)-1,4];
       Real c1;
       Real c2;
       Integer iFrom;
       Integer iconFrom[20];
      equation
       // only icon drawing
       iconPoint[1,1] = -80;
       iconU[1]=min(x[j] for j in 1:size(x,1));
       iconPoint[1,2] = (-50 +
                        (100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1)))) *
                          (a[iconFrom[1],1]*(min(x[j] for j in 1:size(x,1)))^3 +
                           a[iconFrom[1],2]*(min(x[j] for j in 1:size(x,1)))^2 +
                           a[iconFrom[1],3]*(min(x[j] for j in 1:size(x,1))) +
                           a[iconFrom[1],4]
                           - min(y[j] for j in 1:size(y,1))));
       iconFrom[1] = if (size(x,1)==4) then (if (min(x[j] for j in 1:size(x,1)))<=x[2] then 1 else
                          if (min(x[j] for j in 1:size(x,1)))<=x[3] then 2 else 3) else
                     if (size(x,1)==3) then (if (min(x[j] for j in 1:size(x,1)))<=x[2] then 1 else 2) else
                     1;
       for i in 1:(iconNP-1) loop
          iconPoint[i+1,1] = i*(160/(iconNP-1)) - 80;
      //x.. min(x)+ (i*(max(x)-min(x)))/(iconNP-1);
          iconU[i+1]=(min(x[j] for j in 1:size(x,1))+(i*(max(x[j] for j in 1:size(x,1))-min(x[j] for j in 1:size(x,1))))/(iconNP-1));
          iconPoint[i+1,2] = (-50 +
                        (100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1)))) *
                          (a[iconFrom[i],1]*iconU[i+1]^3 +
                           a[iconFrom[i],2]*iconU[i+1]^2 +
                           a[iconFrom[i],3]*iconU[i+1] +
                           a[iconFrom[i],4]
                           - min(y[j] for j in 1:size(y,1))));
          iconFrom[i+1] = if (size(x,1)==8) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else if iconU[i+1]<x[5] then 4 else if iconU[i+1]<x[6] then 5 else if iconU[i+1]<x[7] then 6 else 7) else
                          if (size(x,1)==7) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else if iconU[i+1]<x[5] then 4 else if iconU[i+1]<x[6] then 5 else 6) else
                          if (size(x,1)==6) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else if iconU[i+1]<x[5] then 4 else 5) else
                          if (size(x,1)==5) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else 4) else
                          if (size(x,1)==4) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else 3) else
                          if (size(x,1)==3) then (if iconU[i+1]<=x[2] then 1 else 2) else
                             1;
       end for;
       iconActualPoint[1,1]=(u-min(x[j] for j in 1:size(x,1)))*160/(max(x[j] for j in 1:size(x,1))-min(x[j] for j in 1:size(x,1))) - 80 -2;
       iconActualPoint[1,2]=(val-min(y[j] for j in 1:size(y,1)))*100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1))) - 50 -2;
       iconActualPoint[2,1]=iconActualPoint[1,1]+4;
       iconActualPoint[2,2]=iconActualPoint[1,2]+4;
      //main equations
       for i in 1:size(x,1)-1 loop
         a[i,1]*x[i]^3 + a[i,2]*x[i]^2 + a[i,3]*x[i] + a[i,4] = y[i];
         3*a[i,1]*x[i]^2 + 2*a[i,2]*x[i] + a[i,3] = slope[i];
         a[i,1]*x[i+1]^3 + a[i,2]*x[i+1]^2 + a[i,3]*x[i+1] + a[i,4] = y[i+1];
         3*a[i,1]*x[i+1]^2 + 2*a[i,2]*x[i+1] + a[i,3] = slope[i+1];
       end for;
       slope[1]*x[1]+c1 = y[1];
       slope[size(x,1)]*x[size(x,1)]+c2 = y[size(x,1)];
       val = if (u<x[1]) then slope[1]*u + c1 else
              if (u>x[size(x,1)]) then slope[size(x,1)]*u + c2 else
              a[iFrom,1]*u^3 + a[iFrom,2]*u^2 + a[iFrom,3]*u + a[iFrom,4];
       iFrom =   if (size(x,1)==8) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else if u<x[5] then 4 else if u<x[6] then 5 else if u<x[7] then 6 else 7) else
                 if (size(x,1)==7) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else if u<x[5] then 4 else if u<x[6] then 5 else 6) else
                 if (size(x,1)==6) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else if u<x[5] then 4 else 5) else
                 if (size(x,1)==5) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else 4) else
                 if (size(x,1)==4) then (if u<=x[2] then 1 else if u<=x[3] then 2 else 3) else
                 if (size(x,1)==3) then (if u<=x[2] then 1 else 2) else
                     1;
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}),
              Text(
                extent={{-94,-44},{100,-100}},
                lineColor={0,0,255},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid,
                textString="%name"),
              Line(
                points=DynamicSelect({{-100,0},{100,0}}, iconPoint),
                color={0,0,0},
                smooth=Smooth.None),
              Ellipse(
                extent=DynamicSelect({{0,0},{0,0}}, iconActualPoint),
                lineColor={0,0,0},
                fillColor={255,0,0},
                fillPattern=FillPattern.Solid)}),
       Diagram(coordinateSystem(preserveAspectRatio=false,
                         extent={{-100,-100},{100,100}}), graphics),
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end CurveBase_;

      model CubicInversion_
       parameter Real x[2](fixed=true);
       parameter Real y[2](fixed=true);
       parameter Real slope[2](fixed=true);
       Interfaces.RealInput_ u
                    annotation (Placement(transformation(extent={{-90,-50},{-50,-10}}),
              iconTransformation(extent={{-120,-20},{-80,20}})));
       Interfaces.RealOutput_ val
                       annotation (Placement(transformation(extent={{70,-10},{110,30}}),
              iconTransformation(extent={{80,-20},{120,20}})));
        parameter Real a[1,4](fixed=false);
        parameter Integer solutionNumber[1];
        Real solution[1,3];
      initial equation
        //calculate 4 cubic coeficient
        for i in 1:size(x,1)-1 loop
         a[i,1]*x[i]^3 + a[i,2]*x[i]^2 + a[i,3]*x[i] + a[i,4] = y[i];
         3*a[i,1]*x[i]^2 + 2*a[i,2]*x[i] + a[i,3] = slope[i];
         a[i,1]*x[i+1]^3 + a[i,2]*x[i+1]^2 + a[i,3]*x[i+1] + a[i,4] = y[i+1];
         3*a[i,1]*x[i+1]^2 + 2*a[i,2]*x[i+1] + a[i,3] = slope[i+1];
      /*
   solution[i,1] = - a[i,2]/(3*a[i,1])
             - (1/(3*a[i,1]))*((1/2)*(2*a[i,2]^3-9*a[i,1]*a[i,2]*a[i,3]+27*a[i,1]^2*(a[i,4]-val)+((2*a[i,2]^3-9*a[i,1]*a[i,2]*a[i,3]+27*a[i,1]^2*(a[i,4]-val))^2-4*(a[i,2]^2-3*a[i,1]*a[i,3])^3)^(1/2)))^(1/3)
             - (1/(3*a[i,1]))*((1/2)*(2*a[i,2]^3-9*a[i,1]*a[i,2]*a[i,3]+27*a[i,1]^2*(a[i,4]-val)-((2*a[i,2]^3-9*a[i,1]*a[i,2]*a[i,3]+27*a[i,1]^2*(a[i,4]-val))^2-4*(a[i,2]^2-3*a[i,1]*a[i,3])^3)^(1/2)))^(1/3);
   solution[i,2] = - a[i,2]/(3*a[i,1])
             + ((1+Complex.I*3^(1/2))/(6*a[i,1]))*((1/2)*(2*a[i,2]^3-9*a[i,1]*a[i,2]*a[i,3]+27*a[i,1]^2*(a[i,4]-val)+((2*a[i,2]^3-9*a[i,1]*a[i,2]*a[i,3]+27*a[i,1]^2*(a[i,4]-val))^2-4*(a[i,2]^2-3*a[i,1]*a[i,3])^3)^(1/2)))^(1/3)
             + ((1-Complex.I*3^(1/2))/(6*a[i,1]))*((1/2)*(2*a[i,2]^3-9*a[i,1]*a[i,2]*a[i,3]+27*a[i,1]^2*(a[i,4]-val)-((2*a[i,2]^3-9*a[i,1]*a[i,2]*a[i,3]+27*a[i,1]^2*(a[i,4]-val))^2-4*(a[i,2]^2-3*a[i,1]*a[i,3])^3)^(1/2)))^(1/3);
   solution[i,3] = - a[i,2]/(3*a[i,1])
             + ((1-Complex.I*3^(1/2))/(6*a[i,1]))*((1/2)*(2*a[i,2]^3-9*a[i,1]*a[i,2]*a[i,3]+27*a[i,1]^2*(a[i,4]-val)+((2*a[i,2]^3-9*a[i,1]*a[i,2]*a[i,3]+27*a[i,1]^2*(a[i,4]-val))^2-4*(a[i,2]^2-3*a[i,1]*a[i,3])^3)^(1/2)))^(1/3)
             + ((1+Complex.I*3^(1/2))/(6*a[i,1]))*((1/2)*(2*a[i,2]^3-9*a[i,1]*a[i,2]*a[i,3]+27*a[i,1]^2*(a[i,4]-val)-((2*a[i,2]^3-9*a[i,1]*a[i,2]*a[i,3]+27*a[i,1]^2*(a[i,4]-val))^2-4*(a[i,2]^2-3*a[i,1]*a[i,3])^3)^(1/2)))^(1/3);
*/
      // z Wolfram Mathematica:
      //     curve[x_] = a[i, 1]*x^3 + a[i, 2]*x^2 + a[i, 3]*x + a[i, 4];
      //     ComplexExpand[Solve[curve[x] == val, x]]
        end for;
        annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),
                               graphics));
      end CubicInversion_;

      model CurveWithDerivation_
        "\"Added output, that represent deriavation of value from curve.\""
        extends Physiolibraryold.Curves.Curve;
      Interfaces.RealOutput_ derval
                       annotation (Placement(transformation(extent={{60,-20},{100,20}}),
              iconTransformation(extent={{82,-60},{122,-20}})));
      equation
         derval = if (u<x[1]) then slope[1] else
              if (u>x[size(x,1)]) then slope[size(x,1)] else
              3*a[iFrom,1]*u^2 + 2*a[iFrom,2]*u + a[iFrom,3];
      end CurveWithDerivation_;
    end old_version2;

    package pavol_version
     function Spline
          input Real[:] x; //souradnice x souradnice uzlovych bodu
          input Real[:,4] a; //parametry kubiky
          input Real xVal; //vstupni hodnota
          output Real yVal;
     //     output Real outExtra;
      protected
        Integer index;
        Integer n;
     algorithm
            // Najdi interval, ve kterem se nachazi xVal
            if (xVal <= x[1]) then //kdyz je hodnota xVal pred prvnim uzlovym bodem
              yVal := xVal * a[1,3] + a[1,4]; //pocitam primku
            else
              n := size(x,1); //pocet uzlovych bodu
              if (xVal>=x[n]) then //kdyz je hodnota xVal za poslednim uzlovym bodem
                 yVal := xVal * a[n+1,3] + a[n+1,4];  //pocitam primku
            else
              index := 2;
              while  xVal > x[index] and index < n loop
                index:=index+1;
              end while;
              yVal := ((a[index,1]*xVal + a[index,2])*xVal + a[index,3])*xVal + a[index,4];
              /*
         x1:=x[index-1];
         x2:=x[index];
         y1:=y[index-1];
         y2:=y[index];
         slope1:=slope[index-1];
         slope2:=slope[index];

         a1:=-(-x2*slope2 - x2*slope1 + slope2*x1 + slope1*x1 + 2*y2 - 2*y1)/(x2 - x1)^3;
         a2:=(-x2^2*slope2-2*x2^2*slope1-3*x2*y1+x2*slope1*x1+3*x2*y2-x2*slope2*x1-3*y1*x1+slope1*x1^2+3*y2*x1+2*slope2*x1^2)/(x2-x1)^3;
         a3:=-(-slope1*x2^3-2*x2^2*slope2*x1-x2^2*slope1*x1+x2*slope2*x1^2+2*x2*slope1*x1^2+6*x2*x1*y2-6*x2*x1*y1+slope2*x1^3)/(x2-x1)^3;
         a4:=(-slope1*x2^3*x1+y1*x2^3-slope2*x1^2*x2^2+slope1*x1^2*x2^2-3*y1*x2^2*x1+3*y2*x1^2*x2+slope2*x1^3*x2-y2*x1^3)/(x2-x1)^3;

         yVal :=a1*(xVal)^3 + a2*(xVal)^2 + a3*(xVal) + a4;
         */
              end if;
           end if;
       //    outExtra := xVal + yVal;
            annotation (Documentation(revisions="<html>
<p>author: Ondrej Vacek</p>
</html>"));
     end Spline;

     function SplineCoeficients
          input Real[:] x;
          input Real[:] y;
          input Real[:] slope;
          output Real[size(x,1)+1,4] a;//poset hodnot ctyrech parametru kubiky je o jeden vic nez pocet bodu
      protected
        Integer n;
        Integer i;
        //Real a1; //parametry kubiky
        //Real a2; //parametry kubiky
        //Real a3; //parametry kubiky
        //Real a4; //parametry kubiky
        Real x1;
        Real x2;
        Real y1;
        Real y2;
        Real slope1;
        Real slope2;
     algorithm
            // Najdi interval, ve kterem se nachazi xVal
     /*
  if (xVal<= x[1]) then

         yVal :=(xVal)*slope[1] + y[1]- x[1]*slope[1];
         
         yVal :=0 *(xVal)^3 + 0*(xVal)^2 + slope[1]*(xVal) + (y[1]- x[1]*slope[1]);
         
         yVal :=a1*(xVal)^3 + a2*(xVal)^2 + a3*(xVal) + a4;
 
       elseif (xVal>=x[size(x,1)]) then

        yVal :=(xVal)*slope[size(slope,1)] + y[size(y,1)]-(x[size(x,1)]*slope[size(slope,1)]);
        
        yVal :=0 *(xVal)^3 + 0 *(xVal)^2 + slope[size(slope,1)]*(xVal) + (y[size(y,1)]-(x[size(x,1)]*slope[size(slope,1)]));
        
        yVal :=a1*(xVal)^3 + a2*(xVal)^2 + a3*(xVal) + a4;
        yVal := ((a1*xVal + a2)*xVal + a3)*xVal + a4;

else
 
 yVal :=a1*(xVal)^3 + a2*(xVal)^2 + a3*(xVal) + a4;

  */
        n := size(x,1);//pocet uzlovych bodu
        for i in 2:n loop //cyklus od 2 do n
              x1:=x[i-1]; //predchozi bod
              x2:=x[i];  //soucasny bod
              y1:=y[i-1]; //predchozi bod
              y2:=y[i]; //soucasny bod
              slope1:=slope[i-1]; //predchozi bod
              slope2:=slope[i]; //soucasny bod
              //vypocty parametru kubiky (od 2 do n) podle souradnic a smernic dvou bodu : y=a[i,4]+a[i,3]*x+a[i,2]*x^2+a[i,1]*x^3
              a[i,1]:=-(-x2*slope2 - x2*slope1 + x1*slope2 + x1*slope1 + 2*y2 - 2*y1)/(x2 - x1)^3;
              a[i,2]:=(-x2^2*slope2-2*x2^2*slope1-3*x2*y1+x2*slope1*x1+3*x2*y2-x2*slope2*x1-3*y1*x1+slope1*x1^2+3*y2*x1+2*slope2*x1^2)/(x2-x1)^3;
              a[i,3]:=-(-slope1*x2^3-2*x2^2*slope2*x1-x2^2*slope1*x1+x2*slope2*x1^2+2*x2*slope1*x1^2+6*x2*x1*y2-6*x2*x1*y1+slope2*x1^3)/(x2-x1)^3;
              a[i,4]:=(-slope1*x2^3*x1+y1*x2^3-slope2*x1^2*x2^2+slope1*x1^2*x2^2-3*y1*x2^2*x1+3*y2*x1^2*x2+slope2*x1^3*x2-y2*x1^3)/(x2-x1)^3;
        end for;
        a[1,  :] := { 0, 0, slope[1], y[1] - x[1]*slope[1]}; //vypocet prvni sady parametru kubiky  - primky
        a[n+1,:] := { 0, 0, slope[n], y[n] - x[n]*slope[n]}; //vypocet posledni sady parametru kubiky - primky
            annotation (Documentation(revisions="<html>
<p>author: Ondrej Vacek</p>
</html>"));
     end SplineCoeficients;

          model Curve
        "2D natural cubic interpolation spline defined with (x,y,slope) points"
           // import QHP = HumMod;
               parameter Real x[:];
               parameter Real y[:];
               parameter Real slope[:];
               parameter Integer iFrom=0;
               Physiolibraryold.Interfaces.RealInput_ u annotation (Placement(
              transformation(extent={{-100,-60},{-60,-20}}), iconTransformation(
                extent={{-120,-20},{-80,20}})));
               Physiolibraryold.Interfaces.RealOutput_ val annotation (
            Placement(transformation(extent={{60,-20},{100,20}}),
              iconTransformation(extent={{82,-20},{122,20}})));
      protected
              parameter Real a[:,:] = Physiolibraryold.Curves.pavol_version.SplineCoeficients(
                                                        x,y,slope);
          equation
        val = Physiolibraryold.Curves.pavol_version.Spline(
                    x,
                    a,
                    u);
             annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),      graphics));
          end Curve;

          model CurveDebug
        "2D natural cubic interpolation spline defined with (x,y,slope) points"
           // import QHP = HumMod;
               parameter Real x[:];
               parameter Real y[:];
               parameter Real slope[:];
               parameter Integer iFrom=0;
               Physiolibraryold.Interfaces.RealInput_ u annotation (Placement(
              transformation(extent={{-100,-60},{-60,-20}}), iconTransformation(
                extent={{-120,-20},{-80,20}})));
               Physiolibraryold.Interfaces.RealOutput_ val annotation (
            Placement(transformation(extent={{60,-20},{100,20}}),
              iconTransformation(extent={{82,-20},{122,20}})));
      protected
              parameter Real a[:,:] = Physiolibraryold.Curves.pavol_version.SplineCoeficientsDebug(
                                                        x,y,slope);
      public
               Physiolibraryold.Interfaces.RealOutput_ a1_0 annotation (
            Placement(transformation(extent={{60,-20},{100,20}}),
              iconTransformation(extent={{88,80},{102,94}})));
               Physiolibraryold.Interfaces.RealOutput_ a1_1 annotation (
            Placement(transformation(extent={{60,-20},{100,20}}),
              iconTransformation(extent={{88,66},{102,80}})));
               Physiolibraryold.Interfaces.RealOutput_ a1_2 annotation (
            Placement(transformation(extent={{60,-20},{100,20}}),
              iconTransformation(extent={{88,52},{102,66}})));
               Physiolibraryold.Interfaces.RealOutput_ a1_3 annotation (
            Placement(transformation(extent={{60,-20},{100,20}}),
              iconTransformation(extent={{88,38},{102,52}})));
          equation
        val = Physiolibraryold.Curves.pavol_version.Spline(
                    x,
                    a,
                    u);
          a1_0=a[2,1];
          a1_1=a[2,2];
          a1_2=a[2,3];
          a1_3=a[2,4];
             annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}),      graphics), Icon(graphics));
          end CurveDebug;

     function SplineCoeficientsDebug
          input Real[:] x;
          input Real[:] y;
          input Real[:] slope;
          output Real[size(x,1)+1,4] a;//poset hodnot ctyrech parametru kubiky je o jeden vic nez pocet bodu
      protected
        Integer n;
        Integer i;
        //Real a1; //parametry kubiky
        //Real a2; //parametry kubiky
        //Real a3; //parametry kubiky
        //Real a4; //parametry kubiky
        Real x1;
        Real x2;
        Real y1;
        Real y2;
        Real slope1;
        Real slope2;
     algorithm
            // Najdi interval, ve kterem se nachazi xVal
     /*
  if (xVal<= x[1]) then

         yVal :=(xVal)*slope[1] + y[1]- x[1]*slope[1];
         
         yVal :=0 *(xVal)^3 + 0*(xVal)^2 + slope[1]*(xVal) + (y[1]- x[1]*slope[1]);
         
         yVal :=a1*(xVal)^3 + a2*(xVal)^2 + a3*(xVal) + a4;
 
       elseif (xVal>=x[size(x,1)]) then

        yVal :=(xVal)*slope[size(slope,1)] + y[size(y,1)]-(x[size(x,1)]*slope[size(slope,1)]);
        
        yVal :=0 *(xVal)^3 + 0 *(xVal)^2 + slope[size(slope,1)]*(xVal) + (y[size(y,1)]-(x[size(x,1)]*slope[size(slope,1)]));
        
        yVal :=a1*(xVal)^3 + a2*(xVal)^2 + a3*(xVal) + a4;
        yVal := ((a1*xVal + a2)*xVal + a3)*xVal + a4;

else
 
 yVal :=a1*(xVal)^3 + a2*(xVal)^2 + a3*(xVal) + a4;

  */
        n := size(x,1);//pocet uzlovych bodu
        for i in 2:n loop //cyklus od 2 do n
              x1:=x[i-1]; //predchozi bod
              x2:=x[i];  //soucasny bod
              y1:=y[i-1]; //predchozi bod
              y2:=y[i]; //soucasny bod
              slope1:=slope[i-1]; //predchozi bod
              slope2:=slope[i]; //soucasny bod
              //vypocty parametru kubiky (od 2 do n) podle souradnic a smernic dvou bodu : y=a[i,4]+a[i,3]*x+a[i,2]*x^2+a[i,1]*x^3
              a[i,1]:=-(-x2*slope2 - x2*slope1 + x1*slope2 + x1*slope1 + 2*y2 - 2*y1)/(x2 - x1)^3;
              a[i,2]:=(-x2^2*slope2-2*x2^2*slope1-3*x2*y1+x2*slope1*x1+3*x2*y2-x2*slope2*x1-3*y1*x1+slope1*x1^2+3*y2*x1+2*slope2*x1^2)/(x2-x1)^3;
              a[i,3]:=-(-slope1*x2^3-2*x2^2*slope2*x1-x2^2*slope1*x1+x2*slope2*x1^2+2*x2*slope1*x1^2+6*x2*x1*y2-6*x2*x1*y1+slope2*x1^3)/(x2-x1)^3;
              a[i,4]:=(-slope1*x2^3*x1+y1*x2^3-slope2*x1^2*x2^2+slope1*x1^2*x2^2-3*y1*x2^2*x1+3*y2*x1^2*x2+slope2*x1^3*x2-y2*x1^3)/(x2-x1)^3;
        end for;
        a[1,  :] := { 0, 0, slope[1], y[1] - x[1]*slope[1]}; //vypocet prvni sady parametru kubiky  - primky
        a[n+1,:] := { 0, 0, slope[n], y[n] - x[n]*slope[n]}; //vypocet posledni sady parametru kubiky - primky
            annotation (Documentation(revisions="<html>
<p>author: Ondrej Vacek</p>
</html>"));
     end SplineCoeficientsDebug;
    end pavol_version;

    package Splines "for Guyton 1972"
    function SplineSlope
        input Real[1, :] x;
        input Real[1, :] y;
        input Real[1,:] slope;
        input Real xVal;
        output Real yVal;
      protected
      Integer index;
      Real a1;
      Real a2;
      Real a3;
      Real a4;
      Real x1;
      Real x2;
      Real y1;
      Real y2;
      Real slope1;
      Real slope2;
    algorithm
          // Najdi interval, ve kterem se nachazi xVal
          if (xVal<= x[1,1]) then
            yVal :=(xVal)*slope[1,1] + y[1,1]- x[1,1]*slope[1,1];
          elseif (xVal>=x[1,end]) then
           yVal :=(xVal)*slope[1,end] + y[1,end]-(x[1,end]*slope[1,end]);
          else
            index :=1;
            while ( xVal>x[1,index] and index<=size(x,2)) loop
              index:=index+1;
            end while;
            x1:=x[1,index-1];
            x2:=x[1,index];
            y1:=y[1,index-1];
            y2:=y[1,index];
            slope1:=slope[1,index-1];
            slope2:=slope[1,index];
            a1:=-(-x2*slope2 - x2*slope1 + slope2*x1 + slope1*x1 + 2*y2 - 2*y1)/(x2 - x1)^3;
            a2:=(-x2^2*slope2-2*x2^2*slope1-3*x2*y1+x2*slope1*x1+3*x2*y2-x2*slope2*x1-3*y1*x1+slope1*x1^2+3*y2*x1+2*slope2*x1^2)/(x2-x1)^3;
            a3:=-(-slope1*x2^3-2*x2^2*slope2*x1-x2^2*slope1*x1+x2*slope2*x1^2+2*x2*slope1*x1^2+6*x2*x1*y2-6*x2*x1*y1+slope2*x1^3)/(x2-x1)^3;
            a4:=(-slope1*x2^3*x1+y1*x2^3-slope2*x1^2*x2^2+slope1*x1^2*x2^2-3*y1*x2^2*x1+3*y2*x1^2*x2+slope2*x1^3*x2-y2*x1^3)/(x2-x1)^3;
            yVal :=a1*(xVal)^3 + a2*(xVal)^2 + a3*(xVal) + a4;
          end if;
    end SplineSlope;

      function Spline
        input Real u;
        input Real[1, :] x = [0,1];
        input Real[1, :] yValues = [0,1];
        output Real y;
      protected
        Real[1, size(x,2)] slope;
        Integer index;
      algorithm
          slope[1,1] :=(yValues[1, 2] - yValues[1, 1])/(x[1, 2] - x[1, 1]);
          index :=2;
          while (index<size(x,2)) loop
              slope[1,index] :=(yValues[1, index
             + 1] - yValues[1, index - 1])/(x[1, index + 1] - x[1, index - 1]);
              index:=index+1;
          end while;
          slope[1,size(x,2)] :=(yValues[1,size(x, 2)] - yValues[1, size(x, 2) - 1])/ (x[1, size(x, 2)] - x[1, size(x, 2) - 1]);
        y := SplineSlope(
          x,
          yValues,
          slope,
          u);
      end Spline;

      block Curve
        extends Modelica.Blocks.Interfaces.SISO;
        parameter Real[1, :] x = [0,1];
        parameter Real[1, :] yValues = [0,1];
      algorithm
        y := Spline(u, x, yValues);
        annotation (Icon(graphics={Text(
                extent={{-94,12},{90,-10}},
                lineColor={0,0,255},
                textString="Splines Guyton 1972")}));
      end Curve;
    end Splines;

    package test
      model TCubicCurve
      parameter Real data[:,3]={{ -14.0,   0.0,  0.0}, {  -4.0,   1.0,  0.1}, {   2.0,   8.0,  4.0}, {   6.0,  25.0,  0.0}};
        CubicCurve ccI(
          INVERSION=true,
          x=data[:, 1],
          y=data[:, 2],
          slope=data[:, 3]);
        Real cerr;
        Physiolibraryold.Curves.Curve cc(
          x=data[:, 1],
          y=data[:, 2],
          slope=data[:, 3])
          annotation (Placement(transformation(extent={{-72,40},{-52,60}})));
      equation
        ccI.val = time;
        cc.u = ccI.u;
        cerr = cc.val-time;
        annotation (experiment(StartTime=0.0001, StopTime=24.9999),
            experimentSetupOutput);
      end TCubicCurve;

      model T2
        Factors.SplineValue2 MassEffect(INVERSE=true, data={{100,1.0,-0.03},{
              200,0.0,0.0}})
          annotation (Placement(transformation(extent={{-12,-24},{8,-4}})));
        Modelica.Blocks.Sources.Clock clock
          annotation (Placement(transformation(extent={{-66,0},{-46,20}})));
        Modelica.Blocks.Sources.Constant const(k=1)
          annotation (Placement(transformation(extent={{-38,28},{-18,48}})));
        Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints
          annotation (Placement(transformation(extent={{-24,-30},{16,-6}})));
      equation
        connect(const.y, MassEffect.yBase) annotation (Line(
            points={{-17,38},{-2,38},{-2,-12}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(MassEffect.y, inverseBlockConstraints.u2) annotation (Line(
            points={{-2,-16},{-12,-16},{-12,-18},{-20,-18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(clock.y, inverseBlockConstraints.u1) annotation (Line(
            points={{-45,10},{-38,10},{-38,-18},{-26,-18}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(inverseBlockConstraints.y2, MassEffect.u) annotation (Line(
            points={{13,-18},{8,-18},{8,-22},{-14,-22},{-14,-14},{-11.8,-14}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}),       graphics));
      end T2;
    end test;

    model Curve_OM
      extends pavol_version.Curve;
      parameter Boolean INVERSION=false "only for compatibility";
    end Curve_OM;

    model Curve_oldest
      "2D natural cubic interpolation curve defined with (x,y,slope) points"
    // extends Library.BaseModel;
     parameter Boolean INVERSION=false "only for compatibility";
     parameter Real x[:](each fixed=true);
     parameter Real y[:](each fixed=true);
     parameter Real slope[:](each fixed=true);
     Physiolibraryold.Interfaces.RealInput_ u annotation (Placement(
            transformation(extent={{-100,-60},{-60,-20}}), iconTransformation(
              extent={{-120,-20},{-80,20}})));
     Physiolibraryold.Interfaces.RealOutput_ val annotation (Placement(
            transformation(extent={{60,-20},{100,20}}), iconTransformation(
              extent={{82,-20},{122,20}})));
     parameter Integer iconNP(fixed=true) = 20;
     parameter Real iconU[iconNP](each fixed=false);
     parameter Real iconPoint[iconNP,2](each final unit="mm",each fixed=false); // = {{-70,-42},{-22,38},{32,36},{82,-74},{72,-36}};
     parameter Integer iconFrom[20](each fixed=false);
     Real iconActualPoint[2,2](each final unit="mm");
     Integer iFrom(start=1);
     parameter Real a[size(x,1)-1,4](each fixed=false);
    //   parameter Real a[:,:] = QHP.Library.Curves.pavol_version.SplineCoeficients( x,y,slope);
     parameter Real c1(fixed=false);
     parameter Real c2(fixed=false);
    initial equation
      // only icon drawing
     iconPoint[1,1] = -80;
     iconU[1]=min(x[j] for j in 1:size(x,1));
     iconPoint[1,2] = (-50 +
                      (100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1)))) *
                        (a[iconFrom[1],1]*(min(x[j] for j in 1:size(x,1)))^3 +
                         a[iconFrom[1],2]*(min(x[j] for j in 1:size(x,1)))^2 +
                         a[iconFrom[1],3]*(min(x[j] for j in 1:size(x,1))) +
                         a[iconFrom[1],4]
                         - min(y[j] for j in 1:size(y,1))));
     iconFrom[1] = if (size(x,1)==4) then (if (min(x[j] for j in 1:size(x,1)))<=x[2] then 1 else
                        if (min(x[j] for j in 1:size(x,1)))<=x[3] then 2 else 3) else
                   if (size(x,1)==3) then (if (min(x[j] for j in 1:size(x,1)))<=x[2] then 1 else 2) else
                   1;
     for i in 1:(iconNP-1) loop
        iconPoint[i+1,1] = i*(160/(iconNP-1)) - 80;
    //x.. min(x)+ (i*(max(x)-min(x)))/(iconNP-1);
        iconU[i+1]=(min(x[j] for j in 1:size(x,1))+(i*(max(x[j] for j in 1:size(x,1))-min(x[j] for j in 1:size(x,1))))/(iconNP-1));
        iconPoint[i+1,2] = (-50 +
                      (100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1)))) *
                        (a[iconFrom[i],1]*iconU[i+1]^3 +
                         a[iconFrom[i],2]*iconU[i+1]^2 +
                         a[iconFrom[i],3]*iconU[i+1] +
                         a[iconFrom[i],4]
                         - min(y[j] for j in 1:size(y,1))));
        iconFrom[i+1] = if (size(x,1)==8) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else if iconU[i+1]<x[5] then 4 else if iconU[i+1]<x[6] then 5 else if iconU[i+1]<x[7] then 6 else 7) else
                        if (size(x,1)==7) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else if iconU[i+1]<x[5] then 4 else if iconU[i+1]<x[6] then 5 else 6) else
                        if (size(x,1)==6) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else if iconU[i+1]<x[5] then 4 else 5) else
                        if (size(x,1)==5) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else if iconU[i+1]<x[4] then 3 else 4) else
                        if (size(x,1)==4) then (if iconU[i+1]<=x[2] then 1 else if iconU[i+1]<=x[3] then 2 else 3) else
                        if (size(x,1)==3) then (if iconU[i+1]<=x[2] then 1 else 2) else
                           1;
     end for;
      //main curve
      for i in 1:size(x,1)-1 loop
       a[i,1]*x[i]^3 + a[i,2]*x[i]^2 + a[i,3]*x[i] + a[i,4] = y[i];
       3*a[i,1]*x[i]^2 + 2*a[i,2]*x[i] + a[i,3] = slope[i];
       a[i,1]*x[i+1]^3 + a[i,2]*x[i+1]^2 + a[i,3]*x[i+1] + a[i,4] = y[i+1];
       3*a[i,1]*x[i+1]^2 + 2*a[i,2]*x[i+1] + a[i,3] = slope[i+1];
      end for;
      slope[1]*x[1]+c1 = y[1];
      slope[size(x,1)]*x[size(x,1)]+c2 = y[size(x,1)];
    equation
     // only icon drawing
     iconActualPoint[1,1]=(u-min(x[j] for j in 1:size(x,1)))*160/(max(x[j] for j in 1:size(x,1))-min(x[j] for j in 1:size(x,1))) - 80 -2;
     iconActualPoint[1,2]=(val-min(y[j] for j in 1:size(y,1)))*100/(max(y[j] for j in 1:size(y,1))-min(y[j] for j in 1:size(y,1))) - 50 -2;
     iconActualPoint[2,1]=iconActualPoint[1,1]+4;
     iconActualPoint[2,2]=iconActualPoint[1,2]+4;
    //main equations
     val = if (u<x[1]) then slope[1]*u + c1 else
            if (u>x[size(x,1)]) then slope[size(x,1)]*u + c2 else
            u*(u*(u*a[iFrom,1] + a[iFrom,2]) + a[iFrom,3]) + a[iFrom,4];
     iFrom =   if (size(x,1)==8) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else if u<x[5] then 4 else if u<x[6] then 5 else if u<x[7] then 6 else 7) else
               if (size(x,1)==7) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else if u<x[5] then 4 else if u<x[6] then 5 else 6) else
               if (size(x,1)==6) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else if u<x[5] then 4 else 5) else
               if (size(x,1)==5) then (if u<=x[2] then 1 else if u<=x[3] then 2 else if u<x[4] then 3 else 4) else
               if (size(x,1)==4) then (if u<=x[2] then 1 else if u<=x[3] then 2 else 3) else
               if (size(x,1)==3) then (if u<=x[2] then 1 else 2) else
                   1;
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}),
            Text(
              extent={{-94,-44},{100,-100}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%name"),
            Text(
              extent={{-100,100},{100,50}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="curve"),
            Line(
              points=DynamicSelect({{-100,0},{100,0}}, iconPoint),
              color={0,0,0},
              smooth=Smooth.None),
            Ellipse(
              extent=DynamicSelect({{0,0},{0,0}}, iconActualPoint),
              lineColor={0,0,0},
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid)}),
     Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Curve_oldest;
  end Curves;

  package Factors "Multiplication Effect Types"
    model SimpleMultiply "multiplication"
     extends Physiolibraryold.Interfaces.BaseFactorIcon;
     Physiolibraryold.Interfaces.RealInput_ u annotation (Placement(
            transformation(extent={{-102,-24},{-62,16}}), iconTransformation(
              extent={{-108,-10},{-88,10}})));
     Modelica.Blocks.Math.Product product  annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-32})));
      Real effect;
    equation
      effect = u;
      connect(yBase, product.u1) annotation (Line(
          points={{6,80},{6,30},{6,-20},{6,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product.y, y) annotation (Line(
          points={{-2.02067e-015,-43},{-2.02067e-015,-55.5},{0,-55.5},{0,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(u, product.u2) annotation (Line(
          points={{-82,-4},{-6,-4},{-6,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",
        info="<html>
<p><h4>y = yBase * u</h4></p>
</html>"),
        Icon(graphics={
            Ellipse(
              extent={{-102,28},{-82,8}},
              lineColor={255,255,170},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid), Text(
              extent={{-114,32},{-70,-14}},
              lineColor={0,0,0},
              textString="*")}));
    end SimpleMultiply;

    model SimpleDivision "division"
     extends Physiolibraryold.Interfaces.BaseFactorIcon;
     Physiolibraryold.Interfaces.RealInput_ u annotation (Placement(
            transformation(extent={{-102,-24},{-62,16}}), iconTransformation(
              extent={{-108,-10},{-88,10}})));
      Real effect;
      Modelica.Blocks.Math.Division division annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-26})));
    equation
      effect = u;
      connect(u, division.u2) annotation (Line(
          points={{-82,-4},{-6,-4},{-6,-14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(yBase, division.u1) annotation (Line(
          points={{6,80},{6,33},{6,-14},{6,-14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(division.y, y) annotation (Line(
          points={{-2.02067e-015,-37},{-2.02067e-015,-49.5},{0,-49.5},{0,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",
        info="<html>
<p><h4>y = yBase * u</h4></p>
</html>"),
        Icon(graphics={
            Ellipse(
              extent={{-103,28},{-83,8}},
              lineColor={255,255,170},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-94,23},{-92,25}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
            Line(
              points={{-98,18},{-88,18}},
              color={0,0,0},
              smooth=Smooth.None,
              thickness=0.5),
        Ellipse(
          extent={{-94,12},{-92,14}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}));
    end SimpleDivision;

    model ZeroIfFalse
      "return zero if condition is false, else return yBase value"
     extends Physiolibraryold.Interfaces.BaseFactorIcon;
     Modelica.Blocks.Interfaces.BooleanInput condition
                  annotation (Placement(transformation(extent={{-102,-24},{-62,16}}),
            iconTransformation(extent={{-108,-10},{-88,10}})));
      Real effect;
    equation
      effect = if condition then 1 else 0;
      y = if condition then yBase else 0;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ZeroIfFalse;

    model CurveValue
      "calculate multiplication factor from function defined by curve"
     extends Physiolibraryold.Interfaces.BaseFactorIcon4;
     Physiolibraryold.Interfaces.RealInput_ u annotation (Placement(
            transformation(extent={{-102,-24},{-62,16}}), iconTransformation(
              extent={{-108,-10},{-88,10}})));
     parameter Real[:,3] data;
      Physiolibraryold.Curves.Curve curve(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3])
        annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
      Modelica.Blocks.Math.Product product annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-32})));
      Real effect;
    equation
      effect = curve.val;
      connect(curve.u, u) annotation (Line(
          points={{-46,0},{-64,0},{-64,-4},{-82,-4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(yBase, product.u1) annotation (Line(
          points={{6,80},{6,30},{6,-20},{6,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(curve.val, product.u2) annotation (Line(
          points={{-25.8,0},{-6,0},{-6,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product.y, y) annotation (Line(
          points={{-2.02067e-015,-43},{-2.02067e-015,-55.5},{0,-55.5},{0,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end CurveValue;

    model DelayedToSpline
      "adapt the signal, from which is by curve multiplication coeficient calculated"
     extends Physiolibraryold.Interfaces.BaseFactorIcon5;
     Physiolibraryold.Interfaces.RealInput_ u annotation (Placement(
            transformation(extent={{-118,44},{-78,84}}), iconTransformation(
              extent={{-108,-10},{-88,10}})));
     parameter Real Tau = 40;
     parameter Real initialValue = 1; //40;
     parameter Real[:,3] data;
     parameter String adaptationSignalName;
      Physiolibraryold.Curves.Curve curve(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3])
        annotation (Placement(transformation(extent={{-38,-16},{-18,4}})));
      Modelica.Blocks.Math.Product product annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-32})));
      Blocks.Integrator integrator(                    k=(1/Tau)/SecPerMin,
          y_start=initialValue,
        stateName=adaptationSignalName)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,14})));
      Modelica.Blocks.Math.Feedback feedback annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-60,46})));
      Real effect;
    equation
      effect = curve.val;
      connect(yBase, product.u1) annotation (Line(
          points={{6,80},{6,30},{6,-20},{6,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product.y, y) annotation (Line(
          points={{-2.02067e-015,-43},{-2.02067e-015,-55.5},{0,-55.5},{0,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(feedback.y, integrator.u) annotation (Line(
          points={{-60,37},{-60,26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(integrator.y, feedback.u2) annotation (Line(
          points={{-60,3},{-60,-6},{-84,-6},{-84,46},{-68,46}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(feedback.u1, u) annotation (Line(
          points={{-60,54},{-60,64},{-98,64}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(integrator.y, curve.u) annotation (Line(
          points={{-60,3},{-60,-6},{-38,-6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(curve.val, product.u2) annotation (Line(
          points={{-17.8,-6},{-6,-6},{-6,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end DelayedToSpline;

    model SplineDelayByDay
      "adapt the value of multiplication coeficient calculated from curve"
     extends Physiolibraryold.Interfaces.BaseFactorIcon3;
     Physiolibraryold.Interfaces.RealInput_ u annotation (Placement(
            transformation(extent={{-118,44},{-78,84}}), iconTransformation(
              extent={{-108,-10},{-88,10}})));
     parameter Real Tau;
     parameter Real[:,3] data;
     parameter String stateName;
      Physiolibraryold.Curves.Curve curve(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3])
        annotation (Placement(transformation(extent={{-68,58},{-48,78}})));
      Modelica.Blocks.Math.Product product annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-32})));
      Blocks.Integrator integrator(
          y_start=1, k=(1/(Tau*1440))/SecPerMin,
        stateName=stateName)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-26,12})));
      Modelica.Blocks.Math.Feedback feedback annotation (Placement(
            transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-26,44})));
      Real effect;
    equation
      effect = integrator.y;
      connect(curve.u, u) annotation (Line(
          points={{-68,68},{-83,68},{-83,64},{-98,64}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(yBase, product.u1) annotation (Line(
          points={{6,80},{6,30},{6,-20},{6,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product.y, y) annotation (Line(
          points={{-2.02067e-015,-43},{-2.02067e-015,-55.5},{0,-55.5},{0,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(curve.val, feedback.u1) annotation (Line(
          points={{-47.8,68},{-26,68},{-26,52}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(feedback.y, integrator.u) annotation (Line(
          points={{-26,35},{-26,29.5},{-26,24},{-26,24}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(integrator.y, feedback.u2) annotation (Line(
          points={{-26,1},{-26,-8},{-50,-8},{-50,44},{-34,44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(integrator.y, product.u2) annotation (Line(
          points={{-26,1},{-26,-8},{-6,-8},{-6,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SplineDelayByDay;

    model SplineDelayFactorByDayWithFailture
      "combination of SplineDelayByDay and ZeroIfFalse"
     extends Physiolibraryold.Interfaces.BaseFactorIcon2;
     Physiolibraryold.Interfaces.RealInput_ u annotation (Placement(
            transformation(extent={{-118,6},{-78,46}}), iconTransformation(
              extent={{-108,-30},{-88,-10}})));
     parameter Real Tau;
     parameter Real[:,3] data;
      parameter String stateName;
      Physiolibraryold.Curves.Curve curve(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3])
        annotation (Placement(transformation(extent={{-76,20},{-56,40}})));
      Modelica.Blocks.Math.Product product annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-50})));
      Blocks.Integrator integrator(                                    y_start=
           1, k=(1/(Tau*1440))/SecPerMin,
        stateName=stateName)
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-14,-6})));
      Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-14,26})));
      Modelica.Blocks.Logical.Switch switch1
        annotation (Placement(transformation(extent={{-36,40},{-16,60}})));
      Physiolibraryold.Blocks.Constant Constant1(k=0)
        annotation (Placement(transformation(extent={{-82,62},{-62,82}})));
      Physiolibraryold.Interfaces.BooleanInput Failed annotation (Placement(
            transformation(extent={{-118,30},{-78,70}}), iconTransformation(
              extent={{-108,30},{-88,50}})));
      Real effect;
    equation
      effect = integrator.y;
      connect(curve.u, u) annotation (Line(
          points={{-76,30},{-87,30},{-87,26},{-98,26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(yBase, product.u1) annotation (Line(
          points={{6,100},{6,31},{6,-38},{6,-38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product.y, y) annotation (Line(
          points={{-2.02067e-015,-61},{-2.02067e-015,-55.5},{0,-55.5},{0,-80}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(feedback.y, integrator.u) annotation (Line(
          points={{-14,17},{-14,14.25},{-14,14.25},{-14,11.5},{-14,6},{-14,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(integrator.y, feedback.u2) annotation (Line(
          points={{-14,-17},{-14,-26},{-38,-26},{-38,26},{-22,26}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(integrator.y, product.u2) annotation (Line(
          points={{-14,-17},{-14,-26},{-6,-26},{-6,-38}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(switch1.y, feedback.u1) annotation (Line(
          points={{-15,50},{-14,50},{-14,34}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(curve.val, switch1.u3) annotation (Line(
          points={{-55.8,30},{-54,30},{-54,42},{-38,42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(Constant1.y, switch1.u1) annotation (Line(
          points={{-61,72},{-58,72},{-58,58},{-38,58}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(switch1.u2, Failed) annotation (Line(
          points={{-38,50},{-98,50}},
          color={255,0,255},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=true,  extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SplineDelayFactorByDayWithFailture;

    package NonlinearSystemPatch
      model SplineValue3
        "calculate multiplication factor from spline value defined by 3 points"
       extends Physiolibraryold.Interfaces.BaseFactorIcon4;
       Physiolibraryold.Interfaces.RealInput_ u annotation (Placement(
              transformation(extent={{-102,-24},{-62,16}}), iconTransformation(
                extent={{-108,-10},{-88,10}})));
       parameter Real[:,3] data;
        Physiolibraryold.Curves.NonlinearSystemPatch.Curve3 curve(
          x=data[:, 1],
          y=data[:, 2],
          slope=data[:, 3])
          annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
        Modelica.Blocks.Math.Product product annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-32})));
      equation
        connect(curve.u, u) annotation (Line(
            points={{-46,0},{-64,0},{-64,-4},{-82,-4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(yBase, product.u1) annotation (Line(
            points={{6,80},{6,30},{6,-20},{6,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(curve.val, product.u2) annotation (Line(
            points={{-25.8,0},{-6,0},{-6,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(product.y, y) annotation (Line(
            points={{-2.02067e-015,-43},{-2.02067e-015,-55.5},{0,-55.5},{0,-60}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SplineValue3;

      model SplineValue2
        "calculate multiplication factor from spline value defined by 2 points"
       extends Physiolibraryold.Interfaces.BaseFactorIcon4;
       Physiolibraryold.Interfaces.RealInput_ u annotation (Placement(
              transformation(extent={{-102,-24},{-62,16}}), iconTransformation(
                extent={{-108,-10},{-88,10}})));
       parameter Real[:,3] data;
        Physiolibraryold.Curves.NonlinearSystemPatch.Curve2 curve(
          x=data[:, 1],
          y=data[:, 2],
          slope=data[:, 3])
          annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
        Modelica.Blocks.Math.Product product annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-32})));
      equation
        connect(curve.u, u) annotation (Line(
            points={{-46,0},{-64,0},{-64,-4},{-82,-4}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(yBase, product.u1) annotation (Line(
            points={{6,80},{6,30},{6,-20},{6,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(curve.val, product.u2) annotation (Line(
            points={{-25.8,0},{-6,0},{-6,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(product.y, y) annotation (Line(
            points={{-2.02067e-015,-43},{-2.02067e-015,-55.5},{0,-55.5},{0,-60}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SplineValue2;

      model Spline3DelayByDay
        "adapt the value of multiplication coeficient calculated from curve defined by 3 points"
       extends Physiolibraryold.Interfaces.BaseFactorIcon3;
       Physiolibraryold.Interfaces.RealInput_ u annotation (Placement(
              transformation(extent={{-118,44},{-78,84}}), iconTransformation(
                extent={{-108,-10},{-88,10}})));
       parameter Real Tau;
       parameter Real[:,3] data;
        Physiolibraryold.Curves.NonlinearSystemPatch.Curve3 curve(
          x=data[:, 1],
          y=data[:, 2],
          slope=data[:, 3])
          annotation (Placement(transformation(extent={{-68,58},{-48,78}})));
        Modelica.Blocks.Math.Product product annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-32})));
        Modelica.Blocks.Continuous.Integrator integrator(
            y_start=1, k=(1/(Tau*1440))/SecPerMin,
          initType=Modelica.Blocks.Types.Init.SteadyState)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-26,12})));
        Modelica.Blocks.Math.Feedback feedback annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-26,44})));
      equation
        connect(curve.u, u) annotation (Line(
            points={{-68,68},{-83,68},{-83,64},{-98,64}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(yBase, product.u1) annotation (Line(
            points={{6,80},{6,30},{6,-20},{6,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(product.y, y) annotation (Line(
            points={{-2.02067e-015,-43},{-2.02067e-015,-55.5},{0,-55.5},{0,-60}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(curve.val, feedback.u1) annotation (Line(
            points={{-47.8,68},{-26,68},{-26,52}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(feedback.y, integrator.u) annotation (Line(
            points={{-26,35},{-26,29.5},{-26,24},{-26,24}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(integrator.y, feedback.u2) annotation (Line(
            points={{-26,1},{-26,-8},{-50,-8},{-50,44},{-34,44}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(integrator.y, product.u2) annotation (Line(
            points={{-26,1},{-26,-8},{-6,-8},{-6,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end Spline3DelayByDay;
    end NonlinearSystemPatch;

    model SplineValue2 "calculate multiplication factor from spline value"
     extends Physiolibraryold.Interfaces.BaseFactorIcon4;
     Physiolibraryold.Interfaces.RealInput_ u annotation (Placement(
            transformation(extent={{-102,-24},{-62,16}}), iconTransformation(
              extent={{-108,-10},{-88,10}})));
     parameter Boolean INVERSE=false;
     parameter Real[:,3] data;
      Physiolibraryold.Curves.Curve curve(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3])
        annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
    //    ,INVERSION=INVERSE)
      Modelica.Blocks.Math.Product product annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-32})));
      Real effect;
    equation
      effect = curve.val;
      connect(curve.u, u) annotation (Line(
          points={{-46,0},{-64,0},{-64,-4},{-82,-4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(yBase, product.u1) annotation (Line(
          points={{6,80},{6,30},{6,-20},{6,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(curve.val, product.u2) annotation (Line(
          points={{-25.8,0},{-6,0},{-6,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product.y, y) annotation (Line(
          points={{-2.02067e-015,-43},{-2.02067e-015,-55.5},{0,-55.5},{0,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SplineValue2;

    package test
      model SplineDelayByDay
        "adapt the value of multiplication coeficient calculated from curve"
       extends Physiolibraryold.Interfaces.BaseFactorIcon3;
       Physiolibraryold.Interfaces.RealInput_ u annotation (Placement(
              transformation(extent={{-118,44},{-78,84}}), iconTransformation(
                extent={{-108,-10},{-88,10}})));
       parameter Real Tau;
       parameter Real[:,3] data;
        Physiolibraryold.Curves.Curve curve(
          x=data[:, 1],
          y=data[:, 2],
          slope=data[:, 3])
          annotation (Placement(transformation(extent={{-68,58},{-48,78}})));
        Modelica.Blocks.Math.Product product annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-32})));
        Modelica.Blocks.Continuous.Integrator integrator(
            y_start=1, k=(1/(Tau*1440))/SecPerMin,
          initType=Modelica.Blocks.Types.Init.SteadyState)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-26,12})));
        Modelica.Blocks.Math.Feedback feedback annotation (Placement(
              transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-26,44})));
        Real effect;
      equation
        effect = integrator.y;
        connect(curve.u, u) annotation (Line(
            points={{-68,68},{-83,68},{-83,64},{-98,64}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(yBase, product.u1) annotation (Line(
            points={{6,80},{6,30},{6,-20},{6,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(product.y, y) annotation (Line(
            points={{-2.02067e-015,-43},{-2.02067e-015,-55.5},{0,-55.5},{0,
                -60}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(curve.val, feedback.u1) annotation (Line(
            points={{-47.8,68},{-26,68},{-26,52}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(feedback.y, integrator.u) annotation (Line(
            points={{-26,35},{-26,29.5},{-26,24},{-26,24}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(integrator.y, feedback.u2) annotation (Line(
            points={{-26,1},{-26,-8},{-50,-8},{-50,44},{-34,44}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(integrator.y, product.u2) annotation (Line(
            points={{-26,1},{-26,-8},{-6,-8},{-6,-20}},
            color={0,0,127},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SplineDelayByDay;

      model SplineDelayFactorByDayWithFailture
        "combination of SplineDelayByDay and ZeroIfFalse"
       extends Physiolibraryold.Interfaces.BaseFactorIcon2;
       Physiolibraryold.Interfaces.RealInput_ u annotation (Placement(
              transformation(extent={{-118,6},{-78,46}}), iconTransformation(
                extent={{-108,-30},{-88,-10}})));
       parameter Real Tau;
       parameter Real[:,3] data;
        Physiolibraryold.Curves.Curve curve(
          x=data[:, 1],
          y=data[:, 2],
          slope=data[:, 3])
          annotation (Placement(transformation(extent={{-76,20},{-56,40}})));
        Modelica.Blocks.Math.Product product annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={0,-50})));
        Modelica.Blocks.Continuous.Integrator integrator(                y_start=
             1, k=(1/(Tau*1440))/SecPerMin,
          initType=Modelica.Blocks.Types.Init.SteadyState)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-14,-6})));
        Modelica.Blocks.Math.Feedback feedback annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-14,26})));
        Modelica.Blocks.Logical.Switch switch1
          annotation (Placement(transformation(extent={{-36,40},{-16,60}})));
        Physiolibraryold.Blocks.Constant Constant1(k=0)
          annotation (Placement(transformation(extent={{-82,62},{-62,82}})));
        Physiolibraryold.Interfaces.BooleanInput Failed annotation (Placement(
              transformation(extent={{-118,30},{-78,70}}), iconTransformation(
                extent={{-108,30},{-88,50}})));
        Real effect;
      equation
        effect = integrator.y;
        connect(curve.u, u) annotation (Line(
            points={{-76,30},{-87,30},{-87,26},{-98,26}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(yBase, product.u1) annotation (Line(
            points={{6,100},{6,31},{6,-38},{6,-38}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(product.y, y) annotation (Line(
            points={{-2.02067e-015,-61},{-2.02067e-015,-55.5},{0,-55.5},{0,
                -80}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(feedback.y, integrator.u) annotation (Line(
            points={{-14,17},{-14,14.25},{-14,14.25},{-14,11.5},{-14,6},{-14,
                6}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(integrator.y, feedback.u2) annotation (Line(
            points={{-14,-17},{-14,-26},{-38,-26},{-38,26},{-22,26}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(integrator.y, product.u2) annotation (Line(
            points={{-14,-17},{-14,-26},{-6,-26},{-6,-38}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(switch1.y, feedback.u1) annotation (Line(
            points={{-15,50},{-14,50},{-14,34}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(curve.val, switch1.u3) annotation (Line(
            points={{-55.8,30},{-54,30},{-54,42},{-38,42}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(Constant1.y, switch1.u1) annotation (Line(
            points={{-61,72},{-58,72},{-58,58},{-38,58}},
            color={0,0,127},
            smooth=Smooth.None));
        connect(switch1.u2, Failed) annotation (Line(
            points={{-38,50},{-98,50}},
            color={255,0,255},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics), Icon(coordinateSystem(
                preserveAspectRatio=true,  extent={{-100,-100},{100,100}}), graphics),
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end SplineDelayFactorByDayWithFailture;
    end test;

    model Dumping
     //extends Physiolibrary.Interfaces.BaseModel;
      Physiolibraryold.Interfaces.RealInput_ u1 annotation (Placement(
            transformation(extent={{-120,60},{-80,100}}), iconTransformation(
            extent={{-12,-12},{12,12}},
            rotation=270,
            origin={-2,24})));
      Physiolibraryold.Interfaces.RealOutput_ u2 annotation (Placement(
            transformation(extent={{60,-70},{100,-30}}), iconTransformation(
            extent={{-11,-11},{11,11}},
            rotation=270,
            origin={-1,-27})));
      Modelica.Blocks.Math.Add add(k2=-1)
        annotation (Placement(transformation(extent={{-60,64},{-40,84}})));
      SimpleMultiply simpleMultiply
        annotation (Placement(transformation(extent={{-20,-10},{20,30}})));
      Blocks.Constant Constant(k=0.25)
        annotation (Placement(transformation(extent={{-40,6},{-32,14}})));
      Blocks.Integrator integrator(y_start=1)
        annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
    equation
      connect(Constant.y, simpleMultiply.u) annotation (Line(
          points={{-31.6,10},{-19.6,10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.y, simpleMultiply.yBase) annotation (Line(
          points={{-39,74},{0,74},{0,14}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(simpleMultiply.y, integrator.u) annotation (Line(
          points={{0,6},{0,-50},{18,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(integrator.y, u2) annotation (Line(
          points={{41,-50},{80,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(add.u2, integrator.y) annotation (Line(
          points={{-62,68},{-70,68},{-70,-70},{50,-70},{50,-50},{41,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(u1, add.u1) annotation (Line(
          points={{-100,80},{-62,80}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(graphics={  Rectangle(
              extent={{-100,22},{100,-22}},
              lineColor={0,127,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Sphere), Text(
              extent={{-92,-10},{90,10}},
              lineColor={0,0,0},
              textString="%name")}),
                                  Diagram(graphics));
    end Dumping;

    model SimpleAddition "multiplication"
     extends Physiolibraryold.Interfaces.BaseFactorIcon;
     Physiolibraryold.Interfaces.RealInput_ u annotation (Placement(
            transformation(extent={{-106,-14},{-66,26}}), iconTransformation(
              extent={{-108,-10},{-88,10}})));
      Real effect;
      Modelica.Blocks.Math.Add add annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-24})));
    equation
      effect = u;
      connect(add.y, y) annotation (Line(
          points={{-2.02067e-015,-35},{-2.02067e-015,-44.5},{0,-44.5},{0,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(u, add.u2) annotation (Line(
          points={{-86,6},{-6,6},{-6,-12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(yBase, add.u1) annotation (Line(
          points={{6,80},{6,34},{6,-12},{6,-12}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",
        info="<html>
<p><h4>y = yBase * u</h4></p>
</html>"),
        Icon(graphics={
            Ellipse(
              extent={{-102,28},{-82,8}},
              lineColor={255,255,170},
              fillColor={255,255,170},
              fillPattern=FillPattern.Solid), Text(
              extent={{-114,40},{-70,-6}},
              lineColor={0,0,0},
              textString="+")}));
    end SimpleAddition;

    model CurveValueWithLinearSimplificationByHomotopy
      "calculate multiplication factor from function defined by curve"
     extends Physiolibraryold.Interfaces.BaseFactorIcon4;
     Physiolibraryold.Interfaces.RealInput_ u annotation (Placement(
            transformation(extent={{-102,-24},{-62,16}}), iconTransformation(
              extent={{-108,-10},{-88,10}})));
     parameter Real defaultU = 0;
      parameter Real defaultSlope = 0;
      parameter Real defaultValue = 1;
     parameter Real[:,3] data;
      Physiolibraryold.Curves.Curve curve(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3])
        annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
      Modelica.Blocks.Math.Product product annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={0,-32})));
      Real effect;
    equation
      effect = homotopy(curve.val,defaultSlope*(u-defaultU)+defaultValue);
      product.u2 = effect;
      connect(curve.u, u) annotation (Line(
          points={{-46,0},{-64,0},{-64,-4},{-82,-4}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(yBase, product.u1) annotation (Line(
          points={{6,80},{6,30},{6,-20},{6,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(product.y, y) annotation (Line(
          points={{-2.02067e-015,-43},{-2.02067e-015,-55.5},{0,-55.5},{0,-60}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end CurveValueWithLinearSimplificationByHomotopy;
  end Factors;

  package ConcentrationFlow "Concentration Physical Domain"
    replaceable type Concentration = Real (final quantity="Concentration");
    replaceable type SoluteFlow = Real (final quantity="Flow");
    replaceable type SoluteMass = Real (final quantity="Mass");
    connector ConcentrationFlow "Concentration and Solute flow"
      Concentration conc;
      flow SoluteFlow q;
      annotation (Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ConcentrationFlow;

    connector PositiveConcentrationFlow "Concentration and Solute inflow"
      extends Physiolibraryold.ConcentrationFlow.ConcentrationFlow;
    annotation (
        defaultComponentName="q_in",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={200,0,0},
              lineThickness=1), Polygon(
              points={{0,100},{100,0},{0,-100},{-100,0},{0,100}},
              lineColor={200,0,0},
              smooth=Smooth.None,
              fillPattern=FillPattern.Solid,
              fillColor={200,0,0})}),
        Diagram(Polygon(points=[-21,-3; 5,23; 31,-3; 5,-29; -21,-3],   style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={0,0,0})), Text(
            extent=[-105,-38; 115,-83],
            string="%name",
            style(color=0, rgbcolor={0,0,0}))),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>",
        revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end PositiveConcentrationFlow;

    connector NegativeConcentrationFlow
      "Concentration and negative Solute outflow"
      extends Physiolibraryold.ConcentrationFlow.ConcentrationFlow;
    annotation (
        defaultComponentName="q_out",
        Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=false),
            graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={200,0,0},
              lineThickness=1), Polygon(
              points={{-100,0},{0,100},{100,0},{0,-100},{-100,0}},
              lineColor={200,0,0},
              smooth=Smooth.None,
              fillPattern=FillPattern.Solid,
              fillColor={255,240,240})}),
        Diagram(Polygon(points=[-21,-3; 5,23; 31,-3; 5,-29; -21,-3],   style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={255,255,255})), Text(
            extent=[-105,-38; 115,-83],
            string="%name",
            style(color=0, rgbcolor={0,0,0}))),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>",
        revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end NegativeConcentrationFlow;

    model FlowMeasure
      Physiolibraryold.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{18,-10},{38,10}}), iconTransformation(extent={{30,-10},{50,10}})));
      Physiolibraryold.ConcentrationFlow.PositiveConcentrationFlow q_in
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
            iconTransformation(extent={{-50,-10},{-30,10}})));
      Physiolibraryold.Interfaces.RealOutput_ actualFlow annotation (Placement(
            transformation(extent={{-20,30},{20,70}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,50})));
    equation
      q_in.q + q_out.q = 0;
      q_out.conc = q_in.conc;
      actualFlow = q_in.q;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-40,30},{40,-30}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
                                      Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end FlowMeasure;

    model ConcentrationMeasure
      parameter String unitsString="";
      parameter Real toAnotherUnitCoef=1;
      Physiolibraryold.ConcentrationFlow.PositiveConcentrationFlow q_in
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
            iconTransformation(extent={{-10,-10},{10,10}})));
      Physiolibraryold.Interfaces.RealOutput_ actualConc annotation (Placement(
            transformation(extent={{-20,30},{20,70}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,40})));
    equation
      actualConc =  toAnotherUnitCoef * q_in.conc;
      q_in.q = 0;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Text(
              extent={{-48,-24},{48,-40}},
              lineColor={0,0,0},
              textString="%unitsString"), Rectangle(
              extent={{-20,20},{20,-20}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
                                      Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ConcentrationMeasure;

    partial model ResistorBase
     extends Physiolibraryold.Icons.Resistor;
      Physiolibraryold.ConcentrationFlow.PositiveConcentrationFlow q_in
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{-96,-10},{-76,10}}), iconTransformation(extent={{-96,-10},{-76,
                10}})));
      Physiolibraryold.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{90,-10},{110,10}}), iconTransformation(extent={{76,-10},{96,
                10}})));
      annotation (Icon(graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="icons/diffusion.png")}), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ResistorBase;

    partial model Resistor
     extends ResistorBase;
    equation
      q_in.q + q_out.q = 0;
      annotation (Icon(graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Resistor;

    model ResistorWithCondParam
     extends Resistor;
     parameter Real cond
        "speed of solute in dependence on concentration gradient";
    equation
      q_in.q = cond * (q_in.conc - q_out.conc);
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                          graphics), Icon(graphics={Text(
              extent={{-70,38},{70,80}},
              lineColor={0,0,0},
              textString="%cond"), Text(
              extent={{-142,-90},{142,-40}},
              textString="%name",
              lineColor={0,0,255})}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ResistorWithCondParam;

    model ResistorWithControledCond
     extends Resistor;
      Interfaces.RealInput_G cond
                               annotation (Placement(transformation(extent={{-48,26},
                {-8,66}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=225,
            origin={14,44})));
    equation
      q_in.q = cond * (q_in.conc - q_out.conc);
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                          graphics), Icon(graphics={
                                   Text(
              extent={{-142,-90},{142,-40}},
              textString="%name",
              lineColor={0,0,255})}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ResistorWithControledCond;

    model SolventFlowPump
      Physiolibraryold.ConcentrationFlow.NegativeConcentrationFlow q_out
        "second side connector with value of q (solute mass flow) and conc (concentration)"
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{90,-10},{110,10}})));
      Interfaces.RealInput_ solventFlow
        "solvent flow (solution volume flow = solventFlow + solute volume flow)"
                                    annotation ( extent = [-10,50;10,70], rotation = -90);
      Physiolibraryold.ConcentrationFlow.PositiveConcentrationFlow q_in
        "first side connector with value of q (solute mass flow) and conc (concentration)"
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
    equation
      q_in.q + q_out.q = 0;
      q_in.q = if initial() or (solventFlow>=0) then
         solventFlow*q_in.conc else
         solventFlow*q_out.conc;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-100},{150,-60}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2009</td>
</tr>
</table>
</html>",     info="<html>
<p><h4><font color=\"#008000\">Bidirectional mass flow by concentration</font></h4></p>
<p>Possible field values: </p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0.1\"><tr>
<td></td>
<td><p align=\"center\">forward flow</p></td>
<td><p align=\"center\">backward flow</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>solventFlow</h4></p></td>
<td><p align=\"center\">&GT;=0</p></td>
<td><p align=\"center\">&LT;0</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>q_in.q</h4></p></td>
<td><p align=\"center\">=solventFlow*q_in.conc</p></td>
<td><p align=\"center\">=solventFlow*q_out.conc</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>q_out.q</h4></p></td>
<td><p align=\"center\">=-q_in.q</p></td>
<td><p align=\"center\">=-q_in.q</p></td>
</tr>
</table>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end SolventFlowPump;

    model SolventOutflowPump
      Physiolibraryold.Interfaces.RealInput solventFlow "solvent outflow"
        annotation (extent=[-10,50; 10,70], rotation=-90);
      Physiolibraryold.ConcentrationFlow.PositiveConcentrationFlow q_in
        "solute outflow" annotation (Placement(transformation(extent={{-120,-20},
                {-80,20}}), iconTransformation(extent={{-110,-10},{-90,10}})));
      parameter Real K=1 "part of real mass flow in solution outflow";
    equation
      q_in.q = K*solventFlow*q_in.conc;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-100},{150,-60}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{-100,-30},{100,-50}},
              lineColor={0,0,0},
              textString="K=%K")}),   Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2009</td>
</tr>
</table>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end SolventOutflowPump;

    model Synthesis
      parameter SoluteFlow SynthesisBasic =   0.01;
      parameter Real[:,3] data =  {{ 20.0,  3.0,  0.0}, { 28.0,  1.0,  -0.2}, { 40.0,  0.0,  0.0}}
        "COPEffect";
      Physiolibraryold.Curves.Curve c(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3]);
      Physiolibraryold.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{90,-10},{110,10}})));
      Real COP;
      SoluteMass synthetized( start=0);
    protected
      parameter Real C1 =    320.0;
      parameter Real C2 =    1160.0;
    equation
      COP = if  q_out.conc > 0.0 then   ( C1 * q_out.conc)  + ( C2 * q_out.conc * q_out.conc) else   0.0;
      c.u=COP;
      q_out.q = - SynthesisBasic*c.val;
      der(synthetized) = -q_out.q/SecPerMin;
     annotation (
        defaultComponentName="synthesis",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-100,-50},{90,50}},
              lineColor={0,0,255},
              textString="%name")}),  Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end Synthesis;

    model Degradation
      parameter SoluteFlow DegradationBasic =   0.01;
      parameter Real[:,3] data =  {{ 0.00,  0.0,  0.0}, { 0.07,  1.0,  40.0}, { 0.09,  6.0,  0.0}}
        "ProteinEffect";
      Physiolibraryold.Curves.Curve c(
        x=data[:, 1],
        y=data[:, 2],
        slope=data[:, 3]);
      PositiveConcentrationFlow q_in
        annotation (Placement(transformation(extent={{-100,0},{-60,40}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
    SoluteMass degraded( start=0);
    equation
      c.u=q_in.conc;
      q_in.q = DegradationBasic*c.val;
      der(degraded) = q_in.q/SecPerMin;
     annotation (
        defaultComponentName="degradation",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-88,-50},{100,50}},
              lineColor={0,0,255},
              textString="%name")}),  Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end Degradation;

    model InputPump
      Physiolibraryold.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{90,-10},{110,10}}), iconTransformation(extent={{50,-10},{70,
                10}})));
      Physiolibraryold.Interfaces.RealInput_ desiredFlow "speed of solute flow"
        annotation (extent=[-10,30; 10,50], rotation=-90);
    equation
      q_out.q = - desiredFlow;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-60,-30},{60,30}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-48,20},{50,0},{-48,-21},{-48,20}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-92,-54},{80,-30}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end InputPump;

    model OutputPump
      Physiolibraryold.ConcentrationFlow.PositiveConcentrationFlow q_in
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{-110,-8},{-90,12}}), iconTransformation(extent={{-70,-10},{-50,
                10}})));
      Physiolibraryold.Interfaces.RealInput_ desiredFlow
        annotation (extent=[-10,30; 10,50], rotation=-90);
    equation
      q_in.q = desiredFlow;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-60,-32},{60,30}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-48,18},{50,-2},{-48,-26},{-48,18}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-78,-54},{72,-32}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end OutputPump;

    model SoluteFlowPump
      Physiolibraryold.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{90,-10},{110,10}})));
      Physiolibraryold.Interfaces.RealInput soluteFlow
        annotation (extent=[-10,50; 10,70], rotation=-90);
      Physiolibraryold.ConcentrationFlow.PositiveConcentrationFlow q_in
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
    equation
      q_in.q + q_out.q = 0;
      q_in.q = soluteFlow;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-100},{150,-60}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end SoluteFlowPump;

    model PartialPressure
      "partial gas concentration in ml/ml multiplied by ambient pressure"
      PressureFlow.NegativePressureFlow outflow         annotation (Placement(
            transformation(extent={{-20,-120},{20,-80}}), iconTransformation(extent=
               {{-10,-110},{10,-90}})));
      PositiveConcentrationFlow q_in
        annotation (Placement(transformation(extent={{-20,80},{20,120}}),
            iconTransformation(extent={{-10,90},{10,110}})));
      Interfaces.RealInput_ ambientPressure(final unit="mmHg") annotation (Placement(transformation(extent={{
                -60,-20},{-20,20}}), iconTransformation(extent={{-60,-20},{-20,20}})));
    equation
      q_in.q+outflow.q=0;
      outflow.pressure=q_in.conc*ambientPressure;
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-40,100},{40,-100}},
              lineColor={0,0,255},
              fillColor={215,215,215},
              fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end PartialPressure;

    model Dilution
    // parameter Real DilutionCoef=1-47/760;
      NegativeConcentrationFlow q_diluted
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,10},{110,30}}), iconTransformation(extent={{90,50},
                {110,70}})));
      PositiveConcentrationFlow q_concentrated
                                annotation (Placement(
            transformation(extent={{-130,-28},{-90,12}}), iconTransformation(extent={{-110,50},
                {-90,70}})));
      Interfaces.RealInput_ dilution
        "dilution = one minus (part of added solvent volume(not containing solute) normalized to whole summed volume)"
        annotation (Placement(transformation(extent={{-16,8},{24,48}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={-92,-68})));
    equation
      q_diluted.q+q_concentrated.q=0;
      q_diluted.conc = dilution * q_concentrated.conc;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Bitmap(extent={{-100,100},{100,-102}},
                fileName="icons/dilution.png")}),
                                      Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end Dilution;

    model Reabsorbtion
      PositiveConcentrationFlow Inflow               annotation (Placement(
            transformation(extent={{-120,-18},{-80,22}}), iconTransformation(
              extent={{-110,-10},{-90,10}})));
      NegativeConcentrationFlow Outflow
        annotation (Placement(transformation(extent={{0,-100},{40,-60}}),
            iconTransformation(extent={{90,-10},{110,10}})));
      NegativeConcentrationFlow Reabsorbtion           annotation (Placement(
            transformation(extent={{-20,-100},{20,-60}}),iconTransformation(
              extent={{-10,-50},{10,-30}})));
      Physiolibraryold.Interfaces.RealInput_ ReabsorbedFract(final unit="1")
        annotation (Placement(transformation(extent={{-20,20},{20,60}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=-90,
            origin={0,40})));
    equation
      Outflow.q + Inflow.q + Reabsorbtion.q = 0;
      Outflow.conc = Inflow.conc;
      Reabsorbtion.q = - ReabsorbedFract * Inflow.q;
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,40},{100,-40}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-70,14},{-70,-18},{-52,-12},{-36,-14},{-18,-20},{-2,-28},
                  {6,-36},{8,-40},{6,-22},{0,-12},{-8,-6},{-22,2},{-40,8},{-58,
                  12},{-70,14}},
              color={0,0,255},
              smooth=Smooth.None),
            Text(
              extent={{12,-54},{166,-84}},
              lineColor={0,0,255},
              textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=true,
                      extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Reabsorbtion;

    model FractReabsorbtion
      PositiveConcentrationFlow Inflow               annotation (Placement(
            transformation(extent={{-120,-18},{-80,22}}), iconTransformation(
              extent={{-110,-10},{-90,10}})));
      NegativeConcentrationFlow Outflow
        annotation (Placement(transformation(extent={{0,-100},{40,-60}}),
            iconTransformation(extent={{90,-10},{110,10}})));
      NegativeConcentrationFlow Reabsorbtion           annotation (Placement(
            transformation(extent={{-20,-100},{20,-60}}),iconTransformation(
              extent={{-10,-50},{10,-30}})));
      Physiolibraryold.Interfaces.RealInput_ Normal(final unit="1") annotation
        (Placement(transformation(extent={{-20,20},{20,60}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=-90,
            origin={-60,40})));
      Physiolibraryold.Interfaces.RealInput_ Effects(final unit="1")
        annotation (Placement(transformation(extent={{-20,20},{20,60}}),
            iconTransformation(extent={{60,20},{100,60}}, rotation=-90)));
    parameter SoluteFlow MaxReab=14 "maximum reabsorbtion solute flow";
      Interfaces.RealOutput_ ReabFract(final unit="1") annotation (Placement(transformation(extent={{80,-60},
                {120,-20}}), iconTransformation(extent={{80,-60},{120,-20}})));
    equation
      Outflow.q + Inflow.q + Reabsorbtion.q = 0;
      Outflow.conc = Inflow.conc;
      Reabsorbtion.q = -min(ReabFract * Inflow.q, MaxReab);
      ReabFract = if (Normal<=0) or (Effects<=0) then 0 else if Normal>1 then 1 else Normal^(1/Effects);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,40},{100,-40}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-70,14},{-70,-18},{-52,-12},{-36,-14},{-18,-20},{-2,-28},
                  {6,-36},{8,-40},{6,-22},{0,-12},{-8,-6},{-22,2},{-40,8},{-58,
                  12},{-70,14}},
              color={0,0,255},
              smooth=Smooth.None),
            Text(
              extent={{12,-54},{166,-84}},
              lineColor={0,0,255},
              textString="%name"),
            Text(
              extent={{-100,-40},{-4,-62}},
              lineColor={0,0,255},
              textString="%MaxReab = MaxReab")}),
                                     Diagram(coordinateSystem(preserveAspectRatio=true,
                      extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end FractReabsorbtion;

    model FractReabsorbtion2
      PositiveConcentrationFlow Inflow               annotation (Placement(
            transformation(extent={{-120,-18},{-80,22}}), iconTransformation(
              extent={{-110,-10},{-90,10}})));
      NegativeConcentrationFlow Outflow
        annotation (Placement(transformation(extent={{0,-100},{40,-60}}),
            iconTransformation(extent={{90,-10},{110,10}})));
      NegativeConcentrationFlow Reabsorbtion           annotation (Placement(
            transformation(extent={{-20,-100},{20,-60}}),iconTransformation(
              extent={{-10,-50},{10,-30}})));
      Physiolibraryold.Interfaces.RealInput_ Normal(final unit="1") annotation
        (Placement(transformation(extent={{-20,20},{20,60}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=-90,
            origin={-60,40})));
      Physiolibraryold.Interfaces.RealInput_ Effects(final unit="1")
        annotation (Placement(transformation(extent={{-20,20},{20,60}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=-90,
            origin={80,40})));
      Real ReabFract(final unit="1");
      Physiolibraryold.Interfaces.RealInput_ MaxReab annotation (Placement(
            transformation(extent={{-20,20},{20,60}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-60,-42})));
    equation
      Outflow.q + Inflow.q + Reabsorbtion.q = 0;
      Outflow.conc = Inflow.conc;
      Reabsorbtion.q = -min(ReabFract * Inflow.q, MaxReab);
      ReabFract = if (Normal<=0) or (Effects<=0) then 0 else if Normal>1 then 1 else Normal^(1/Effects);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,40},{100,-40}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-70,14},{-70,-18},{-52,-12},{-36,-14},{-18,-20},{-2,-28},
                  {6,-36},{8,-40},{6,-22},{0,-12},{-8,-6},{-22,2},{-40,8},{-58,
                  12},{-70,14}},
              color={0,0,255},
              smooth=Smooth.None),
            Text(
              extent={{12,-42},{166,-72}},
              lineColor={0,0,255},
              textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=true,
                      extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end FractReabsorbtion2;

    model ConstLimitedReabsorbtion
      PositiveConcentrationFlow Inflow               annotation (Placement(
            transformation(extent={{-120,-18},{-80,22}}), iconTransformation(
              extent={{-110,-10},{-90,10}})));
      NegativeConcentrationFlow Outflow
        annotation (Placement(transformation(extent={{0,-100},{40,-60}}),
            iconTransformation(extent={{90,-10},{110,10}})));
      NegativeConcentrationFlow Reabsorbtion           annotation (Placement(
            transformation(extent={{-20,-100},{20,-60}}),iconTransformation(
              extent={{-10,-50},{10,-30}})));
    parameter SoluteFlow MaxReab=250 "maximum reabsorbtion solute flow";
    equation
      Outflow.q + Inflow.q + Reabsorbtion.q = 0;
      Outflow.conc = Inflow.conc;
      Reabsorbtion.q = -min( Inflow.q, MaxReab);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,40},{100,-40}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-70,14},{-70,-18},{-52,-12},{-36,-14},{-18,-20},{-2,-28},
                  {6,-36},{8,-40},{6,-22},{0,-12},{-8,-6},{-22,2},{-40,8},{-58,
                  12},{-70,14}},
              color={0,0,255},
              smooth=Smooth.None),
            Text(
              extent={{12,-42},{166,-72}},
              lineColor={0,0,255},
              textString="%name"),
            Text(
              extent={{-100,-40},{-4,-62}},
              lineColor={0,0,255},
              textString="%MaxReab = MaxReab")}),
                                     Diagram(coordinateSystem(preserveAspectRatio=true,
                      extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ConstLimitedReabsorbtion;

    model FlowConcentrationMeasure
      PositiveConcentrationFlow q_in
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent=
                {{-110,-10},{-90,10}})));
      Physiolibraryold.Interfaces.RealInput_ SolventFlow(final quantity="Flow",
          final unit="ml/min") annotation (extent=[-10,50; 10,70], rotation=-90);
      Interfaces.RealInput_ AdditionalSoluteFlow annotation (Placement(
            transformation(extent={{-60,60},{-20,100}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=90,
            origin={0,-60})));
      Interfaces.RealOutput_ Conc annotation (Placement(transformation(extent=
               {{82,-20},{122,20}}), iconTransformation(extent={{82,-20},{122,
                20}})));
    equation
      Conc = q_in.conc + AdditionalSoluteFlow/SolventFlow;
      q_in.q = 0;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-88,-50},{80,50}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end FlowConcentrationMeasure;

    model SimpleReaction
      Physiolibraryold.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{90,-10},{110,10}})));
      Physiolibraryold.Interfaces.RealInput_ coef
        "who much units of q_out produce one unit of q_in"
        annotation (extent=[-10,30; 10,50], rotation=-90);
      Physiolibraryold.ConcentrationFlow.PositiveConcentrationFlow q_in
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
    equation
      q_out.q + coef*q_in.q = 0;
      q_out.conc = coef*q_in.conc;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-28},{100,30}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-128,-60},{142,-34}},
              textString="%name",
              lineColor={0,0,255}),
            Polygon(
              points={{-60,4},{-60,2},{54,2},{54,2},{18,12},{18,4},{-60,4}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}),
                                      Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end SimpleReaction;

    model SimpleReaction2
      Physiolibraryold.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{90,20},{110,40}}), iconTransformation(extent={{90,20},{110,40}})));
      Physiolibraryold.Interfaces.RealInput_ coef
        "who much units of q_out produce one unit of q_in"
        annotation (extent=[-10,30; 10,50], rotation=-90);
      Physiolibraryold.ConcentrationFlow.PositiveConcentrationFlow q_in
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
      Physiolibraryold.ConcentrationFlow.NegativeConcentrationFlow q_out2
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{90,-10},{110,10}}), iconTransformation(extent={{90,-40},{110,
                -20}})));
      Interfaces.RealInput_ coef2
        "who much units of q_out2 produce one unit of q_in"                           annotation (Placement(transformation(extent={{-54,
                20},{-14,60}}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={60,40})));
    equation
      q_out.q + coef*q_in.q = 0;
      q_out2.q + coef2*q_in.q = 0;
      q_out.conc = coef*q_in.conc;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-30},{100,30}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-128,-66},{142,-40}},
              textString="%name",
              lineColor={0,0,255}),
            Polygon(
              points={{-60,4},{-60,2},{54,2},{54,2},{18,12},{18,4},{-60,4}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}),
                                      Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end SimpleReaction2;

    model UnlimitedStorage
      //extends HumMod.Library.Interfaces.BaseModel;
      Physiolibraryold.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (Placement(transformation(extent={{62,-32},{102,8}}),
            iconTransformation(extent={{-8,-10},{12,10}})));
      parameter Real concentration(final unit="%");
    equation
      q_out.conc = 0.01*concentration;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={Text(
              extent={{-100,102},{100,124}},
              lineColor={0,0,0},
              fillPattern=FillPattern.VerticalCylinder,
              fillColor={215,215,215},
              textString="(%concentration%%)"), Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/massStorage.png")}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end UnlimitedStorage;

    model ConcentrationCompartment
      extends Physiolibraryold.Utilities.DynamicState;
      //extends QHP.Library.Interfaces.BaseModel;
      Physiolibraryold.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (Placement(transformation(extent={{62,-32},{102,8}}),
            iconTransformation(extent={{-10,-10},{10,10}})));
      parameter Real initialSoluteMass;
      Physiolibraryold.Interfaces.RealInput_ SolventVolume(final quantity=
            "Volume", final unit="ml") annotation (Placement(transformation(
              extent={{-120,68},{-80,108}}), iconTransformation(extent={{-100,
                40},{-60,80}})));
      Physiolibraryold.Interfaces.RealOutput_ soluteMass(start=
            initialSoluteMass) annotation (Placement(transformation(
            extent={{-20,-120},{20,-80}},
            rotation=-90,
            origin={102,-102}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-78})));                                                 //, min=0)
    //initial equation
    //  soluteMass = initialSoluteMass;
    equation
      //assert(soluteMass>=0,"Solute mass has to be positive value!");
        q_out.conc = if (SolventVolume>0) then soluteMass / SolventVolume else 0;
    //  q_out.conc = if initial() or (SolventVolume>0) then soluteMass / SolventVolume else 0;
    //  der(soluteMass) = q_out.q / Library.SecPerMin;
      stateValue = soluteMass;
      changePerMin = q_out.q;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={Bitmap(extent={{-100,100},{100,-100}}, fileName=
                  "icons/concentrationCompartement.png"), Text(
              extent={{-22,-102},{220,-136}},
              lineColor={0,0,255},
              textString="%name")}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ConcentrationCompartment;

    model MassStorageCompartment
      //extends QHP.Library.Interfaces.BaseModel;
      extends Physiolibraryold.Utilities.DynamicState;
      parameter Real MINUTE_FLOW_TO_MASS_CONVERSION = 1
        "this constant will multiply the flow inside integration to mass";
      Physiolibraryold.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (Placement(transformation(extent={{62,-32},{102,8}}),
            iconTransformation(extent={{-10,-10},{10,10}})));
      parameter SoluteMass initialSoluteMass;
      Physiolibraryold.Interfaces.RealOutput_ soluteMass(start=
            initialSoluteMass) annotation (Placement(transformation(
            extent={{-14,-120},{26,-80}},
            rotation=-90,
            origin={0,2}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-74})));
    //initial equation
    //  soluteMass = initialSoluteMass;
    equation
      q_out.conc = soluteMass;
      //der(soluteMass) = q_out.q / Library.SecPerMin;
      stateValue = soluteMass;
      changePerMin = q_out.q * MINUTE_FLOW_TO_MASS_CONVERSION;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={Bitmap(extent={{-100,100},{100,-100}}, fileName=
                  "icons/massStorage.png"), Text(
              extent={{-94,134},{98,106}},
              lineColor={0,0,255},
              textString="%name")}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end MassStorageCompartment;

    model ConcentrationCompartmentWithStaticInternalConcentration
      extends Physiolibraryold.Utilities.DynamicState;
      NegativeConcentrationFlow q
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-4,-12},{16,8}}), iconTransformation(extent=
               {{-4,-12},{16,8}})));
      parameter Real initialMass = 0;
      Modelica.Blocks.Interfaces.RealInput volume           annotation (extent = [-110,30;-90,50],
          Placement(transformation(extent={{-110,-10},{-90,10}})));
      Modelica.Blocks.Interfaces.RealOutput concentration
        annotation (Placement(transformation(extent={{-10,-110},{10,-90}}, rotation=-90)));
      Modelica.Blocks.Interfaces.RealInput staticConcentration     annotation (extent = [-110,30;-90,50],
          Placement(transformation(extent={{-10,90},{10,110}},rotation=-90)));
      Real mass;
    initial equation
      mass = initialMass;
    equation
      der(mass) =  q.q;
      concentration = (mass/volume);
      q.concentration = staticConcentration*concentration;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={Bitmap(extent={{-100,100},{100,-100}}, fileName=
                  "icons/concentrationCompartement.png"), Text(
              extent={{-22,-102},{220,-136}},
              lineColor={0,0,255},
              textString="%name")}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ConcentrationCompartmentWithStaticInternalConcentration;

    model ConcentrationCompartmentWithStaticInternalConcentration2
      extends Physiolibraryold.Utilities.DynamicState;
      //extends QHP.Library.Interfaces.BaseModel;
      Physiolibraryold.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (Placement(transformation(extent={{-20,-20},{20,20}}),
            iconTransformation(extent={{-10,-10},{10,10}})));
      parameter Real initialSoluteMass;
      Physiolibraryold.Interfaces.RealInput_ SolventVolume(final quantity=
            "Volume", final unit="ml") annotation (Placement(transformation(
              extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-140,-22},
                {-100,18}})));
      Physiolibraryold.Interfaces.RealOutput_ soluteMass(start=
            initialSoluteMass) annotation (Placement(transformation(
            extent={{-20,-120},{20,-80}},
            rotation=-90,
            origin={100,-100}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={6,-120})));
      Physiolibraryold.Interfaces.RealInput_ staticConcentration annotation (
          extent=[-110,30; -90,50], Placement(transformation(extent={{-10,90},{
                10,110}}, rotation=-90)));
    //initial equation
    //  soluteMass = initialSoluteMass;
    equation
        q_out.conc = staticConcentration* (if (SolventVolume>0) then soluteMass / SolventVolume else 0);
    //    q_out.conc = staticConcentration*q_out.conc;
    //  q_out.conc = if initial() or (SolventVolume>0) then soluteMass / SolventVolume else 0;
    //  der(soluteMass) = q_out.q / Library.SecPerMin;
      stateValue = soluteMass;
      changePerMin = q_out.q;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={Bitmap(extent={{-100,100},{100,-100}}, fileName=
                  "icons/concentrationCompartement.png"), Text(
              extent={{-22,-102},{220,-136}},
              lineColor={0,0,255},
              textString="%name")}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ConcentrationCompartmentWithStaticInternalConcentration2;

    model SolventFlowPump_InitialPatch
      Physiolibraryold.ConcentrationFlow.NegativeConcentrationFlow q_out
        "second side connector with value of q (solute mass flow) and conc (concentration)"
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{90,-10},{110,10}})));
      Interfaces.RealInput_ solventFlow
        "solvent flow (solution volume flow = solventFlow + solute volume flow)"
                                    annotation ( extent = [-10,50;10,70], rotation = -90);
      Physiolibraryold.ConcentrationFlow.PositiveConcentrationFlow q_in
        "first side connector with value of q (solute mass flow) and conc (concentration)"
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
    equation
      q_in.q + q_out.q = 0;
      q_in.q = solventFlow*q_in.conc;
     // assert(solventFlow < 0, "BAD FLOW DIRECTION !!!");
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-100},{150,-60}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2009</td>
</tr>
</table>
</html>",     info="<html>
<p><h4><font color=\"#008000\">Bidirectional mass flow by concentration</font></h4></p>
<p>Possible field values: </p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0.1\"><tr>
<td></td>
<td><p align=\"center\">forward flow</p></td>
<td><p align=\"center\">backward flow</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>solventFlow</h4></p></td>
<td><p align=\"center\">&GT;=0</p></td>
<td><p align=\"center\">&LT;0</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>q_in.q</h4></p></td>
<td><p align=\"center\">=solventFlow*q_in.conc</p></td>
<td><p align=\"center\">=solventFlow*q_out.conc</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>q_out.q</h4></p></td>
<td><p align=\"center\">=-q_in.q</p></td>
<td><p align=\"center\">=-q_in.q</p></td>
</tr>
</table>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end SolventFlowPump_InitialPatch;

    model SolventFlowToConcentraton
      Physiolibraryold.ConcentrationFlow.NegativeConcentrationFlow q_out
        "second side connector with unknown value of conc (concentration)"
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{90,-10},{110,10}})));
      Interfaces.RealInput_ solventFlow
        "solvent flow (solution volume flow = solventFlow + solute volume flow)"
                                    annotation ( extent = [-10,50;10,70], rotation = -90);
      Physiolibraryold.ConcentrationFlow.PositiveConcentrationFlow q_in
        "first side connector with known value of q (solute mass flow)"
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
            iconTransformation(extent={{-110,-10},{-90,10}})));
    equation
      if (solventFlow>=0) then
        q_in.q + q_out.q = 0;
        q_in.q = solventFlow*q_out.conc;
      else
        q_in.q + q_out.q = 0;
        q_out.q = solventFlow*q_in.conc;
      end if;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,25},{16,0},{-80,-25},{-80,25}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-100},{150,-60}},
              textString="%name",
              lineColor={0,0,255}),
            Ellipse(
              extent={{74,22},{24,-22}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
                                      Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2009</td>
</tr>
</table>
</html>",     info="<html>
<p><h4><font color=\"#008000\">Bidirectional mass flow by concentration</font></h4></p>
<p>Possible field values: </p>
<table cellspacing=\"2\" cellpadding=\"0\" border=\"0.1\"><tr>
<td></td>
<td><p align=\"center\">forward flow</p></td>
<td><p align=\"center\">backward flow</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>solventFlow</h4></p></td>
<td><p align=\"center\">&GT;=0</p></td>
<td><p align=\"center\">&LT;0</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>q_in.q</h4></p></td>
<td><p align=\"center\">=solventFlow*q_in.conc</p></td>
<td><p align=\"center\">=solventFlow*q_out.conc</p></td>
</tr>
<tr>
<td><p align=\"center\"><h4>q_out.q</h4></p></td>
<td><p align=\"center\">=-q_in.q</p></td>
<td><p align=\"center\">=-q_in.q</p></td>
</tr>
</table>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end SolventFlowToConcentraton;

    package old
      model ConcentrationCompartment_unknown
        extends Physiolibraryold.Utilities.DynamicState;
        // extends QHP.Library.Interfaces.BaseModel;
        Physiolibraryold.ConcentrationFlow.NegativeConcentrationFlow q_out
          annotation (Placement(transformation(extent={{62,-32},{102,8}}),
              iconTransformation(extent={{-10,-10},{10,10}})));
        Physiolibraryold.Interfaces.RealInput_ SolventVolume(final quantity=
              "Volume", final unit="ml") annotation (Placement(transformation(
                extent={{-120,68},{-80,108}}), iconTransformation(extent={{-120,
                  60},{-80,100}})));
        Physiolibraryold.Interfaces.RealOutput_ soluteMass annotation (
            Placement(transformation(extent={{-20,-120},{20,-80}}),
              iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={0,-78})));
      equation
        q_out.conc*SolventVolume = soluteMass;
      //  der(soluteMass) = q_out.q / Library.SecPerMin;
        stateValue = soluteMass;
        changePerMin = q_out.q;
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics), Icon(coordinateSystem(
                preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
              graphics={Bitmap(extent={{-100,100},{100,-100}}, fileName=
                    "icons/concentrationCompartement.png"), Text(
                extent={{20,-58},{212,-86}},
                lineColor={0,0,255},
                textString="%name")}),
          Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end ConcentrationCompartment_unknown;

      model ConcentrationCompartment_knownConc
         extends ConcentrationCompartment_unknown(
            q_out(conc(start=concentration)));
         parameter Concentration concentration;
      initial equation
        //if there is not initialization from file or steady state calculation
        if initType == Library.Utilities.Init.NoInit then
            q_out.conc = concentration;
        end if;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                extent={{-100,38},{100,60}},
                lineColor={0,0,0},
                fillPattern=FillPattern.VerticalCylinder,
                fillColor={215,215,215},
                textString="%concentration")}), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
      end ConcentrationCompartment_knownConc;
    end old;

    model HomotopyConstConcentrationOut
      parameter Real defaultConcentration = 0.001;
      Physiolibraryold.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (extent=[-10,-110; 10,-90], Placement(transformation(extent=
                {{18,-10},{38,10}}), iconTransformation(extent={{30,-10},{50,10}})));
      Physiolibraryold.ConcentrationFlow.PositiveConcentrationFlow q_in
        annotation (Placement(transformation(extent={{-120,-20},{-80,20}}),
            iconTransformation(extent={{-50,-10},{-30,10}})));
    equation
      q_in.q + q_out.q = 0;
      q_out.conc = homotopy(q_in.conc,defaultConcentration);
     // actualFlow = q_in.q;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-40,30},{40,-30}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
                                      Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end HomotopyConstConcentrationOut;

    model Ex_Natrium "Na - sodik, sodium"
      Physiolibraryold.ConcentrationFlow.ConcentrationCompartment extraceluarSodium(
          initialSoluteMass=2136)
        annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
      Physiolibraryold.ConcentrationFlow.SoluteFlowPump outtake annotation (
          Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={50,0})));
      Physiolibraryold.ConcentrationFlow.SoluteFlowPump intake annotation (
          Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={10,0})));
      Physiolibraryold.ConcentrationFlow.UnlimitedStorage unlimitedStorage(
          concentration=0)
        annotation (Placement(transformation(extent={{20,60},{40,80}})));
      Modelica.Blocks.Math.Gain NID(k=0.1)
        annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
      Physiolibraryold.ConcentrationFlow.ConcentrationMeasure concentrationMeasure
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={50,-50})));
    Interfaces.RealInput STH
      annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
    Interfaces.RealInput VEC
      annotation (Placement(transformation(extent={{-100,-74},{-80,-54}})));
    Interfaces.RealInput NOD annotation (Placement(transformation(
          extent={{-10,-10},{10,10}},
          rotation=180,
          origin={90,0})));
    Interfaces.RealOutput CNA
      annotation (Placement(transformation(extent={{70,-60},{90,-40}})));
    equation
      connect(outtake.q_out, unlimitedStorage.q_out)        annotation (Line(
          points={{50,10},{50,70},{30.2,70}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(intake.q_in, unlimitedStorage.q_out)          annotation (Line(
          points={{10,10},{10,70},{30.2,70}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(intake.q_out, extraceluarSodium.q_out)
        annotation (Line(
          points={{10,-10},{10,-70},{30,-70}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(NID.y, intake.soluteFlow)          annotation (Line(
          points={{-19,0},{-7.5,0},{-7.5,1.10218e-015},{4,1.10218e-015}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(outtake.q_in, concentrationMeasure.q_in) annotation (Line(
          points={{50,-10},{50,-50}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(concentrationMeasure.q_in, extraceluarSodium.q_out) annotation (
          Line(
          points={{50,-50},{50,-70},{30,-70}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
    connect(NID.u, STH) annotation (Line(
        points={{-42,0},{-90,0}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(VEC, extraceluarSodium.SolventVolume) annotation (Line(
        points={{-90,-64},{22,-64}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(outtake.soluteFlow, NOD) annotation (Line(
        points={{56,-3.67394e-016},{69,-3.67394e-016},{69,0},{90,0}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(concentrationMeasure.actualConc, CNA) annotation (Line(
        points={{54,-50},{80,-50}},
        color={0,0,127},
        smooth=Smooth.None));
      annotation (Diagram(graphics), Icon(graphics={Bitmap(extent={{-100,100},{
                  100,-100}}, fileName=
                  "modelica://icons/Na.jpg")}),
        experiment(StopTime=86400),
        __Dymola_experimentSetupOutput);
    end Ex_Natrium;

    model Ex_Natrium_EC "Na - sodik, sodium"
      Physiolibraryold.ConcentrationFlow.ConcentrationCompartment extraceluarSodium(
          initialSoluteMass=2136)
        annotation (Placement(transformation(extent={{20,-80},{40,-60}})));
      Physiolibraryold.ConcentrationFlow.SoluteFlowPump outtake annotation (
          Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=90,
            origin={50,0})));
      Physiolibraryold.ConcentrationFlow.SoluteFlowPump intake annotation (
          Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={10,0})));
      Physiolibraryold.ConcentrationFlow.UnlimitedStorage unlimitedStorage(
          concentration=0)
        annotation (Placement(transformation(extent={{20,60},{40,80}})));
      Modelica.Blocks.Math.Gain NID(k=0.1)
        annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
      Physiolibraryold.Interfaces.BusConnector busConnector annotation (
          Placement(transformation(extent={{60,-100},{80,-80}}),
            iconTransformation(extent={{80,-100},{100,-80}})));
      Physiolibraryold.ConcentrationFlow.ConcentrationMeasure concentrationMeasure
        annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=270,
            origin={50,-50})));
    equation
      connect(outtake.q_out, unlimitedStorage.q_out)        annotation (Line(
          points={{50,10},{50,70},{30.2,70}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(intake.q_in, unlimitedStorage.q_out)          annotation (Line(
          points={{10,10},{10,70},{30.2,70}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(intake.q_out, extraceluarSodium.q_out)
        annotation (Line(
          points={{10,-10},{10,-70},{30,-70}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(NID.y, intake.soluteFlow)          annotation (Line(
          points={{-19,0},{-7.5,0},{-7.5,1.10218e-015},{4,1.10218e-015}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector.NOD, outtake.soluteFlow)        annotation (Line(
          points={{70,-90},{70,-3.67394e-016},{56,-3.67394e-016}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.VEC, extraceluarSodium.SolventVolume)
        annotation (Line(
          points={{70,-90},{0,-90},{0,-64},{22,-64}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(busConnector.STH, NID.u) annotation (Line(
          points={{70,-90},{-70,-90},{-70,0},{-42,0}},
          color={0,0,255},
          thickness=0.5,
          smooth=Smooth.None), Text(
          string="%first",
          index=-1,
          extent={{-6,3},{-6,3}}));
      connect(outtake.q_in, concentrationMeasure.q_in) annotation (Line(
          points={{50,-10},{50,-50}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(concentrationMeasure.q_in, extraceluarSodium.q_out) annotation (
          Line(
          points={{50,-50},{50,-70},{30,-70}},
          color={200,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(concentrationMeasure.actualConc, busConnector.CNA) annotation (
          Line(
          points={{54,-50},{70,-50},{70,-90}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      annotation (Diagram(graphics), Icon(graphics={Bitmap(extent={{-100,100},{
                  100,-100}}, fileName=
                  "modelica://icons/Na.jpg")}),
        experiment(StopTime=86400),
        __Dymola_experimentSetupOutput);
    end Ex_Natrium_EC;

    model FastReaction "Fast Chemical Reaction"
      parameter Real TK(unit="K")=273.15+20
        "temperature of disociation constant";
      parameter Real dH(unit="J/mol")=0
        "enthalpy change for Hoff's equation to correct disociation constant to actual temperature";
      parameter Integer nS=1 "number of substrates types";
      parameter Integer nP=1 "number of products types";
      parameter Real aS[nS]=ones(nS)
        "stochastic reaction coeficients for substrate";
      parameter Real aP[nP]=ones(nP)
        "stochastic reaction coeficients for substrate";
      parameter Real rateLevel = 8 "reaction rate is 10^rateLevel";
      parameter Boolean STEADY_RIP=false
        "Recommendated setting is false, instead of one freely chosen instance in StateSystem, where it is set to the system STEADY flag.";
      Real KaT "dissociation constant in actual temperature";
      Physiolibraryold.ConcentrationFlow.NegativeConcentrationFlow products[nP]
        "products of this chemical reaction equilibrium" annotation (extent=[-10,
            -110; 10,-90], Placement(transformation(extent={{90,-10},{110,10}}),
            iconTransformation(extent={{90,-10},{110,10}})));
      Physiolibraryold.ConcentrationFlow.PositiveConcentrationFlow substrates[nS]
        "products of this chemical reaction equilibrium" annotation (Placement(
            transformation(extent={{-120,-20},{-80,20}}), iconTransformation(
              extent={{-110,-10},{-90,10}})));
      Real rr "reaction rate";
      Modelica.Blocks.Interfaces.RealInput K "dissociation constant"
                                             annotation (Placement(transformation(
              extent={{-12,28},{28,68}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-20,40})));
      Modelica.Blocks.Interfaces.RealInput T(unit="K") "temperatureInKelvin" annotation (Placement(
            transformation(extent={{10,30},{50,70}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={40,40})));
    equation
      //in chemical equilibrium (steady state) it define the dissociation constant KaT: KaT=product(products.conc.^aP)/product(substrates.conc.^aS);
      rr = (10^rateLevel)*(KaT*product(substrates.conc.^aS) - product(products.conc.^aP));
      KaT = K * 10^(Modelica.Math.log(10)*((-dH)/Modelica.Constants.R)*(1/T - 1/TK));  //Hoff's equation
      rr*aP = -products.q;
      if STEADY_RIP then
          //calculation of steady state: one equation (usually: the sum of all mass = const) is added for the whole upper system, so this one unnecessery equation must be removed
            for i in 2:nS loop
              substrates.q[i]=rr*aS[i];
            end for;
      else
         rr*aS = substrates.q;
      end if;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                            graphics={
            Rectangle(
              extent={{-100,-30},{100,30}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-128,-66},{142,-40}},
              textString="%name",
              lineColor={0,0,255}),
            Polygon(
              points={{-60,4},{-60,2},{54,2},{54,2},{18,12},{18,4},{-60,4}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{54,-2},{54,0},{-60,0},{-60,0},{-24,-10},{-24,-2},{54,-2}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}),
                                      Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",     info="<html>
<pre>Calculate almoust&nbsp;continual&nbsp;changes&nbsp;(substrate/product&nbsp;flows)&nbsp;to&nbsp;stay&nbsp;in&nbsp;equilibrium&nbsp;of&nbsp;chemical&nbsp;reaction.</pre>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end FastReaction;

    model NormalizedConcentrationCompartment
      "concentration compartment normalized to solvent volume = 1"
      extends Physiolibraryold.Utilities.DynamicState;
      //extends QHP.Library.Interfaces.BaseModel;
      Physiolibraryold.ConcentrationFlow.NegativeConcentrationFlow q_out
        annotation (Placement(transformation(extent={{62,-32},{102,8}}),
            iconTransformation(extent={{-10,-10},{10,10}})));
      parameter Real initialSoluteMass;
      Physiolibraryold.Interfaces.RealOutput_ soluteMass(start=
            initialSoluteMass) annotation (Placement(transformation(
            extent={{-20,-120},{20,-80}},
            rotation=-90,
            origin={102,-102}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-78})));                                                 //, min=0)
      constant Real NormalSolventVolume=1;
    //initial equation
    //  soluteMass = initialSoluteMass;
    equation
      //assert(soluteMass>=0,"Solute mass has to be positive value!");
        q_out.conc = soluteMass / NormalSolventVolume;
    //  q_out.conc = if initial() or (SolventVolume>0) then soluteMass / SolventVolume else 0;
    //  der(soluteMass) = q_out.q / Library.SecPerMin;
      stateValue = soluteMass;
      changePerMin = q_out.q;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
            graphics={Bitmap(extent={{-100,100},{100,-100}}, fileName=
                  "icons/concentrationCompartement.png"), Text(
              extent={{-22,-102},{220,-136}},
              lineColor={0,0,255},
              textString="%name")}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end NormalizedConcentrationCompartment;

    model FastAcidReaction
      "Fast Chemical Reaction hacked to acid reaction with [H+], wich nominal are 10^(-7.4)"
      parameter Real TK(unit="K")=273.15+20
        "temperature of disociation constant";
      parameter Real dH(unit="J/mol")=0
        "enthalpy change for Hoff's equation to correct disociation constant to actual temperature";
      parameter Integer nS=1 "number of substrates types";
      parameter Integer nP=1 "number of non-H+ products types";
      parameter Real aS[nS]=ones(nS)
        "stochastic reaction coeficients for substrate";
      parameter Real aP[nP]=ones(nP)
        "stochastic reaction coeficients for substrate";
      parameter Real rateLevel = 8 "reaction rate is 10^rateLevel";
      parameter Boolean STEADY_RIP=false
        "Recommendated setting is false, instead of one freely chosen instance in StateSystem, where it is set to the system STEADY flag.";
      Real pKaT "dissociation constant in actual temperature";
      Physiolibraryold.ConcentrationFlow.NegativeConcentrationFlow products[nP]
        "products of this chemical reaction equilibrium" annotation (extent=[-10,
            -110; 10,-90], Placement(transformation(extent={{90,10},{110,30}}),
            iconTransformation(extent={{90,10},{110,30}})));
      Physiolibraryold.ConcentrationFlow.PositiveConcentrationFlow substrates[nS]
        "products of this chemical reaction equilibrium" annotation (Placement(
            transformation(extent={{-120,-20},{-80,20}}), iconTransformation(
              extent={{-110,-10},{-90,10}})));
      Real rr "reaction rate";
      Modelica.Blocks.Interfaces.RealInput pK "dissociation constant"
                                             annotation (Placement(transformation(
              extent={{-12,28},{28,68}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-20,40})));
      Modelica.Blocks.Interfaces.RealInput T(unit="K") "temperatureInKelvin" annotation (Placement(
            transformation(extent={{10,30},{50,70}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={40,40})));
      Modelica.Blocks.Interfaces.RealInput pH(unit="log10(mol)") "acidity"   annotation (Placement(
            transformation(extent={{-20,-20},{20,20}},
            rotation=180,
            origin={100,-36}),                        iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={100,-40})));
    equation
      //in chemical equilibrium (steady state) it define the dissociation constant KaT: KaT=product(products.conc.^aP)/product(substrates.conc.^aS);
      rr = (10^rateLevel)*((10^(pH-pKaT))*product(substrates.conc.^aS) - product(products.conc.^aP));
      pKaT = pK - (Modelica.Math.log(10)*((-dH)/Modelica.Constants.R)*(1/T - 1/TK));  //Hoff's equation
      rr*aP = -products.q;
      if STEADY_RIP then
          //calculation of steady state: one equation (usually: the sum of all mass = const) is added for the whole upper system, so this one unnecessery equation must be removed
            for i in 2:nS loop
              substrates.q[i]=rr*aS[i];
            end for;
      else
         rr*aS = substrates.q;
      end if;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
              100,100}}),   graphics={
            Rectangle(
              extent={{-100,-40},{100,30}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-128,-66},{142,-40}},
              textString="%name",
              lineColor={0,0,255}),
            Polygon(
              points={{-58,-2},{-58,-4},{56,-4},{56,-4},{20,6},{20,-2},{-58,-2}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{56,-8},{56,-6},{-58,-6},{-58,-6},{-22,-16},{-22,-8},{56,
                -8}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}),
                                      Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",     info="<html>
<pre>Calculate almoust&nbsp;continual&nbsp;changes&nbsp;(substrate/product&nbsp;flows)&nbsp;to&nbsp;stay&nbsp;in&nbsp;equilibrium&nbsp;of&nbsp;chemical&nbsp;reaction.</pre>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end FastAcidReaction;
  end ConcentrationFlow;

  package ControledFlow
  connector PositiveFlow =
                        flow Real "'flow Real' as connector"
    annotation (defaultComponentName="u",
    Icon(graphics={Polygon(
            points={{-100,100},{100,20},{100,-20},{-100,-100},{-60,0},{-100,
                100}},
            lineColor={0,0,127},
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid)},
         coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
    Diagram(coordinateSystem(
          preserveAspectRatio=true, initialScale=0.2,
          extent={{-100,-100},{100,100}},
          grid={1,1}), graphics={Polygon(
            points={{0,50},{100,10},{100,-10},{0,-50},{30,0},{0,50}},
            lineColor={0,0,127},
            fillColor={0,0,127},
            fillPattern=FillPattern.Solid), Text(
            extent={{-10,85},{-10,60}},
            lineColor={0,0,127},
            textString="%name")}),
      Documentation(info="<html>
<p>
Connector with one input signal of type Real.
</p>
</html>"));
  connector NegativeFlow =
                        flow Real "'flow Real' as connector"
    annotation (defaultComponentName="u",
    Icon(graphics={Polygon(
            points={{-100,100},{100,20},{100,-20},{-100,-100},{-60,0},{-100,
                100}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)},
         coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
    Diagram(coordinateSystem(
          preserveAspectRatio=true, initialScale=0.2,
          extent={{-100,-100},{100,100}},
          grid={1,1}), graphics={Polygon(
            points={{0,50},{100,10},{100,-10},{0,-50},{30,0},{0,50}},
            lineColor={0,0,127},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid), Text(
            extent={{-10,85},{-10,60}},
            lineColor={0,0,127},
            textString="%name")}),
      Documentation(info="<html>
<p>
Connector with one input signal of type Real.
</p>
</html>"));
    model Cumulation
      PositiveFlow q_in     annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-10},{-90,10}})));
      NegativeFlow q_out     annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,-10},{110,10}})));
      Modelica.Blocks.Interfaces.RealOutput state annotation ( extent = [-10,-90;10,-110], rotation = 90);
    parameter Real initialState;
    initial equation
     state = initialState;
    equation
      der(state) = q_in + q_out;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-144,94},{156,134}},
              textString="%name",
              lineColor={0,0,255})}),
                  Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end Cumulation;

    model CumulationEnd
      PositiveFlow q_in     annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-10},{-90,10}})));
      Modelica.Blocks.Interfaces.RealOutput state annotation ( extent = [-10,-90;10,-110], rotation = 90);
      parameter Real initialState;
    initial equation
     state = initialState;
    equation
      der(state) = q_in;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-144,94},{156,134}},
              textString="%name",
              lineColor={0,0,255})}),
                  Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end CumulationEnd;

    model UnlimitedSource
      NegativeFlow q_out     annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,-10},{110,10}})));
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-144,94},{156,134}},
              textString="%name",
              lineColor={0,0,255})}),
                  Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end UnlimitedSource;

    model FiltrationFromFlow
      Interfaces.RealInput q_in
        "saturation in blood flow [saturation increase per time]"
                            annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-10},{-90,10}})));
      Interfaces.RealOutput q_out
        "saturation in blood flow [saturation increase per time]"
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,-10},{110,10}})));
      Modelica.Blocks.Interfaces.RealInput desiredFlowValue annotation ( extent = [-30,50;-10,70], rotation = -90);
      Modelica.Blocks.Interfaces.RealInput saturation2VolumeCoef annotation ( extent = [10,50;30,70], rotation = -90);
      NegativeFlow filtration "flow [volume per time]"
                              annotation (Placement(transformation(extent={{-16,-68},{24,-28}}),
            iconTransformation(extent={{-8,-60},{10,-42}}, rotation=-90)));
    equation
      q_out = q_in - filtration/(saturation2VolumeCoef * desiredFlowValue);
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,37},{80,12},{-80,-13},{-80,37}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{8,-90},{222,-50}},
              textString="%name",
              lineColor={0,0,255}),
            Rectangle(extent={{-40,-28},{42,-38}}, lineColor={0,0,255})}), Diagram(
            coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
                100,100}}),
                        graphics),
                  Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end FiltrationFromFlow;

    model Sink
     extends Modelica.Blocks.Interfaces.BlockIcon;
      PositiveFlow q_in     annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-10},{-90,10}})));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end Sink;
  end ControledFlow;

  package HeatFlow "Temperature Physical Domain"
    connector HeatFlowConnector "Heat flow connector"
      Real T(final unit="K") "temperature";
      flow Real q(final unit="kCal/min") "heat flow";
      annotation (Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end HeatFlowConnector;

    connector PositiveHeatFlow "Heat inflow"
      extends Physiolibraryold.HeatFlow.HeatFlowConnector;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-18,10},{22,-10}},
              lineColor={255,128,0},
              lineThickness=1), Ellipse(
              extent={{-100,100},{100,-100}},
              lineColor={176,88,0},
              fillColor={255,128,0},
              fillPattern=FillPattern.Solid)}), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end PositiveHeatFlow;

    connector NegativeHeatFlow "Heat outflow"
      extends Physiolibraryold.HeatFlow.HeatFlowConnector;
    annotation (
        defaultComponentName="q_out",
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20],
          scale=0.2),
        Icon(coordinateSystem(extent={{-100,-100},{100,100}},
              preserveAspectRatio=true),                      Polygon(points=[-100,0;
                0,100; 100,0; 0,-100; -100,0],            style(
              color=74,
              rgbcolor={200,200,0},
              fillColor=0,
              rgbfillColor={255,240,240})),
          graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={255,128,0},
              lineThickness=1), Ellipse(
              extent={{-100,100},{100,-100}},
              lineColor={176,88,0},
              fillColor={255,170,85},
              fillPattern=FillPattern.Solid)}),
        Diagram(Polygon(points=[-21,-3; 5,23; 31,-3; 5,-29; -21,-3],   style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={255,255,255})), Text(
            extent=[-105,-38; 115,-83],
            string="%name",
            style(color=0, rgbcolor={0,0,0}))),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>",
        revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end NegativeHeatFlow;

    partial model ResistorBase
     extends Physiolibraryold.Icons.Resistor;
      PositiveHeatFlow q_in annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-10},{-90,10}})));
      NegativeHeatFlow q_out annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,-10},{110,10}})));
    //Real ActualConductance;
    equation
    //  ActualConductance = if (q_in.T == q_out.T) then 0 else q_in.q/(q_in.T - q_out.T);
      annotation (Icon(graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ResistorBase;

    partial model Resistor
     extends ResistorBase;
    equation
      q_in.q + q_out.q = 0;
      annotation (Icon(graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Resistor;

    model ResistorWithCond
     extends Resistor;
      Physiolibraryold.Interfaces.RealInput_ cond(final quantity="Conductance",
          final unit="kCal/(min.K)")
        annotation (extent=[-5,30; 5,50], rotation=-90);
    equation
      q_in.q = cond * (q_in.T - q_out.T);
      annotation (Icon(graphics={Text(
              extent={{-70,-30},{70,30}},
              textString="%name",
              lineColor={0,0,255})}), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ResistorWithCond;

    model ResistorWithCondParam
     extends Resistor;
     parameter Real cond;
    equation
      q_in.q = cond * (q_in.T - q_out.T);
      annotation (Icon(graphics={Text(
              extent={{-70,-8},{70,10}},
              lineColor={0,0,0},
              textString="%cond (kcal/min)/K")}),
                                      Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                        graphics));
    end ResistorWithCondParam;

    model HeatFlux "flow circuit through mass with different temperature"
      NegativeHeatFlow q_out "surrounding mass" annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-10,-60},{10,-40}}), iconTransformation(extent={
                {-10,-60},{10,-40}})));
      Interfaces.RealInput_ substanceFlow(final unit="kg/min")
        "flowing speed in circuit"  annotation ( extent = [-10,50;10,70], rotation = -90);
      PositiveHeatFlow q_in "flow circuit"     annotation (Placement(
            transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent=
               {{-110,-10},{-90,10}})));
    parameter Real specificHeat(unit="kCal/kg/K") "of flow circuit medium";
    equation
      q_in.q + q_out.q = 0;
      q_in.q = substanceFlow*(q_in.T-q_out.T)*specificHeat;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{20,-84},{320,-44}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end HeatFlux;

    model HeatOutflow
      "heat outflow through vaporization and outflowing heatted steam"
      Interfaces.RealInput_ liquidOutflow(final unit="kg/min")
        "speed of vaporization"  annotation ( extent = [-10,50;10,70], rotation = -90);
      PositiveHeatFlow q_in "flow circuit"     annotation (Placement(
            transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent=
               {{-110,-10},{-90,10}})));
    parameter Real TempToolsVapor(final unit="kCal/kg") = 580.0
        "needed heat to vaporization";
    parameter Real specificHeat(final unit="kCal/kg/K") = 1 "of liquid";
    equation
      q_in.q = liquidOutflow*(q_in.T*specificHeat + TempToolsVapor);
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{20,-84},{320,-44}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end HeatOutflow;

    model InputPump
      NegativeHeatFlow q_out annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,-10},{110,10}}), iconTransformation(extent={
                {50,-10},{70,10}})));
      Physiolibraryold.Interfaces.RealInput_ desiredFlow "speed of heat flow"
        annotation (extent=[-10,30; 10,50], rotation=-90);
    equation
      q_out.q = - desiredFlow;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-60,-30},{60,30}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-48,20},{50,0},{-48,-21},{-48,20}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-92,-54},{80,-30}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end InputPump;

    model HeatAccumulation
      "accumulating heat to substance mass with specific heat constant"
      extends Physiolibraryold.Utilities.DynamicState;
      extends Interfaces.BaseModel;
      PositiveHeatFlow q_in "heat inflow/outflow connector"
        annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
                            //(T(start=initialTemperature))
      parameter Real initialHeatMass
        "=weight[kg]*initialTemperature[K]*(specificHeat[kCal/kg/K])";
    //  parameter Real initialTemperature(final unit="K")=310.15
    //    "to calculate initial heat";                                                        //==37 degC
      parameter Real specificHeat(final unit="kCal/kg/K")=1
        "of the mass, where the heat are accumulated";
    //  Real heatMass(start=weight*specificHeat*initialTemperature, final unit="kCal")
      Real heatMass(start=initialHeatMass, final unit="kCal")
        "accumulated heat";
      Real T_degC(final unit="degC") "temperature in celsius degrees";
      Interfaces.RealInput_ weight(final unit="kg")
        "weight of mass, where the heat are accumulated"                            annotation (Placement(transformation(extent={{-122,60},
                {-82,100}}), iconTransformation(extent={{-120,60},{-80,100}})));
      Interfaces.RealOutput_ T(unit="degC") annotation (Placement(transformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-100})));
    //initial equation
    //  heatMass=weight*specificHeat*initialTemperature;
    equation
    //  der(heatMass)=q_in.q/Library.SecPerMin;
      q_in.T=heatMass/(weight*specificHeat);
      T_degC = q_in.T - 273.15;
      T=T_degC;
      stateValue = heatMass;
      changePerMin = q_in.q;
      annotation (Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),
         Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end HeatAccumulation;

    model AmbientTemperature "constant temperature, undefinned heat flow"
      extends Interfaces.BaseModel;
      PositiveHeatFlow q_in "heat inflow/outflow connector"
        annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
      parameter Real Temperature(final unit="K")=295.37
        "to calculate initial heat";
                                                              //==22 degC
      Real T_degC(final unit="degC") "temperature in celsius degrees";
    equation
      q_in.T=Temperature;
      T_degC = q_in.T - 273.15;
      annotation (Icon(graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end AmbientTemperature;

    model Pump
      NegativeHeatFlow q_out annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,-10},{110,10}}), iconTransformation(extent={
                {50,-10},{70,10}})));
      Physiolibraryold.Interfaces.RealInput_ desiredFlow(unit="ml/min")
        "speed of liquid flow" annotation (extent=[-10,30; 10,50], rotation=-90);
      PositiveHeatFlow q_in
        annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
      parameter Real specificHeat(unit="kCal/ml/K") "of flow circuit medium";
    equation
      q_in.q + q_out.q = 0;
      q_in.q = specificHeat * q_in.T * desiredFlow;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-60,-30},{60,30}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-48,20},{50,0},{-48,-21},{-48,20}},
              lineColor={255,0,0},
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-92,-54},{80,-30}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end Pump;

    model OutputPump
      Physiolibraryold.Interfaces.RealInput_ desiredFlow(unit="ml/min")
        "speed of liquid flow" annotation (extent=[-10,30; 10,50], rotation=-90);
      PositiveHeatFlow q_in
        annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
      parameter Real specificHeat(unit="kCal/ml/K") "of flow circuit medium";
    equation
      q_in.q = specificHeat * q_in.T * desiredFlow;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-60,-30},{60,30}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-48,20},{50,0},{-48,-21},{-48,20}},
              lineColor={255,0,0},
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-92,-54},{80,-30}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end OutputPump;
  end HeatFlow;

  package PressureFlow "Hydraulic Physical Domain"
    connector PressureFlow "Pressure[mmHg] and Flow[ml/min]"
      Real pressure( final quantity="Pressure", final unit="mmHg");
      flow Real q( final quantity="Flow", final unit="ml/min") "flow";
      annotation (Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague, Czech Republic</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
</table>
</html>",
        info="<html>
<p><font style=\"font-size: 9pt; \">This connector connects hydraulic domains elements. The elements contains one equation for each his pressure-flow connector. The equation defines relation between variables in the connector. Variables are hydraulic pressure and volume flow of hydraulic medium. The pressure is the same in each connector that are connected together. The sum of flow in connectors connected together is zero (</font><b><font style=\"font-size: 9pt; \">Kirchhoff&apos;s circuit laws</font></b><font style=\"font-size: 9pt; \">).</font> </p>
</html>"));
    end PressureFlow;

    connector PositivePressureFlow "Pressure[mmHg] and Inflow[ml/min]"
      extends PressureFlow;
    annotation (
        defaultComponentName="q_in",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={0,0,0},
              lineThickness=1), Polygon(
              points={{0,100},{100,0},{0,-100},{-100,0},{0,100}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillPattern=FillPattern.Solid,
              fillColor={0,0,0})}),
        Diagram(Polygon(points=[-21,-3; 5,23; 31,-3; 5,-29; -21,-3],   style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={0,0,0})), Text(
            extent=[-105,-38; 115,-83],
            string="%name",
            style(color=0, rgbcolor={0,0,0}))));
    end PositivePressureFlow;

    connector NegativePressureFlow
      "Pressure[mmHg] and negative Outflow[ml/min]"
      extends PressureFlow;
    annotation (
        defaultComponentName="q_out",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={0,0,0},
              lineThickness=1), Polygon(
              points={{0,100},{100,0},{0,-100},{-100,0},{0,100}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillPattern=FillPattern.Solid,
              fillColor={200,200,200})}),
        Diagram(Polygon(points=[-21,-3; 5,23; 31,-3; 5,-29; -21,-3],   style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={0,0,0})), Text(
            extent=[-105,-38; 115,-83],
            string="%name",
            style(color=0, rgbcolor={0,0,0}))));
    end NegativePressureFlow;

    model FlowMeasure
      "Convert connector volume flow value to signal flow value"
      NegativePressureFlow q_out
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{18,-10},{38,10}}), iconTransformation(
              extent={{50,-10},{70,10}})));
      PositivePressureFlow q_in annotation (Placement(
            transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-70,-10},
                {-50,10}})));
      Physiolibraryold.Interfaces.RealOutput_ actualFlow(final quantity="Flow",
          final unit="ml/min") annotation (Placement(transformation(extent={{-20,
                30},{20,70}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,54})));
    equation
      q_in.q + q_out.q = 0;
      q_out.pressure = q_in.pressure;
      actualFlow = q_in.q;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Bitmap(extent={{-60,60},{60,-60}},
                fileName="icons/flowMeassure.png")}),
                                      Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end FlowMeasure;

    model PressureMeasure
      "Convert connector hydraulic pressure value to signal flow value"
      Physiolibraryold.PressureFlow.PositivePressureFlow q_in annotation (
          Placement(transformation(extent={{-120,-20},{-80,20}}),
            iconTransformation(extent={{-30,-50},{-10,-30}})));
      Physiolibraryold.Interfaces.RealOutput_ actualPressure annotation (
          Placement(transformation(extent={{-20,30},{20,70}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=0,
            origin={52,-20})));
    equation
      actualPressure = q_in.pressure;
      q_in.q = 0;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Bitmap(extent={{-56,60},{64,-60}},
                fileName="icons/pressureMeassure.png")}),
                                      Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end PressureMeasure;

    partial model ResistorBase "Hydraulic Volume Flow Resistance"
     extends Physiolibraryold.Icons.Resistor;
      PositivePressureFlow q_in
                            annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-10},{-90,10}})));
      NegativePressureFlow q_out
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,-10},{110,10}})));
    //Real ActualConductance;
    equation
    //  ActualConductance = if (- Modelica.Constants.eps < (q_in.pressure - q_out.pressure)) and ( Modelica.Constants.eps > (q_in.pressure - q_out.pressure)) then
    //                         0 else
    //  q_in.q/(q_in.pressure - q_out.pressure);
      annotation (Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague, Czech Republic</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
</table>
</html>",     info="<html>
<p>This hydraulic conductance (resistance) element contains two connector sides. No hydraulic medium volume is changing in this element during simulation. That means that sum of flow in both connector sides is zero. The flow through element is determined by <b>Ohm&apos;s law</b>. It is used conductance (=1/resistance) because it could be numerical zero better then infinity in resistance. </p>
</html>"),     Icon(graphics),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}),
                        graphics));
    end ResistorBase;

    partial model ResistorBase2 "Hydraulic Volume Flow Resistance"
     extends Physiolibraryold.Icons.Resistor;
      PositivePressureFlow q_in
                            annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,-10},{110,10}}), iconTransformation(
              extent={{90,-10},{110,10}})));
      NegativePressureFlow q_out
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-10},{-90,10}}), iconTransformation(
              extent={{-110,-10},{-90,10}})));
    Real ActualConductance;
    equation
      ActualConductance = if (abs(q_in.pressure - q_out.pressure)<Modelica.Constants.small) then 0
                          else q_in.q/(q_in.pressure - q_out.pressure);
      annotation (Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague, Czech Republic</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
</table>
</html>",     info="<html>
<p>This hydraulic conductance (resistance) element contains two connector sides. No hydraulic medium volume is changing in this element during simulation. That means that sum of flow in both connector sides is zero. The flow through element is determined by <b>Ohm&apos;s law</b>. It is used conductance (=1/resistance) because it could be numerical zero better then infinity in resistance. </p>
</html>"),
         Icon(graphics),
        Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                -100},{100,100}}),
                        graphics));
    end ResistorBase2;

    partial model Resistor
     extends ResistorBase;
    equation
      q_in.q + q_out.q = 0;
      annotation (Icon(graphics));
    end Resistor;

    model ResistorWithCond
     extends Resistor;
      Physiolibraryold.Interfaces.RealInput_ cond(final quantity="Conductance",
          final unit="ml/(min.mmHg)")
        annotation (extent=[-5,30; 5,50], rotation=-90);
    equation
      q_in.q = cond * (q_in.pressure - q_out.pressure);
      annotation (Icon(graphics={Text(
              extent={{-70,-30},{70,30}},
              textString="%name",
              lineColor={0,0,255})}));
    end ResistorWithCond;

    model ResistorWithCondParam
     extends Resistor;
     parameter Real cond(  final quantity="Conductance", final unit="ml/(min.mmHg)");
    equation
      q_in.q = cond * (q_in.pressure - q_out.pressure);
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                          graphics), Icon(graphics={
            Text(
              extent={{-70,0},{70,30}},
              lineColor={0,0,0},
              textString="%cond"),
            Text(
              extent={{-134,-90},{154,-30}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{-70,-20},{70,0}},
              lineColor={0,0,0},
              textString="ml/min/mmHg")}));
    end ResistorWithCondParam;

    model OneWayResistorWithCondParam
     extends Resistor;
     parameter Real cond(  final quantity="Conductance", final unit="ml/(min.mmHg)");
     parameter Real zero = 1.E-5;
      Physiolibraryold.Interfaces.RealOutput_ actualFlow(final quantity="Flow",
          final unit="ml/min") annotation (Placement(transformation(extent={{72,
                -48},{112,-8}}), iconTransformation(extent={{70,-32},{94,-8}})));
    equation
      q_in.q = max(cond * (q_in.pressure - q_out.pressure), zero);
      actualFlow = q_in.q;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                -100},{100,100}}),
                          graphics), Icon(graphics={
            Text(
              extent={{-70,-30},{28,30}},
              lineColor={0,0,0},
              textString="%cond"),
            Text(
              extent={{-134,-90},{154,-30}},
              textString="%name",
              lineColor={0,0,255}),
            Line(
              points={{30,30},{30,-30},{70,0},{30,30}},
              color={0,0,255},
              smooth=Smooth.None)}));
    end OneWayResistorWithCondParam;

    model PumpBase "Defined flow to/from/in system by real signal"
      Interfaces.RealInput_ desiredFlow( quantity="Flow", unit = "ml/min")
        "desired volume flow value"                                                                    annotation (Placement(transformation(
              extent={{-66,50},{-26,90}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,60})));
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-40},{100,60}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,35},{80,10},{-80,-15},{-80,35}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-90},{150,-50}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague, Czech Republic</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
</table>
</html>",     info="<html>
<p><font style=\"font-size: 9pt; \">This element needs to be connected only to next hydraulic elements, which contain calculation of hydraulic pressure in connector. It is because equation contains only </font><b><font style=\"font-size: 9pt; \">hydraulic volume flow</font></b><font style=\"font-size: 9pt; \"> variable, which is set to value of input signal variable. </font></p>
</html>"));
    end PumpBase;

    model InputPump
      extends PumpBase;
      NegativePressureFlow q_out
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,0},{110,20}}),   iconTransformation(
              extent={{90,0},{110,20}})));
    equation
      q_out.q = - desiredFlow;
      annotation (Icon(graphics));
    end InputPump;

    model OutputPump
      extends PumpBase;
      PositivePressureFlow q_in
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent=
                {{-110,-10},{-90,10}})));
    equation
      q_in.q = desiredFlow;
    end OutputPump;

    model Pump
      extends PumpBase;
      NegativePressureFlow q_out
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{92,-10},{112,10}}), iconTransformation(
              extent={{90,-10},{110,10}})));
      PositivePressureFlow q_in annotation (Placement(
            transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-110,
                -10},{-90,10}})));
    equation
      q_in.q + q_out.q = 0;
      q_in.q = desiredFlow;
      annotation (Icon(graphics));
    end Pump;

    model PressurePumpBase "Defined pressure to/from/in system by real signal"
      Interfaces.RealInput_ desiredPressure(quantity="Pressure", unit="mmHg")
        "desired pressure flow value"                                                                  annotation (Placement(transformation(
              extent={{-66,50},{-26,90}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,60})));
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-80,60},{80,-60}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={255,170,170},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-94},{150,-54}},
              textString="%name",
              lineColor={0,0,0},
              fillPattern=FillPattern.Solid,
              fillColor={255,170,170}),
            Text(
              extent={{-36,-72},{-152,98}},
              lineColor={255,170,170},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid,
              textString="")}));
    end PressurePumpBase;

    model InputPressurePump
      extends PressurePumpBase;
      NegativePressureFlow p_out
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,0},{110,20}}),   iconTransformation(
              extent={{70,-10},{90,10}})));
    equation
      p_out.pressure = desiredPressure;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
    end InputPressurePump;

    model OutputPressurePump
      extends PressurePumpBase;
      PositivePressureFlow p_in
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,0},{110,20}}),   iconTransformation(
              extent={{-90,-10},{-70,10}})));
    equation
      p_in.pressure = desiredPressure;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Icon(graphics));
    end OutputPressurePump;

    model ReabsorbtionWithMinimalOutflow
      "Divide inflow to outflow and reabsorbtion if it is under defined treshold"
      PositivePressureFlow Inflow                    annotation (Placement(
            transformation(extent={{-100,40},{-60,80}}),  iconTransformation(
              extent={{-110,-10},{-90,10}})));
      NegativePressureFlow Outflow
        annotation (Placement(transformation(extent={{58,40},{98,80}}),
            iconTransformation(extent={{90,-10},{110,10}})));
      NegativePressureFlow Reabsorbtion                annotation (Placement(
            transformation(extent={{-12,-98},{28,-58}}), iconTransformation(
              extent={{-10,-110},{10,-90}})));
      Physiolibraryold.Interfaces.RealInput_ FractReab annotation (Placement(
            transformation(extent={{-60,-26},{-48,-14}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={94,-56})));
      Physiolibraryold.Interfaces.RealInput_ OutflowMin(final quantity="Flow",
          final unit="ml/min") annotation (Placement(transformation(extent={{-44,
                84},{-32,96}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={34,50})));
      FlowMeasure flowMeasure
        annotation (Placement(transformation(extent={{-38,22},{-18,2}})));
      Factors.SimpleMultiply simpleMultiply annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-28,-20})));
      Pump reabsorbtion annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={10,-34})));
      Pump MinimalFlow annotation (Placement(transformation(
            extent={{10,10},{-10,-10}},
            rotation=180,
            origin={-2,60})));
      FlowMeasure flowMeasure1
        annotation (Placement(transformation(extent={{-66,50},{-46,70}})));
      Modelica.Blocks.Math.Min min
        annotation (Placement(transformation(extent={{-24,82},{-14,92}})));
    equation
      connect(flowMeasure.actualFlow, simpleMultiply.yBase) annotation (Line(
          points={{-28,6.6},{-28,-18}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(simpleMultiply.u, FractReab) annotation (Line(
          points={{-37.8,-20},{-54,-20}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(reabsorbtion.q_out, Reabsorbtion) annotation (Line(
          points={{10,-44},{10,-78},{8,-78}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(simpleMultiply.y, reabsorbtion.desiredFlow) annotation (Line(
          points={{-28,-22},{-28,-34},{4,-34}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(flowMeasure.q_out, Outflow) annotation (Line(
          points={{-22,12},{43,12},{43,60},{78,60}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(flowMeasure.q_out, reabsorbtion.q_in) annotation (Line(
          points={{-22,12},{10,12},{10,-24}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(Inflow, flowMeasure1.q_in) annotation (Line(
          points={{-80,60},{-62,60}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(flowMeasure1.q_out, flowMeasure.q_in) annotation (Line(
          points={{-50,60},{-42,60},{-42,12},{-34,12}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(flowMeasure1.q_out, MinimalFlow.q_in) annotation (Line(
          points={{-50,60},{-12,60}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(MinimalFlow.q_out, Outflow) annotation (Line(
          points={{8,60},{78,60}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(OutflowMin, min.u1) annotation (Line(
          points={{-38,90},{-25,90}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(flowMeasure1.actualFlow, min.u2) annotation (Line(
          points={{-56,65.4},{-56,84},{-25,84}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(min.y, MinimalFlow.desiredFlow) annotation (Line(
          points={{-13.5,87},{-2,87},{-2,66}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Text(
              extent={{-100,134},{100,106}},
              lineColor={0,0,255},
              textString="%name"), Bitmap(extent={{-100,100},{100,-100}},
                fileName="icons/reabsorbtion2.jpg")}),
                                     Diagram(coordinateSystem(preserveAspectRatio=true,
                      extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ReabsorbtionWithMinimalOutflow;

    model Reabsorbtion "Divide inflow to outflow and reabsorbtion"
      PositivePressureFlow Inflow                    annotation (Placement(
            transformation(extent={{-106,-18},{-66,22}}), iconTransformation(
              extent={{-110,-10},{-90,10}})));
      NegativePressureFlow Outflow
        annotation (Placement(transformation(extent={{50,-18},{90,22}}),
            iconTransformation(extent={{90,-10},{110,10}})));
      NegativePressureFlow Reabsorbtion                annotation (Placement(
            transformation(extent={{-20,-100},{20,-60}}),iconTransformation(
              extent={{-10,-110},{10,-90}})));
      Physiolibraryold.Interfaces.RealInput_ FractReab annotation (Placement(
            transformation(extent={{-74,-38},{-58,-22}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=180,
            origin={104,-46})));
      FlowMeasure flowMeasure
        annotation (Placement(transformation(extent={{-48,12},{-28,-8}})));
      Factors.SimpleMultiply simpleMultiply annotation (Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={-38,-30})));
      Pump pump annotation (Placement(transformation(
            extent={{-10,10},{10,-10}},
            rotation=270,
            origin={0,-44})));
    equation
      connect(Inflow, flowMeasure.q_in) annotation (Line(
          points={{-86,2},{-44,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(flowMeasure.actualFlow, simpleMultiply.yBase) annotation (Line(
          points={{-38,-3.4},{-38,-28}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(simpleMultiply.u, FractReab) annotation (Line(
          points={{-47.8,-30},{-66,-30}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(pump.q_out, Reabsorbtion) annotation (Line(
          points={{-1.83697e-015,-54},{0,-54},{0,-80},{0,-80}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(simpleMultiply.y, pump.desiredFlow) annotation (Line(
          points={{-38,-32},{-38,-44},{-6,-44}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(flowMeasure.q_out, Outflow) annotation (Line(
          points={{-32,2},{70,2}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(flowMeasure.q_out, pump.q_in) annotation (Line(
          points={{-32,2},{1.83697e-015,2},{1.83697e-015,-34}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Text(
              extent={{-100,130},{100,108}},
              lineColor={0,0,255},
              textString="%name"), Bitmap(extent={{-100,100},{100,-100}},
                fileName="icons/reabsorbtion.png")}),
                                     Diagram(coordinateSystem(preserveAspectRatio=true,
                      extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Reabsorbtion;

    model GravityHydrostaticDifferenceWithPumpEffect
      "Create hydrostatic pressure between connectors in different altitude with specific pressure pump effect"
      PositivePressureFlow q_up
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent={{62,38},
                {82,58}})));
      PositivePressureFlow q_down
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent={{60,-64},
                {80,-44}})));
      Interfaces.RealInput_ height(final unit="cm")
                                                   annotation (Placement(transformation(extent={{22,
                -18},{62,22}}), iconTransformation(extent={{15,-15},{-15,15}},
            rotation=180,
            origin={-61,-3})));
     // constant Real g(final unit="m/s2")=9.81; //gravity acceleration constant
      parameter Real ro(final unit="kg/m3")=1060; //liquid density
     //TorsoArtyGradient  =  TorsoCM * Gravity_Gz * ArtyFractGz;  //Hydrostatic pressure: P=ro.g.h
       //cm *  0.01 m/cm * 9.81 m/s² * 1060 kg/m3 * 1/133.322 mmHg/Pa
       //= height[cm] * 0.77996129671022036873134216408395 [mmHg]
       //Blood density = 1060 kg/m3: Cutnell, John & Johnson, Kenneth. Physics, Fourth Edition. Wiley, 1998: 308.
       //bloodDensity = 1060 kg/m3
       //gravityAcceleration = 9.81 m/s2
       //Pa2mmHg = 1/133.322 mmHg/Pa
       //cm2m = 0.01 m/cm
       //averageHydrostaticHeight = TorsoCM * postureCoef[Status_Posture]
       //hydrostaticPressure = averageHydrostaticHeight * cm2m * bloodDensity * gravityAcceleration * Pa2mmHg
       //                    = 0.77996 * averageHydrostaticHeight
      Interfaces.RealInput_ pumpEffect             annotation (Placement(transformation(extent={{22,
                -18},{62,22}}), iconTransformation(extent={{15,-15},{-15,15}},
            rotation=90,
            origin={-15,95})));
      Interfaces.RealInput_ G(final unit="m/(s.s)")
                                                   annotation (Placement(transformation(extent={{22,
                -18},{62,22}}), iconTransformation(extent={{15,-15},{-15,15}},
            rotation=270,
            origin={15,-85})));
    equation
      q_down.pressure = q_up.pressure + G*ro*(height/100)*(760/101325)
        *pumpEffect; //Library.NonSIunits.to_mmHg(
      q_up.q + q_down.q = 0;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-30,-58},{30,72}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-62,-21},{62,21}},
              textString="%name",
              lineColor={0,0,255},
              origin={0,5},
              rotation=90),
            Line(
              points={{-28,44},{0,72},{28,44}},
              color={0,0,255},
              smooth=Smooth.None,
              thickness=0.5),
            Bitmap(extent={{-100,102},{100,-98}}, fileName=
                  "icons/hydrostaticGradient.png")}),
                                      Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end GravityHydrostaticDifferenceWithPumpEffect;

    model GravityHydrostaticDifference
      "Create hydrostatic pressure between connectors in different altitude"
      PositivePressureFlow q_up
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent={{62,38},
                {82,58}})));
      PositivePressureFlow q_down
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent={{60,-66},
                {80,-46}})));
      Interfaces.RealInput_ height(final unit="cm")
                                                   annotation (Placement(transformation(extent={{22,
                -18},{62,22}}), iconTransformation(extent={{15,-15},{-15,15}},
            rotation=180,
            origin={-61,-5})));
    //  constant Real g(final unit="m/s2")=9.81; //gravity acceleration constant
      parameter Real ro(final unit="kg/m3")=1060; //liquid density
     //TorsoArtyGradient  =  TorsoCM * Gravity_Gz * ArtyFractGz;  //Hydrostatic pressure: P=ro.g.h
       //cm *  0.01 m/cm * 9.81 m/s² * 1060 kg/m3 * 1/133.322 mmHg/Pa
       //= height[cm] * 0.77996129671022036873134216408395 [mmHg]
       //Blood density = 1060 kg/m3: Cutnell, John & Johnson, Kenneth. Physics, Fourth Edition. Wiley, 1998: 308.
       //bloodDensity = 1060 kg/m3
       //gravityAcceleration = 9.81 m/s2
       //Pa2mmHg = 1/133.322 mmHg/Pa
       //cm2m = 0.01 m/cm
       //averageHydrostaticHeight = TorsoCM * postureCoef[Status_Posture]
       //hydrostaticPressure = averageHydrostaticHeight * cm2m * bloodDensity * gravityAcceleration * Pa2mmHg
       //                    = 0.77996 * averageHydrostaticHeight
      Interfaces.RealInput_ G(final unit="m/(s.s)")
                                                   annotation (Placement(transformation(extent={{22,
                -18},{62,22}}), iconTransformation(extent={{15,-15},{-15,15}},
            rotation=270,
            origin={15,-85})));
    equation
      q_down.pressure = q_up.pressure + G*ro*(height/100)*(760/101325);
      q_up.q + q_down.q = 0;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-30,-58},{30,72}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-62,-21},{62,21}},
              textString="%name",
              lineColor={0,0,255},
              origin={0,5},
              rotation=90),
            Bitmap(extent={{-100,100},{100,-100}}, fileName=
                  "icons/hydrostaticGradient.png")}),
                                      Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end GravityHydrostaticDifference;

      model VolumeCompartement
      "Generate constant pressure independ on inflow or outflow"
       //extends Library.Interfaces.BaseModel;
        extends Physiolibraryold.Utilities.DynamicState;
        parameter Real pressure=0;
        PositivePressureFlow con
          annotation (Placement(transformation(extent={{100,-20},{140,20}},
              rotation=0), iconTransformation(extent={{-120,-20},{-80,20}})));
        parameter Real initialVolume;
        Interfaces.RealOutput_ Volume(start=initialVolume) annotation (Placement(transformation(extent={{
                  -8,-120},{32,-80}}), iconTransformation(
              extent={{-20,-20},{20,20}},
              rotation=270,
              origin={12,-100})));
      //initial equation
      //  Volume = initialVolume;
      equation
        /*if STEADY then
    der(Volume) = 0;
  else
    der(Volume) = con.q/Library.SecPerMin;
  end if;
*/
        /*if Volume<=0 and con.q<=0 then
    der(Volume) = 0;
  else
    con.pressure = pressure;
  end if;
 */
        if Volume>0 or con.q>0 then
                  con.pressure = pressure;
                else
                  con.q = 0;
                end if;
        stateValue = Volume;
        changePerMin = con.q;
        annotation (
          Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},
                {100,100}}),
          graphics,
                lineColor={0,0,0}), Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid));
      end VolumeCompartement;

      model PressureControledCompartment
      "Multiple PressureFlow connector with pressures from multiple inputs"
       extends Interfaces.BaseModel;
       extends Physiolibraryold.Utilities.DynamicState;
        Interfaces.RealInput_ pressure(final quantity="Pressure", final unit=
            "mmHg") "Pressure value input signal"
          annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
              rotation=0), iconTransformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,100})));
        PositivePressureFlow y "PressureFlow output connectors"
          annotation (Placement(transformation(extent={{100,-20},{140,20}},
              rotation=0), iconTransformation(extent={{-120,-20},{-80,20}})));
        parameter Real initialVolume;
        Interfaces.RealOutput_ Volume(start=initialVolume, final quantity="Volume", final unit =                    "ml")
          annotation (Placement(transformation(extent={{-20,-120},{20,-80}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-100})));
      //initial equation
      //  Volume = initialVolume;
       // der(Volume) = 0;
      equation
      /*  if STEADY then
      der(Volume) = 0;
  else
      der(Volume) = (ones(ncon)*y.q)/Library.SecPerMin;
  end if;
*/
        y.pressure = pressure;
        stateValue = Volume;
        changePerMin = y.q;
        annotation (Documentation(info="<html>
<p>Model has a vector of continuous Real input signals as pressures for vector of pressure-flow connectors. </p>
<p>Usage in tests: Set defaul volume&GT;0 and try to set STEADY in instances to &QUOT;false&QUOT;!</p>
</html>",revisions=
           "<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},
                {100,100}}),
                          graphics));
      end PressureControledCompartment;

    model Gas_FromMLtoMMOL
      "ideal gas conversion of flow units from ml to mmol, in connector should be absolute partial pressure of calculated gas"
    //  extends Modelica.SIunits.Conversions.ConversionIcon;
      PositivePressureFlow q_ML "flow in ml" annotation (Placement(transformation(
              extent={{-110,-12},{-90,8}}), iconTransformation(extent={{-110,-10},{-90,
                10}})));
      NegativePressureFlow q_MMOL "flow in mmol" annotation (Placement(
            transformation(extent={{-110,-12},{-90,8}}), iconTransformation(extent={
                {90,-10},{110,10}})));
    //  parameter Real gasConstant(unit="l.mmHg/(K.mol)") = 62.36367 "gas constant"; //= Modelica.Constants.R*760/101.325;
      parameter Real Temp(unit="K")=273.15;
      parameter Real P(unit="mmHg")=760;
    //  parameter Real mmolPerML(final unit="mmol/ml") = (P/T)/gasConstant
    //    "this density depends on substance";
      Interfaces.RealInput_ T             annotation (Placement(transformation(extent={{22,
                -18},{62,22}}), iconTransformation(extent={{15,-15},{-15,15}},
            rotation=90,
            origin={-3,99})));
    equation
      q_ML.q * ((((P)*101.325/760)/Temp)/Modelica.Constants.R)  + q_MMOL.q = 0;
      q_ML.pressure = q_MMOL.pressure;
       annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={191,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{30,0}}, color={191,0,0}),
            Polygon(
              points={{90,0},{30,20},{30,-20},{90,0}},
              lineColor={191,0,0},
              fillColor={191,0,0},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-115,155},{115,105}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{-20,100},{-100,38}},
              lineColor={0,0,0},
              textString="Pa"),
            Text(
              extent={{100,-50},{-40,-100}},
              lineColor={0,0,0},
              textString="mmHg"),
            Text(
              extent={{-56,60},{-94,8}},
              lineColor={0,0,0},
              textString="ml"),
            Text(
              extent={{96,-20},{-28,-70}},
              lineColor={0,0,0},
              textString="mmol"),
            Text(
              extent={{100,-108},{-102,-130}},
              lineColor={0,0,0},
              textString="%mmolPerML mmol/ml")}), Documentation(revisions="<html>
<p><i>2009-2012</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Gas_FromMLtoMMOL;

    model InternalElasticCompartment
      PositivePressureFlow q_int
        annotation (Placement(transformation(extent={{-86,-10},{-66,10}}),
            iconTransformation(extent={{-86,-10},{-66,10}})));
      NegativePressureFlow q_ext annotation (Placement(transformation(extent={{64,-10},
                {84,10}}),  iconTransformation(extent={{64,-10},{84,10}})));
     parameter Real Compliance(unit="ml/mmHg");
     parameter Real V0(unit="ml")=0;
     parameter Real initialVolume(unit="ml");
     Real volume(start=initialVolume,unit="ml");
     Real stressedVolume(unit="ml");
    equation
      der(volume) = q_int.q/SecPerMin;            //derivation time in Modelica is in seconds
      q_int.q + q_ext.q = 0;
      q_int.pressure = (stressedVolume/Compliance) + q_ext.pressure;
      stressedVolume = max(volume-V0,0);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-80,84},{120,-116}},
                fileName="icons/ventilatorCapacitance.png")}));
    end InternalElasticCompartment;

    model FlowInertance
      PositivePressureFlow q_in
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
      NegativePressureFlow q_out
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      parameter Real L(unit="mmHg/ml/min2");
    equation
      q_in.q + q_out.q = 0;
      L*der(q_in.q) = (q_in.pressure - q_out.pressure)/SecPerMin;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="icons/ventilatorInertance.png")}));
    end FlowInertance;

      model PressureControledCompartment2
      "Multiple PressureFlow connector with pressures from multiple inputs"
       extends Interfaces.BaseModel;
       extends Physiolibraryold.Utilities.DynamicState;
        parameter Integer ncon=1 "Number of inputs";
        Interfaces.RealInput_ pressure[ncon](final quantity="Pressure", final
          unit="mmHg") "Connector of Pressure values input signals"
          annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
              rotation=0), iconTransformation(extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,100})));
        PositivePressureFlow y[ncon]
        "Connector of PressureFlow output connectors"
          annotation (Placement(transformation(extent={{100,-20},{140,20}},
              rotation=0), iconTransformation(extent={{-120,-20},{-80,20}})));
        parameter Real initialVolume;
        Interfaces.RealOutput_ Volume(start=initialVolume, final quantity="Volume", final unit =                    "ml")
          annotation (Placement(transformation(extent={{-20,-120},{20,-80}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,-100})));
      //initial equation
      //  Volume = initialVolume;
       // der(Volume) = 0;
      equation
      /*  if STEADY then
      der(Volume) = 0;
  else
      der(Volume) = (ones(ncon)*y.q)/Library.SecPerMin;
  end if;
*/
        for i in 1:ncon loop
            y[i].pressure = pressure[i];
        end for;
        stateValue = Volume;
        changePerMin = ones(ncon)*y.q;
        annotation (Documentation(info="<html>
<p>Model has a vector of continuous Real input signals as pressures for vector of pressure-flow connectors. </p>
<p>Usage in tests: Set defaul volume&GT;0 and try to set STEADY in instances to &QUOT;false&QUOT;!</p>
</html>",revisions=
           "<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},
                {100,100}}),
                          graphics),
        Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics));
      end PressureControledCompartment2;

    model ResistorWith2Cond
     //extends Resistor;
      Interfaces.RealInput_ cond1( quantity="Flow", unit = "ml/min")
        "desired volume flow value"                                                                    annotation (Placement(transformation(
              extent={{-66,50},{-26,90}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={200,40})));
      Interfaces.RealInput_ cond2(quantity="Flow", unit = "ml/min")
        "desired volume flow value"                                                                    annotation (Placement(transformation(
              extent={{-66,50},{-26,90}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,40})));
      PositivePressureFlow q_in annotation (Placement(
            transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-110,
                -10},{-90,10}})));
      NegativePressureFlow q_out
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{92,-10},{112,10}}), iconTransformation(extent={{
                290,-10},{310,10}})));
    equation
      q_in.q + q_out.q = 0;
      q_in.q = cond1*cond2/(cond1+cond2) * (q_in.pressure - q_out.pressure);
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {300,100}}),
                       graphics={Text(
              extent={{-100,-100},{300,-40}},
              textString="%name",
              lineColor={0,0,255}),
            Rectangle(
              extent={{130,30},{270,-30}},
              lineColor={0,0,0},
              fillColor={241,241,241},
              fillPattern=FillPattern.Solid),
            Line(points={{110,0},{130,0}}, color={0,0,0}),
            Line(points={{270,0},{290,0}},
                                         color={0,0,0}),
            Rectangle(
              extent={{-70,30},{70,-30}},
              lineColor={0,0,0},
              fillColor={241,241,241},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{-70,0}}, color={0,0,0}),
            Line(points={{70,0},{130,0}},color={0,0,0})}), Diagram(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{300,100}})));
    end ResistorWith2Cond;

    model ResistorWithResistance
     extends Resistor;
      Physiolibraryold.Interfaces.RealInput_ resistance(final quantity=
            "Resistance", final unit="(min.mmHg)/ml")
        annotation (extent=[-5,30; 5,50], rotation=-90);
    equation
      q_in.q * resistance = (q_in.pressure - q_out.pressure);
      annotation (Icon(graphics={Text(
              extent={{-70,-30},{70,30}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(graphics));
    end ResistorWithResistance;

    model ResistorWithResistanceIconized
     extends Resistor;
      Physiolibraryold.Interfaces.RealInput_ resistance(final quantity=
            "Resistance", final unit="(min.mmHg)/ml")
        annotation (extent=[-5,30; 5,50], rotation=-90);
    equation
      q_in.q * resistance = (q_in.pressure - q_out.pressure);
      annotation (Icon(graphics={Text(
              extent={{-160,-80},{158,-36}},
              lineColor={0,0,255},
              textString="%name"), Bitmap(extent={{-120,44},{120,-42}},
                fileName="modelica://Physiolibrary/icons/resistance.jpg")}),
                                      Diagram(graphics));
    end ResistorWithResistanceIconized;

    model VascularElacticBloodCompartment
      Physiolibraryold.PressureFlow.PositivePressureFlow q_in annotation (
          extent=[-10,-110; 10,-90], Placement(transformation(extent={{-12,-8},
                {8,12}}), iconTransformation(extent={{-10,-10},{10,10}})));
      parameter Real initialVolume;
      Modelica.Blocks.Interfaces.RealInput zeroPressureVolume annotation (extent = [-50,90;-30,110], rotation = -90);
      Modelica.Blocks.Interfaces.RealInput compliance annotation (extent = [30,90;50,110], rotation = -90);
      //Real volume;
      Real excessVolume;
      Modelica.Blocks.Interfaces.RealOutput p
        annotation (Placement(transformation(extent={{30,-110},{50,-90}}, rotation=-90)));
      Modelica.Blocks.Interfaces.RealOutput volume
        annotation (Placement(transformation(extent={{-50,-110},{-30,-90}}, rotation=-90)));
    initial equation
      volume = initialVolume;
    equation
      der(volume) =  q_in.q;
    //  excessVolume = if (volume - zeroPressureVolume) < 0.0001 then 0.0001 else (volume - zeroPressureVolume);
      excessVolume = (volume - zeroPressureVolume); //if volume <= zeroPressureVolume then 0 else (volume - zeroPressureVolume);
      p = excessVolume/compliance;
      q_in.pressure = p;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Text(
              extent={{-150,-150},{150,-110}},
              textString="%name",
              lineColor={0,0,255}), Bitmap(extent={{-100,100},{100,-100}},
                fileName="icons/elastickyKompartment - Kopie.png")}),
                                      Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
                  Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end VascularElacticBloodCompartment;

    package Examples
      "Examples that demonstrate usage of the Pressure flow components"
    extends Modelica.Icons.ExamplesPackage;
      model ex1
      extends Modelica.Icons.Example;
      annotation (Diagram(graphics));
      end ex1;
    end Examples;

    model RedCells2
      Physiolibraryold.PressureFlow.OutputPump RBCClearance
        annotation (Placement(transformation(extent={{48,-10},{68,10}})));
      Physiolibraryold.PressureFlow.VolumeCompartement RBCVolume(initialVolume=
            2373.2, stateName="RBCVol.Vol")
        annotation (Placement(transformation(extent={{0,-10},{20,10}})));
      Physiolibraryold.PressureFlow.InputPump transfusion
        annotation (Placement(transformation(extent={{-48,26},{-28,46}})));
      Physiolibraryold.PressureFlow.OutputPump hemorrhage
        annotation (Placement(transformation(extent={{48,26},{68,46}})));
      Physiolibraryold.Factors.SplineDelayByDay EPOEffect(Tau=3, data={{0.0,0.0,
            0},{1.3,1.0,1.0},{4.0,4.0,0}})
        annotation (Placement(transformation(extent={{-76,4},{-56,24}})));
      Physiolibraryold.Blocks.FlowConstant RBCBaseSecretionRate(k=0.013889)
        annotation (Placement(transformation(extent={{-80,20},{-70,30}})));
      Physiolibraryold.PressureFlow.InputPump RBCProduction
        annotation (Placement(transformation(extent={{-76,-10},{-56,10}})));
      Physiolibraryold.Interfaces.BusConnector busConnector
        annotation (Placement(transformation(extent={{-98,54},{-78,74}})));
      Modelica.Blocks.Math.Gain gain(k=1/120*(1/1440))
        annotation (Placement(transformation(extent={{34,-14},{42,-6}})));
      Modelica.Blocks.Math.Gain H2O(k=1 - 0.34)
        annotation (Placement(transformation(extent={{36,-44},{44,-36}})));
    equation
      connect(busConnector.Transfusion_RBCRate,transfusion. desiredFlow)
                                                          annotation (Line(
          points={{-88,64},{-86,64},{-86,58},{-38,58},{-38,42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(busConnector.Hemorrhage_RBCRate, hemorrhage.desiredFlow)
                                                          annotation (Line(
          points={{-88,64},{-86,64},{-86,58},{58,58},{58,42}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RBCBaseSecretionRate.y,EPOEffect. yBase)              annotation (
          Line(
          points={{-69.5,25},{-66,25},{-66,16}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(EPOEffect.u,busConnector. EPOPool_Log10Conc)              annotation (Line(
          points={{-75.8,14},{-86.9,14},{-86.9,64},{-88,64}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RBCProduction.desiredFlow, EPOEffect.y)
                                               annotation (Line(
          points={{-66,6},{-66,12}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RBCProduction.q_out, RBCVolume.con)
                                                 annotation (Line(
          points={{-56,1},{-30.6,1},{-30.6,0},{0,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(transfusion.q_out, RBCVolume.con) annotation (Line(
          points={{-28,37},{-14,37},{-14,0},{0,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RBCVolume.con, hemorrhage.q_in)  annotation (Line(
          points={{0,0},{26,0},{26,36},{48,36}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RBCVolume.con, RBCClearance.q_in) annotation (Line(
          points={{0,0},{48,0}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.None));
      connect(RBCVolume.Volume, gain.u) annotation (Line(
          points={{11.2,-10},{33.2,-10}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(gain.y, RBCClearance.desiredFlow) annotation (Line(
          points={{42.4,-10},{44,-10},{44,10},{58,10},{58,6}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(RBCVolume.Volume,busConnector. RBCVol_Vol) annotation (Line(
          points={{11.2,-10},{11.2,-24},{100,-24},{100,58},{-86,58},{-86,64},
              {-88,64}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,-5},{6,-5}}));
      connect(RBCVolume.Volume, H2O.u) annotation (Line(
          points={{11.2,-10},{10,-10},{10,-40},{35.2,-40}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(H2O.y, busConnector.RBCH2O_Vol) annotation (Line(
          points={{44.4,-40},{100,-40},{100,58},{-88,58},{-88,64}},
          color={0,0,127},
          smooth=Smooth.None), Text(
          string="%second",
          index=1,
          extent={{6,3},{6,3}}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}),       graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
            graphics={Bitmap(extent={{-70,80},{70,-40}}, fileName=
                  "icons/krvinka.png"), Text(
              extent={{-136,-46},{148,-68}},
              lineColor={0,0,255},
              textString="%name")}),
        Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2009</td>
</tr>
<tr>
<td>References:</td>
<td>Tom Coleman: QHP 2008 beta 3, University of Mississippi Medical Center</td>
</tr>
</table>
</html>"));
    end RedCells2;

    model VascularElasticBloodCompartment
      extends Physiolibraryold.Utilities.DynamicState;
      extends Interfaces.IVascularElasticBloodCompartment;
      Real StressedVolume(   final quantity="Volume", final unit="ml");
      Modelica.Blocks.Interfaces.RealOutput NormalizedVolume(final quantity="NormalizedVolume",
          final unit="1")
        "actual volume divided by standard compartement volume"
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},
            rotation=270,
            origin={-40,-100}), iconTransformation(
            extent={{-10,-10},{10,10}},
            rotation=0,
            origin={100,60})));
    //initial equation
    //  Vol = initialVol;
     // der(Vol) = 0;
    equation
      StressedVolume = max(Vol-V0,0);
      Pressure = (StressedVolume/Compliance) + ExternalPressure;
      referencePoint.pressure = Pressure;
      NormalizedVolume = if initialVol==0 then 0 else Vol/initialVol;
      stateValue = Vol;
      changePerMin = referencePoint.q;
     annotation (
        preferredView = text,
        Documentation(info="<HTML>
<PRE>
  Elastic blood flow compartment. 
 
like 
QHP 2008 / VascularCompartments/SystemicArtys.DES
 
Created : 21-Oct-04
Last Modified : 13-Aug-08
Author : Tom Coleman
Copyright : 2008-2008
By : University of Mississippi Medical Center
Solver : DES 2008
Schema : 2008.0
</PRE>
</HTML>
",   revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Design:</td>
<td>Zuzana Rubaninska</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>january 2009</td>
</tr>
<tr>
<td>References:</td>
<td>Tom Coleman: QHP 2008 beta 3, University of Mississippi Medical Center</td>
</tr>
</table>
</html>"),
         Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},
                {100,100}}), graphics={Text(
              extent={{-100,-16},{100,-32}},
              lineColor={0,0,255},
              textString="(initial %initialVol ml)")}),
        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,100}}), graphics));
    end VascularElasticBloodCompartment;
    annotation (Documentation(revisions="<html>
</html>"));
  end PressureFlow;

  package Semipermeable "Osmotic Physical Domain"
     connector OsmoticFlow
      "H2O flow throught semipermeable membrane by osmotic pressure gradient"
      Real o(quantity="Osmolarity", unit="mOsm");
      flow Real q(quantity="Flow", unit="ml/min");
      annotation (Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
     end OsmoticFlow;

    connector PositiveOsmoticFlow "H2O inflow"
      extends OsmoticFlow;
    annotation (
        defaultComponentName="q_in",
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={127,127,0},
              lineThickness=1), Polygon(
              points={{0,100},{100,0},{0,-100},{-100,0},{0,100}},
              lineColor={0,0,0},
              smooth=Smooth.None,
              fillPattern=FillPattern.Solid,
              fillColor={127,127,0})}),
        Diagram(Polygon(points=[-21,-3; 5,23; 31,-3; 5,-29; -21,-3],   style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={0,0,0})), Text(
            extent=[-105,-38; 115,-83],
            string="%name",
            style(color=0, rgbcolor={0,0,0}))),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>",
        revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end PositiveOsmoticFlow;

    connector NegativeOsmoticFlow "H2O outflow"
      extends OsmoticFlow;
    annotation (
        defaultComponentName="q_out",
        Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=false),
            graphics={Rectangle(
              extent={{-20,10},{20,-10}},
              lineColor={127,127,0},
              lineThickness=1), Polygon(
              points={{-100,0},{0,100},{100,0},{0,-100},{-100,0}},
              smooth=Smooth.None,
              fillPattern=FillPattern.Solid,
              fillColor={225,235,129},
              pattern=LinePattern.None)}),
        Diagram(Polygon(points=[-21,-3; 5,23; 31,-3; 5,-29; -21,-3],   style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={255,255,255})), Text(
            extent=[-105,-38; 115,-83],
            string="%name",
            style(color=0, rgbcolor={0,0,0}))),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>",
        revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end NegativeOsmoticFlow;

    model FlowMeasure
      NegativeOsmoticFlow q_out
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{18,-10},{38,10}}), iconTransformation(
              extent={{78,-42},{98,-22}})));
      PositiveOsmoticFlow q_in  annotation (Placement(
            transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-100,
                -44},{-80,-24}})));
      Physiolibraryold.Interfaces.RealOutput_ actualFlow(final quantity="Flow",
          final unit="ml/min") annotation (Placement(transformation(extent={{-20,
                30},{20,70}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={-2,82})));
    equation
      q_in.q + q_out.q = 0;
      q_out.o = q_in.o;
      actualFlow = q_in.q;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Bitmap(extent={{-100,102},{100,-102}},
                fileName="icons/flowMeassure.png")}),
                                      Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end FlowMeasure;

    partial model ResistorBase "semipermeable membrane"
     extends Physiolibraryold.Icons.Resistor;
      PositiveOsmoticFlow q_in
                            annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-10},{-90,10}})));
      NegativeOsmoticFlow q_out
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,-10},{110,10}})));
      annotation (Icon(graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ResistorBase;

    partial model Resistor
     extends ResistorBase;
    equation
      q_in.q + q_out.q = 0;
      annotation (Icon(graphics), Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end Resistor;

    model ResistorWithCondParam
     extends Resistor;
     parameter Real cond "H2O membrane permeability";
    equation
      q_in.q = cond * (q_out.o - q_in.o);
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),
                          graphics), Icon(graphics={Text(
              extent={{-70,-30},{70,30}},
              lineColor={0,0,0},
              textString="%cond"), Text(
              extent={{-134,-90},{154,-30}},
              textString="%name",
              lineColor={0,0,255})}),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end ResistorWithCondParam;

    model InputPump
      NegativeOsmoticFlow q_out
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,-10},{110,10}}), iconTransformation(extent={
                {50,-10},{70,10}})));
      Physiolibraryold.Interfaces.RealInput_ desiredFlow "pure H2O inflow"
        annotation (extent=[-10,30; 10,50], rotation=-90);
    equation
      q_out.q = - desiredFlow;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-60,-30},{60,30}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-48,20},{50,0},{-48,-21},{-48,20}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-92,-54},{80,-30}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end InputPump;

    model OutputPump
      PositiveOsmoticFlow q_in
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent={{-70,-10},
                {-50,10}})));
      Physiolibraryold.Interfaces.RealInput_ desiredFlow
        annotation (extent=[-10,30; 10,50], rotation=-90);
    equation
      q_in.q = desiredFlow;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-60,-32},{60,30}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-48,18},{50,-2},{-48,-26},{-48,18}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-78,-54},{72,-32}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end OutputPump;

    model ColloidOsmolarity "set osmolarity from protein mass flow"
      extends Interfaces.ConversionIcon;
      Interfaces.RealInput_ proteinMassFlow(unit="g/min")
                              annotation (Placement(transformation(extent={{-20,80},
                {20,120}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={48,116})));
      PressureFlow.PositivePressureFlow q_in "hydraulic pressure"
                                annotation (Placement(transformation(extent={{-110,-110},
                {-90,-90}}),iconTransformation(extent={{-110,-110},{-90,-90}})));
      NegativeOsmoticFlow q_out(o(final unit="g/ml"))
        "colloid osmotic pressure"
        annotation (Placement(transformation(extent={{90,-10},{110,10}}),
            iconTransformation(extent={{90,-10},{110,10}})));
    parameter Real C1 =   320.0;
    parameter Real C2 =   1160.0;
      Interfaces.RealOutput_ P annotation (Placement(transformation(extent={{42,86},
                {82,126}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-60,-120})));
    equation
      q_in.q + q_out.q = 0;
      q_out.o = abs(proteinMassFlow/q_in.q);
      P = q_in.pressure;
      annotation (Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                -100},{100,100}},
            initialScale=0.04), graphics={Text(
              extent={{22,92},{84,18}},
              lineColor={0,0,0},
              textString="O"), Text(
              extent={{-94,-12},{-10,-90}},
              lineColor={0,0,0},
              textString="P")}), Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            initialScale=0.04), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,40},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}));
    end ColloidOsmolarity;

    model ColloidHydraulicPressure
      "set pressure as sum of osmotic pressure(from osmoles) and hydrostatic/hydrodynamic pressure(from signal)"
      extends Interfaces.ConversionIcon;
      Interfaces.RealInput_ hydraulicPressure(unit="mmHg")
                              annotation (Placement(transformation(extent={{-20,80},
                {20,120}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={40,120})));
      PressureFlow.NegativePressureFlow q_out
        "pressure on semipermeable membrane wall = osmotic + hydrostatic"
                                annotation (Placement(transformation(extent={{90,-10},
                {110,10}}), iconTransformation(extent={{90,-10},{110,10}})));
      PositiveOsmoticFlow q_in(o(unit="g")) "osmoles"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    parameter Real C1 =   320.0;
    parameter Real C2 =   1160.0;
    equation
      q_in.q + q_out.q = 0;
      q_out.pressure = hydraulicPressure - ( (C1 * q_in.o)  + ( C2 * (q_in.o^2)));
      annotation (Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                -100},{100,100}},
            initialScale=0.04), graphics={Text(
              extent={{-94,-10},{-32,-84}},
              lineColor={0,0,0},
              textString="O"), Text(
              extent={{8,92},{92,14}},
              lineColor={0,0,0},
              textString="P")}), Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            initialScale=0.04), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,40},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}));
    end ColloidHydraulicPressure;

    model ColloidHydraulicPressure2
     extends Interfaces.ConversionIcon;
      Interfaces.RealInput_ hydraulicPressure(unit="mmHg")
                              annotation (Placement(transformation(extent={{-20,80},
                {20,120}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={40,120})));
      PressureFlow.NegativePressureFlow q_out
        "pressure on semipermeable membrane wall = osmotic + hydrostatic"
                                annotation (Placement(transformation(extent={{90,-10},
                {110,10}}), iconTransformation(extent={{90,-10},{110,10}})));
      PositiveOsmoticFlow q_in(o(unit="g")) "osmoles"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    parameter Real C1 =   320.0;
    parameter Real C2 =   1160.0;
    PressureFlow.NegativePressureFlow withoutCOP
        "only hydrostatic pressure without colloid osmotic pressure"
                                annotation (Placement(transformation(extent={{90,90},
                {110,110}}),iconTransformation(extent={{90,90},{110,110}})));
    equation
      q_in.q + q_out.q + withoutCOP.q = 0;
      q_out.pressure = hydraulicPressure - ( (C1 * q_in.o)  + ( C2 * (q_in.o^2)));
      withoutCOP.pressure = hydraulicPressure;
      annotation (Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                -100},{100,100}},
            initialScale=0.04), graphics={Text(
              extent={{-94,-10},{-32,-84}},
              lineColor={0,0,0},
              textString="O"), Text(
              extent={{8,92},{92,14}},
              lineColor={0,0,0},
              textString="P")}), Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            initialScale=0.04), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,40},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}));
    end ColloidHydraulicPressure2;

    model ColloidHydraulicPressure0
     extends Interfaces.ConversionIcon;
      Interfaces.RealInput_ hydraulicPressure(unit="mmHg")
                              annotation (Placement(transformation(extent={{-20,80},
                {20,120}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={40,120})));
      PositiveOsmoticFlow q_in(o(unit="g")) "osmoles"
        annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
    parameter Real C1 =   320.0;
    parameter Real C2 =   1160.0;
    PressureFlow.NegativePressureFlow withoutCOP
        "only hydrostatic pressure without colloid osmotic pressure"
                                annotation (Placement(transformation(extent={{90,90},
                {110,110}}),iconTransformation(extent={{90,90},{110,110}})));
    equation
      q_in.q + withoutCOP.q = 0;
      withoutCOP.pressure = hydraulicPressure;
      annotation (Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                -100},{100,100}},
            initialScale=0.04), graphics={Text(
              extent={{-94,-10},{-32,-84}},
              lineColor={0,0,0},
              textString="O"), Text(
              extent={{8,92},{92,14}},
              lineColor={0,0,0},
              textString="P")}), Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            initialScale=0.04), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,40},{100,-40}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}));
    end ColloidHydraulicPressure0;

    model WaterColloidOsmoticCompartment
    //  extends HumMod.Library.Interfaces.BaseModel;
      extends Physiolibraryold.Utilities.DynamicState;
      NegativeOsmoticFlow q_out(o(final unit="g/ml"))
                                 annotation (Placement(
            transformation(extent={{62,-32},{102,8}}),  iconTransformation(extent={{-10,-10},
                {10,10}})));
      parameter Real initialWaterVolume(final quantity="Volume", unit="ml");
      Physiolibraryold.Interfaces.RealInput_ NotpermeableSolutes(quantity=
            "Mass", unit="g") annotation (Placement(transformation(extent={{-120,
                60},{-80,100}}), iconTransformation(extent={{-120,60},{-80,100}})));
      Physiolibraryold.Interfaces.RealOutput_ WaterVolume(
        start=initialWaterVolume,
        final quantity="Volume",
        unit="ml") annotation (Placement(transformation(extent={{-20,-120},{20,
                -80}}, rotation=-90)));
    //initial equation
    //  WaterVolume = initialWaterVolume;
    equation
      q_out.o = if (WaterVolume>0) then NotpermeableSolutes / WaterVolume else 0;
      changePerMin = q_out.q;
      stateValue = WaterVolume;
    //  der(WaterVolume) = q_out.q / Library.SecPerMin;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                                                   graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end WaterColloidOsmoticCompartment;

    model OsmoticControlledCompartment
      extends Physiolibraryold.Interfaces.BaseModel;
      NegativeOsmoticFlow q_out  annotation (Placement(
            transformation(extent={{62,-32},{102,8}}),  iconTransformation(extent={{-10,-10},
                {10,10}})));
      parameter Real initialWaterVolume(final quantity="Volume", unit="ml") = 0;
      Physiolibraryold.Interfaces.RealInput_ Osmolarity(quantity="Osmolarity",
          unit="mOsm/ml") annotation (Placement(transformation(extent={{-20,80},
                {20,120}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={-2,100})));
      Physiolibraryold.Interfaces.RealOutput_ WaterVolume(final quantity=
            "Volume", unit="ml") annotation (Placement(transformation(extent={{
                -20,-120},{20,-80}}, rotation=-90)));
    initial equation
      WaterVolume = initialWaterVolume;
    equation
      q_out.o = Osmolarity;
      der(WaterVolume) = q_out.q/SecPerMin;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                                                   graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end OsmoticControlledCompartment;

    model OsmoticPump
      extends OsmoticPumpBase;
      PositiveOsmoticFlow q_in
        annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
      NegativeOsmoticFlow q_out annotation (Placement(transformation(extent={{70,-10},
                {90,10}}), iconTransformation(extent={{70,-10},{90,10}})));
    equation
      q_in.q + q_out.q = 0;
      q_in.o = desiredOsmoles;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics), Icon(coordinateSystem(
              preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                                                   graphics));
    end OsmoticPump;

    model OsmoticPumpBase "Defined osmoles to/from/in system by real signal"
      Interfaces.RealInput_ desiredOsmoles(quantity="Osmolarity", unit="mOsm")
        "desired pressure flow value"                                                                  annotation (Placement(transformation(
              extent={{-66,50},{-26,90}}), iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=270,
            origin={0,60})));
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-80,60},{80,-60}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={255,170,170},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-94},{150,-54}},
              textString="%name",
              lineColor={0,0,0},
              fillPattern=FillPattern.Solid,
              fillColor={255,170,170}),
            Text(
              extent={{-36,-72},{-152,98}},
              lineColor={255,170,170},
              fillColor={255,170,170},
              fillPattern=FillPattern.Solid,
              textString="")}), Diagram(coordinateSystem(preserveAspectRatio=true,
                      extent={{-100,-100},{100,100}}), graphics));
    end OsmoticPumpBase;

    model Pump
      PositiveOsmoticFlow q_in
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-8},{-90,12}}), iconTransformation(extent={{-110,
                -10},{-90,10}})));
      Physiolibraryold.Interfaces.RealInput_ desiredFlow
        annotation (extent=[-10,30; 10,50], rotation=-90);
      NegativeOsmoticFlow q_out annotation (Placement(transformation(extent={{90,-10},{110,10}}),
            iconTransformation(extent={{90,-10},{110,10}})));
    equation
      q_in.q + q_out.q = 0;
      q_in.q = desiredFlow;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Text(
              extent={{-100,-80},{100,-54}},
              textString="%name",
              lineColor={0,0,255}),
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-78,25},{82,0},{-78,-25},{-78,25}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)}),
                                      Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
        Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),        Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end Pump;
  end Semipermeable;

  package SaturationFlow
    connector SaturationFlow
      Real saturation;
      flow Real saturationFlow;
    annotation (
        defaultComponentName="flow",
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20],
          scale=0.2),
        Icon(coordinateSystem(extent=[-100, -100; 100, 100]), Polygon(points=[-50,-5;
                0,40; 50,-5; 0,-51; -50,-5],            style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={0,0,0}))),
        Diagram(Polygon(points=[-21,-3; 5,23; 31,-3; 5,-29; -21,-3],   style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={0,0,0})), Text(
            extent=[-105,-38; 115,-83],
            string="%name",
            style(color=0, rgbcolor={0,0,0}))),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>"));
    end SaturationFlow;

    connector PositiveSaturationFlow
      extends SaturationFlow;
      annotation (
        defaultComponentName="flow",
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20],
          scale=0.2),
        Icon(coordinateSystem(extent=[-100, -100; 100, 100]), Polygon(points=[-50,63;
                50,18; 50,-22; -50,-78; -50,63],        style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={0,0,0}))),
        Diagram(Polygon(points=[-23,40; 32,11; 31,-22; -23,-49; -23,40],
                                                                       style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={0,0,0})), Text(
            extent=[-120, 105; 100, 60],
            string="%name",
            style(color=0, rgbcolor={0,0,0}))),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>"));
    end PositiveSaturationFlow;

    connector NegativeSaturationFlow
      extends SaturationFlow;
      annotation (
        defaultComponentName="flow",
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20],
          scale=0.2),
        Icon(coordinateSystem(extent=[-100, -100; 100, 100]), Polygon(points=[-49,57;
                52,17; 52,-23; -49,-73; -49,57],        style(
              color=7,
              rgbcolor={0,0,0},
              fillColor=255,
              rgbfillColor={255,255,255}))),
        Diagram(Polygon(points=[0, 25; 50, 10; 50, -10; 0, -25; 0, 25],style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=7,
              rgbfillColor={255,255,255})), Text(
            extent=[-120, 105; 100, 60],
            string="%name",
            style(color=0, rgbcolor={0,0,0}))),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>"));
    end NegativeSaturationFlow;

    model Clearance
      extends Modelica.Blocks.Interfaces.BlockIcon;
      PositiveSaturationFlow positiveSaturationFlow annotation (Placement(
            transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-120,
                -20},{-80,20}})));
      parameter Real clearenceOfSaturationPerTime
        "saturation flow is saturation * (this parameter)";
    equation
      positiveSaturationFlow.saturationFlow = clearenceOfSaturationPerTime * positiveSaturationFlow.saturation;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}),                                                                     graphics));
    end Clearance;

    model Cumulation
      PositiveSaturationFlow q_in
                            annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-10},{-90,10}})));
      NegativeSaturationFlow q_out
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,-10},{110,10}})));
      Modelica.Blocks.Interfaces.RealOutput saturation annotation ( extent = [-10,-90;10,-110], rotation = 90);
    parameter Real initialSaturation;
    initial equation
     saturation = initialSaturation;
    equation
      der(saturation) = q_in.saturationFlow + q_out.saturationFlow;
      q_in.saturation = saturation;
      q_out.saturation = saturation;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-144,94},{156,134}},
              textString="%name",
              lineColor={0,0,255})}),
                  Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end Cumulation;

    model SourceFlow
      NegativeSaturationFlow q_out
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,-10},{110,10}})));
      Interfaces.RealInput saturationFlow         annotation (Placement(transformation(extent={{-20,80},{20,120}}, rotation = -90)));
    equation
      q_out.saturationFlow = saturationFlow;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-100,-100},{100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-154,-138},{146,-98}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=false,
                       extent={{-100,-100},{100,100}}), graphics),
                  Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end SourceFlow;

    model FiltrationFromFlow
      Modelica.Blocks.Interfaces.RealInput inflowSaturation
        "saturation in blood"
                            annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-80,50},{-60,70}}), iconTransformation(extent={
                {-80,50},{-60,70}}, rotation = -90)));
      NegativeSaturationFlow q_out
        "saturation in blood flow [saturation increase per time]"
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,-10},{110,10}})));
      Modelica.Blocks.Interfaces.RealInput desiredFlowValue annotation ( extent = [-30,50;-10,70], rotation = -90);
      Modelica.Blocks.Interfaces.RealInput saturation2VolumeCoef annotation ( extent = [10,50;30,70], rotation = -90);
      ControledFlow.NegativeFlow filtration "flow [volume per time]"
                              annotation (Placement(transformation(extent={{-16,-68},{24,-28}}),
            iconTransformation(extent={{-8,-60},{10,-42}}, rotation=-90)));
    equation
      q_out.saturationFlow =  - (inflowSaturation + filtration/(saturation2VolumeCoef * desiredFlowValue))/5;
     //iltration = filtratingVolume;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                            graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,37},{80,12},{-80,-13},{-80,37}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{8,-90},{222,-50}},
              textString="%name",
              lineColor={0,0,255}),
            Rectangle(extent={{-40,-28},{42,-38}}, lineColor={0,0,255})}), Diagram(
            coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
                100,100}}),
                        graphics),
                  Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end FiltrationFromFlow;
  end SaturationFlow;

  package SoluteFlow
    connector SoluteFlow
      Real nconc
        "normalized concentration, concentration rate on normal concentration";
      flow Real nflow
        "normalized solute flow, solute flow rate on normal solute flow";
    annotation (
        defaultComponentName="flow",
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20],
          scale=0.2),
        Icon(coordinateSystem(extent=[-100, -100; 100, 100]), Polygon(points=[-50,-5;
                0,40; 50,-5; 0,-51; -50,-5],            style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={0,0,0}))),
        Diagram(Polygon(points=[-21,-3; 5,23; 31,-3; 5,-29; -21,-3],   style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={0,0,0})), Text(
            extent=[-105,-38; 115,-83],
            string="%name",
            style(color=0, rgbcolor={0,0,0}))),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>"));
    end SoluteFlow;

    connector PositiveSoluteFlow
      extends SoluteFlow;
      annotation (
        defaultComponentName="flow",
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20],
          scale=0.2),
        Icon(coordinateSystem(extent=[-100, -100; 100, 100]), Polygon(points=[-50,63;
                50,18; 50,-22; -50,-78; -50,63],        style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={0,0,0}))),
        Diagram(Polygon(points=[-23,40; 32,11; 31,-22; -23,-49; -23,40],
                                                                       style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={0,0,0})), Text(
            extent=[-120, 105; 100, 60],
            string="%name",
            style(color=0, rgbcolor={0,0,0}))),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>"));
    end PositiveSoluteFlow;

    connector NegativeSoluteFlow
      extends SoluteFlow;
      annotation (
        defaultComponentName="flow",
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20],
          scale=0.2),
        Icon(coordinateSystem(extent=[-100, -100; 100, 100]), Polygon(points=[-49,57;
                52,17; 52,-23; -49,-73; -49,57],        style(
              color=7,
              rgbcolor={0,0,0},
              fillColor=255,
              rgbfillColor={255,255,255}))),
        Diagram(Polygon(points=[0, 25; 50, 10; 50, -10; 0, -25; 0, 25],style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=7,
              rgbfillColor={255,255,255})), Text(
            extent=[-120, 105; 100, 60],
            string="%name",
            style(color=0, rgbcolor={0,0,0}))),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>"));
    end NegativeSoluteFlow;

    model SecretionAndClearence
      extends Modelica.Blocks.Interfaces.SISO;
      parameter Real time_coef = 1;
      parameter Real base_effect= 1;
      parameter Real effect_difference_multiplier= 1;
      parameter Real effect_mass_exponent_multiplier= 1;
      Source secretion(normal_solute_flow=1/time_coef)
        annotation (extent=[-62,-24; -42,-4]);
      NormalizedConcentrationToEffect nconcToEffect(
        base_effect=base_effect,
        mass_exponent_multiplier=effect_mass_exponent_multiplier,
        difference_multiplier=effect_difference_multiplier)
        annotation (extent=[8,10; 28,22]);
      BasePool basePool
        annotation (Placement(transformation(extent={{-30,-24},{-10,-4}})));
      Clearance clearance(nconc_to_nflow_coef=time_coef)
        annotation (Placement(transformation(extent={{6,-24},{26,-4}})));
    equation
      connect(secretion.soluteFlow, u)
                                   annotation (points=[-52,-4; -52,0; -120,0],
          style(color=74, rgbcolor={0,0,127}));
      connect(nconcToEffect.y, y)
                                 annotation (points=[29,16; 62.5,16; 62.5,0;
            110,0],
                style(color=74, rgbcolor={0,0,127}));
      //connect(y, y) annotation (points=[110,0; 108,0; 108,0; 110,0], style(
      //      color=74, rgbcolor={0,0,127}));
      connect(secretion.q_out, basePool.q_in) annotation (Line(
          points={{-42,-14},{-30,-14}},
          color={0,0,0},
          smooth=Smooth.None));
      connect(basePool.nconc, nconcToEffect.u)
                                              annotation (Line(
          points={{-20,-4},{-20,16},{6,16}},
          color={0,0,127},
          smooth=Smooth.None));
      connect(basePool.q_out, clearance.q_in) annotation (Line(
          points={{-10,-14},{6,-14}},
          color={0,0,0},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end SecretionAndClearence;

    model Source
      extends Modelica.Blocks.Interfaces.BlockIcon;
      NegativeSoluteFlow q_out
        annotation (extent=[90, -10; 110, 10]);
      Interfaces.RealInput soluteFlow "solute flow"
        annotation (extent=[-10, 90; 10, 110], rotation=-90);
      parameter Real normal_solute_flow "normal solute flow = 1/(time coef)";
    equation
      q_out.nflow = -soluteFlow/normal_solute_flow; //if soluteFlow<0 then 0 else -soluteFlow/normal_solute_flow;
    end Source;

    model BasePool
      extends Modelica.Blocks.Interfaces.BlockIcon;
      PositiveSoluteFlow q_in
                            annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{-110,-10},{-90,10}})));
      NegativeSoluteFlow q_out
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,-10},{110,10}})));
      Modelica.Blocks.Interfaces.RealOutput nconc
        "normalized concentration, concentration rate on normal concentration"
        annotation (extent=[-10,90; 10, 110],rotation=90);
    initial equation
      nconc = 1;
    equation
      der(nconc) = q_in.nflow + q_out.nflow;
      q_in.nconc = nconc;
      q_out.nconc = nconc;
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end BasePool;

    model Clearance
      extends Modelica.Blocks.Interfaces.BlockIcon;
      PositiveSoluteFlow q_in
        annotation (extent=[-110, -10; -90, 10]);
      parameter Real nconc_to_nflow_coef;
    equation
      q_in.nflow = q_in.nconc * nconc_to_nflow_coef;
    end Clearance;

    block NormalizedConcentrationToEffect
      extends Modelica.Blocks.Interfaces.PartialConversionBlock;
      parameter Real base_effect= 1;
      parameter Real difference_multiplier= 1;
      parameter Real mass_exponent_multiplier= 1;
    equation
      y = base_effect - difference_multiplier/(10^(u*mass_exponent_multiplier));
    end NormalizedConcentrationToEffect;
  end SoluteFlow;

  package VolumeFlow "Volume and Volume Flow domains"
    connector VolumeFlow
      Real volume(  final quantity="Volume", final unit="ml");
      flow Real q(  final quantity="Flow", final unit="ml/min");
    end VolumeFlow;

    connector PositiveVolumeFlow
      extends VolumeFlow;
    annotation (
        defaultComponentName="q_in",
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20],
          scale=0.2),
        Icon(coordinateSystem(extent=[-100, -100; 100, 100]), Polygon(points=[-50,-5;
                0,40; 50,-5; 0,-51; -50,-5],            style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={0,0,0}))),
        Diagram(Polygon(points=[-21,-3; 5,23; 31,-3; 5,-29; -21,-3],   style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={0,0,0})), Text(
            extent=[-105,-38; 115,-83],
            string="%name",
            style(color=0, rgbcolor={0,0,0}))),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>"));
    end PositiveVolumeFlow;

    connector NegativeVolumeFlow
       extends VolumeFlow;
    annotation (
        defaultComponentName="q_out",
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20],
          scale=0.2),
        Icon(coordinateSystem(extent=[-100, -100; 100, 100]), Polygon(points=[-50,-5;
                0,40; 50,-5; 0,-51; -50,-5],            style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={255,255,255}))),
        Diagram(Polygon(points=[-21,-3; 5,23; 31,-3; 5,-29; -21,-3],   style(
              color=74,
              rgbcolor={0,0,0},
              fillColor=0,
              rgbfillColor={255,255,255})), Text(
            extent=[-105,-38; 115,-83],
            string="%name",
            style(color=0, rgbcolor={0,0,0}))),
        Documentation(info="<html>
<p>
Connector with one flow signal of type Real.
</p>
</html>"));
    end NegativeVolumeFlow;

    model VolumeMeasure
      PositiveVolumeFlow q_in   annotation (Placement(
            transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-20,-60},
                {20,-20}})));
      Physiolibraryold.Interfaces.RealOutput_ actualVolume annotation (
          Placement(transformation(extent={{-20,30},{20,70}}),
            iconTransformation(
            extent={{-20,-20},{20,20}},
            rotation=90,
            origin={0,40})));
    equation
      q_in.q = 0;
      actualVolume = q_in.volume;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={Rectangle(
              extent={{-40,-40},{40,40}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{-28,18},{30,-40}},
              lineColor={0,0,0},
              fillPattern=FillPattern.VerticalCylinder,
              fillColor={215,215,215},
              textString="Vol")}),    Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics));
    end VolumeMeasure;

    model InputPump
      NegativeVolumeFlow q_out
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,-10},{110,10}})));
      Physiolibraryold.Interfaces.RealInput desiredFlow(final quantity="Flow",
          final unit="ml/min") annotation (extent=[-10,50; 10,70], rotation=-90);
    equation
      q_out.q = - desiredFlow;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-100},{150,-60}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
                  Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end InputPump;

    model OutputPump
      PositiveVolumeFlow q_in
                             annotation (extent=[-10, -110; 10, -90], Placement(
            transformation(extent={{90,-10},{110,10}}), iconTransformation(
              extent={{-110,-10},{-90,10}})));
      Physiolibraryold.Interfaces.RealInput desiredFlow(final quantity="Flow",
          final unit="ml/min") annotation (extent=[-10,50; 10,70], rotation=-90);
    equation
      q_in.q = desiredFlow;
     annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                100,100}}), graphics={
            Rectangle(
              extent={{-100,-50},{100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-80,25},{80,0},{-80,-25},{-80,25}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-150,-100},{150,-60}},
              textString="%name",
              lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics),
                  Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics));
    end OutputPump;
  end VolumeFlow;
  constant Real SecPerMin(unit="s/min") = 60
    "Conversion coeficient from minutes to seconds";

  package NonSIunits "Non SI-units Support"
   constant Real PaTOmmHg(final unit="mmHg/Pa") = 760/101325;
   type Pressure_mmHg = Real (final quantity="Pressure", final unit="mmHg")
      "Pressure in mmHg";
    function to_mmHg "Convert from Pascal to mmHg"
      //extends Modelica.SIunits.Conversions.ConversionIcon;
      input Modelica.SIunits.Pressure Pa "Pascal value";
      output Pressure_mmHg mmHg "mmHg value";
      //1 mmHg = 1 torr; 1/760 atm = 1 torr; 1 atm = 101325 Pa   =>   1 mmHg = 101325/760 Pa
      constant Real PaTOmmHg(final unit="mmHg/Pa") = 760/101325;
    algorithm
      mmHg := Pa * PaTOmmHg;
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={191,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{30,0}}, color={191,0,0}),
            Polygon(
              points={{90,0},{30,20},{30,-20},{90,0}},
              lineColor={191,0,0},
              fillColor={191,0,0},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-115,155},{115,105}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{-20,100},{-100,38}},
              lineColor={0,0,0},
              textString="Pa"),
            Text(
              extent={{100,-50},{-40,-100}},
              lineColor={0,0,0},
              textString="mmHg")}));
    end to_mmHg;

    model degC_to_degF "Convert from Celsius degrees to Farenhein degrees"
    //  extends Modelica.SIunits.Conversions.ConversionIcon;
    //  input Real degC "Celsiuc value";
    //  output Real degF "Farenheit value";
      Interfaces.RealInput_ degC annotation (Placement(transformation(extent={{-120,
                -20},{-80,20}}), iconTransformation(extent={{-140,-20},{-100,20}})));
      Interfaces.RealOutput_ degF annotation (Placement(transformation(extent={{50,-20},
                {90,20}}), iconTransformation(extent={{100,-20},{140,20}})));
    //algorithm
    equation
      degF = degC * 9.0/5.0 + 32.0;
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={191,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{30,0}}, color={191,0,0}),
            Polygon(
              points={{90,0},{30,20},{30,-20},{90,0}},
              lineColor={191,0,0},
              fillColor={191,0,0},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-115,155},{115,105}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{-20,100},{-100,20}},
              lineColor={0,0,0},
              textString="°C"),
            Text(
              extent={{100,-20},{20,-100}},
              lineColor={0,0,0},
              textString="°F")}));
    end degC_to_degF;

    model degC_to_K "Convert from Celsius degrees to Kelvin"
      Interfaces.RealInput_ degC annotation (Placement(transformation(extent={{-120,
                -20},{-80,20}}), iconTransformation(extent={{-140,-20},{-100,20}})));
      Interfaces.RealOutput_ K annotation (Placement(transformation(extent={{50,-20},
                {90,20}}), iconTransformation(extent={{100,-20},{140,20}})));
    equation
      K = degC + 273.15;
      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={191,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{30,0}}, color={191,0,0}),
            Polygon(
              points={{90,0},{30,20},{30,-20},{90,0}},
              lineColor={191,0,0},
              fillColor={191,0,0},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-115,155},{115,105}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{-20,100},{-100,20}},
              lineColor={0,0,0},
              textString="°C"),
            Text(
              extent={{100,-20},{20,-100}},
              lineColor={0,0,0},
            textString="K")}));
    end degC_to_K;
  end NonSIunits;

  package Utilities
    constant String ORIGINAL_DATA_FILE = "setup/default.txt"; //"setup/output2.txt"; //"../defaultParams.txt"; //"setup/v1.txt";
    constant String DATA_FILE = "setup/default.txt"; //"setup/output2.txt"; //"../defaultParams.txt"; //"setup/v1.txt";
    constant String OUTPUT_FILE = "setup/output2_s.txt"; //"setup/output.txt"; //"setup/v2.txt";
    constant String OUTPUT_DIF_FILE = "setup/dif3_s.txt"; //"setup/output2.txt"; //"../defaultParams.txt"; //"setup/v1.txt";
    function readRealParameter "Read the value of a Real parameter from file"
      import Modelica.Utilities.*;
      extends Modelica.Icons.Function;
      //parameter String PARAMETERS_FILE = "parameters/default.txt";
      input String fileName "Name of file"       annotation(Dialog(
                             __Dymola_loadSelector(filter="Text files (*.txt)",
                             caption="Open file in which Real parameters are present")));
      input String name "Name of parameter";
      output Real result "Actual value of parameter on file";
    protected
      String line;
      Integer nextIndex;
      Integer iline=1;
      Boolean found = false;
      Boolean endOfFile=false;
    algorithm
      /*#if MODELICA_STANDARD
      //added because the OMC's readLine() function returns on an non-existing file with endOfFile = false
      //which leads to an infinite loop
      if not Files.exist(fileName) then
        //result := 0;
        Streams.error("readRealParameter(\""+name+"\", \""+ fileName + "\")  Error: the file does not exist.\n");
      else
      #endif MODELICA_STANDARD*/
     (line, endOfFile) :=Streams.readLine(fileName, iline);
      while not found and not endOfFile loop
        //Streams.error(name + "  iter:"+String(iline)+" of " +fileName+"\n");
           if line == name then
               // name found, get value of "name = value;"
               (line, endOfFile) :=Streams.readLine(fileName, iline+1);
               result := Strings.scanReal(line, 1);
               found := true;
            else
               // wrong name, skip line
               iline := iline + 2;
               // read next line
               (line, endOfFile) :=Streams.readLine(fileName, iline);
            end if;
      end while;
      if not found then
       Streams.error("Parameter \"" + name + "\" not found in file \"" + fileName + "\"\n");
      end if;
    /*#if MODELICA_STANDARD    
      end if; 
      #endif MODELICA_STANDARD*/
      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
result = <b>readRealParameter</b>(fileName, name);
</pre></blockquote>
<h4>Description</h4>
<p>
This function demonstrates how a function can be implemented
that reads the value of a parameter from file. The function
performs the following actions:
</p>
<ol>
<li> It opens file \"fileName\" and reads the lines of the file.</li>
<li> In every line, Modelica line comments (\"// ... end-of-line\")
     are skipped </li>
<li> If a line consists of \"name = expression\" and the \"name\"
     in this line is identical to the second argument \"name\"
     of the function call, the expression calculator Examples.expression
     is used to evaluate the expression after the \"=\" character.
     The expression can optionally be terminated with a \";\".</li>
<li> The result of the expression evaluation is returned as
     the value of the parameter \"name\". </li>
</ol>
<h4>Example</h4>
<p>
On file \"test.txt\" the following lines might be present:
</p>
<blockquote><pre>
// Motor data
J        = 2.3     // inertia
w_rel0   = 1.5*2;  // relative angular velocity
phi_rel0 = pi/3
</pre></blockquote>
<p>
The function returns the value \"3.0\" when called as:
</p>
<blockquote><pre>
readRealParameter(\"test.txt\", \"w_rel0\")
</pre></blockquote>
</html>"));
    end readRealParameter;

    type Init = enumeration(
        NoInit
          "No abstract initialization (start values are used as guess values with fixed=false or from start=value in instances)",

        CalculateInitialSteadyState
          "Steady state initialization (derivatives of states are zero)",
        FromFile "Initialization from file");

    partial model StateSystem
    //  extends DynamicStateSteady;
    //  extends DynamicStateDynamic;
      extends DynamicStateDynamicNoInit;
      import Modelica.Utilities.*;
      Real normalizedState
        "State must be connected to the normalized sum of partial states in inherited class definition. This variable must have always the value 1.";
    protected
      Real stateVariable(start=1)
        "In differential systems has the same meaning as the normalizedState. In steady state just stay constant.";
    initial equation
      stateVariable=1;
    equation
      if STEADY then
        normalizedState = 1; //in steady state must be the normalized sum of internal states of the system always equal to one
        der(stateVariable)=0; //this additional equation must be instead redundant equation removed by steadyMain flag of some "resistance-type" block
      else
        normalizedState = stateVariable; // 1=1. The difference from the value 1 could be used as the control of solver calculation error.
      end if;
    end StateSystem;

    partial model DynamicState
    //  extends DynamicStateSteady;
    //  extends DynamicStateDynamic;
      extends DynamicStateDynamicNoInit;
      import Modelica.Utilities.*;
      parameter String stateName "state name must be unique for each instance";
      Real stateValue "state must be connected in inherited class definition";
      Real changePerMin "dynamic change of state value per minute";
      //#if not OMC
      //use the modification syntax instead ... leads to better code in OMC (maybe in Dymola, too??)
      //-> the readRealParameter() is called only once when the originalValue is bounded
      //which avoids calling the funcion repeatedly during the initialization step
      //parameter Real originalValue(fixed=false);
      parameter Real originalValue = readRealParameter(ORIGINAL_DATA_FILE, stateName);
      //#endif not OMC
      parameter Real initialValue(fixed=false);
    initial equation
      if initType == Init.CalculateInitialSteadyState then
        der(stateValue)=0;
      elseif initType == Init.FromFile then
        stateValue = readRealParameter(DATA_FILE, stateName);
      end if;
      initialValue = stateValue;
      //originalValue = readRealParameter(ORIGINAL_DATA_FILE, stateName);
    equation
      //#if not OMC
      when SAVE_VALUES and terminal() then // and  then //initial()
         Streams.print( stateName + "\n" + String(stateValue), OUTPUT_FILE);
    //     Streams.print( String(stateValue), OUTPUT_FILE);
         Streams.print( ( if (abs(originalValue)>Modelica.Constants.eps) then String( abs((stateValue-originalValue)/originalValue)) else  "Zero vs. " + String( stateValue))  + ";" + stateName + ";"  + String(initialValue) + ";" + String(stateValue) + ";" + String(originalValue),  OUTPUT_DIF_FILE);
      end when;
      //#endif not OMC
      if STEADY then
          changePerMin = 0;
    //    der(stateValue) = 0;
      else
        der(stateValue) = changePerMin/SecPerMin;             //derivation time in Modelica is in seconds
      end if;
    end DynamicState;

    partial model DynamicStateSteady
      parameter Boolean STEADY = true;
    //  parameter Boolean STEADY_BY_HOMOTOPY = false;
      parameter Boolean SAVE_VALUES = true;
      parameter Init initType = Init.NoInit;
    end DynamicStateSteady;

    partial model DynamicStateDynamic
      parameter Boolean STEADY = false;
      parameter Boolean SAVE_VALUES = true; //false;
      parameter Init initType = Init.FromFile;
    end DynamicStateDynamic;

    partial model DynamicStateDynamicNoInit
      parameter Boolean STEADY = false;
      parameter Boolean SAVE_VALUES = false;
      parameter Init initType = Init.NoInit;
    end DynamicStateDynamicNoInit;

        block ConstantFromFile
      "Generate constant signal of type Real with value from file"
          extends ModelVariable(k = readRealParameter(DATA_FILE, varName));
        //  parameter Real k(fixed=false) "Constant output value";
        //  parameter String varName;
        //   parameter String units="1";
          Physiolibraryold.Interfaces.RealOutput_ y
        "Connector of Real output signal" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0)));
        //use the modification syntax instead ... leads to better code in OMC (maybe in Dymola, too??)
        //-> the readRealParameter() is called only once when the k is bounded
        //which avoids calling the funcion repeatedly during the initialization step
        //initial equation
          //k = readRealParameter(DATA_FILE, varName);
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.1), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.1), graphics),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end ConstantFromFile;

        block VariableToFile "Save variable to file"
          extends ModelVariable;
          //only varName and units are usefuls from the ModelVariable here
          //it suggests to introduce a ModelOutputVariable block without the k
          //and then also ModelInputVariable with it
          //both could derrive from ModelVariable;
          //or the ModelInputVariable could extend the ModelOutputVariable (not very intuitive though)
          import Modelica.Utilities.*;
        //   parameter String varName;
          Interfaces.RealInput_ y "Connector of Real input signal"
            annotation (Placement(transformation(extent={{-100,-10},{-80,10}},
                rotation=0), iconTransformation(extent={{-120,-10},{-100,10}})));
        //this initial equation looks meaningless relative to this block's output semantics
        //and also as the y should take its value from another source during the simulation
        //potentially, this could cause some initialization problems, too
        //as the k will default to 0 ...
        //nevertheless, now, after the k is fixed, it should not be stated like this
        //and let the y find its value from a different source
        //initial equation
        //  k = y;
        equation
          if terminal() then
         // if initial() then
             Streams.print( varName + "\n" + String(y), OUTPUT_FILE);
        //     Streams.print( String(y), OUTPUT_FILE);
          end if;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end VariableToFile;

        block BooleanConstantFromFile
      "Generate boolean constant signal from file"
          extends ModelBooleanVariable(k = ((readRealParameter(DATA_FILE, varName) <> 0)));
        //  parameter Boolean k(fixed=false) "Constant output value";
        //  parameter String varName;
        //  parameter String units="1";
          Physiolibraryold.Interfaces.BooleanOutput y
        "Connector of Real output signal" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0)));
        //use the modification syntax instead ... leads to better code in OMC (maybe in Dymola, too??)
        //-> the readRealParameter() is called only once when the k is bounded
        //which avoids calling the funcion repeatedly during the initialization step
        //initial equation
        //  k = (readRealParameter(DATA_FILE, varName) <> 0);
        equation
          y = k;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.1), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.1), graphics),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end BooleanConstantFromFile;

        block BooleanVariableToFile "Save boolean value to file"
          import Modelica.Utilities.*;
          extends ModelBooleanVariable;
        //  parameter String varName;
          Physiolibraryold.Interfaces.BooleanInput y
        "Connector of Real output signal" annotation (Placement(transformation(
              extent={{-100,-10},{-80,10}}, rotation=0), iconTransformation(
              extent={{-100,-10},{-80,10}})));
        initial equation
          k = y;
        equation
          if initial() then
             Streams.print( varName + "\n" + String(if (y) then 1 else 0), OUTPUT_FILE);
        //     Streams.print( String(if (y) then 1 else 0), OUTPUT_FILE);
          end if;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.1), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.1), graphics),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end BooleanVariableToFile;

    function readRealParameterMultiValues
      "Read the value of a Real parameter from file"
      import Modelica.Utilities.*;
      extends Modelica.Icons.Function;
      input String fileName "Name of file"       annotation(Dialog(
                             __Dymola_loadSelector(filter="Text files (*.txt)",
                             caption="Open file in which Real parameters are present")));
      input String name "Name of parameter";
      input Integer num;
      output Real result[num] "Actual value of parameter on file";
    protected
      Integer resNum=0 "Number of values";
      String line;
      Integer nextIndex;
      Integer tmpResNum;
      Integer iline=1;
      Boolean found = false;
      Boolean endOfFile=false;
    algorithm
      /*#if MODELICA_STANDARD
      //added because the OMC's readLine() function returns on an non-existing file with endOfFile = false
      //which leads to an infinite loop
      if not Files.exist(fileName) then
        Streams.error("readRealParameterMultiValues Error: file \"" + fileName + "\" does not exist.");
      else
      #endif MODELICA_STANDARD*/
     (line, endOfFile) :=Streams.readLine(fileName, iline);
      while not found and not endOfFile loop
           if line == name then
               // name found, get value of "name = value;"
               (line, endOfFile) :=Streams.readLine(fileName, iline+1);
               resNum :=Strings.scanInteger(line, 1);
               for j in 1:resNum loop
                 iline := iline+1;
                 (line, endOfFile) :=Streams.readLine(fileName, iline+1);
                 result[j] := Strings.scanReal(line, 1);
               end for;
               found := true;
            else
               // wrong name, skip lines
               (line, endOfFile) :=Streams.readLine(fileName, iline+1);
               tmpResNum := Strings.scanInteger(line, 1);
               iline := iline + 2 + tmpResNum;
               // read next line
               (line, endOfFile) :=Streams.readLine(fileName, iline);
            end if;
      end while;
      if not found then
         Streams.error("Parameter \"" + name + "\" not found in file \"" + fileName + "\"");
      end if;
      /*#if MODELICA_STANDARD
      end if;
      #endif MODELICA_STANDARD*/
      annotation (Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
result = <b>readRealParameter</b>(fileName, name);
</pre></blockquote>
<h4>Description</h4>
<p>
This function demonstrates how a function can be implemented
that reads the value of a parameter from file. The function
performs the following actions:
</p>
<ol>
<li> It opens file \"fileName\" and reads the lines of the file.</li>
<li> In every line, Modelica line comments (\"// ... end-of-line\")
     are skipped </li>
<li> If a line consists of \"name = expression\" and the \"name\"
     in this line is identical to the second argument \"name\"
     of the function call, the expression calculator Examples.expression
     is used to evaluate the expression after the \"=\" character.
     The expression can optionally be terminated with a \";\".</li>
<li> The result of the expression evaluation is returned as
     the value of the parameter \"name\". </li>
</ol>
<h4>Example</h4>
<p>
On file \"test.txt\" the following lines might be present:
</p>
<blockquote><pre>
// Motor data
J        = 2.3     // inertia
w_rel0   = 1.5*2;  // relative angular velocity
phi_rel0 = pi/3
</pre></blockquote>
<p>
The function returns the value \"3.0\" when called as:
</p>
<blockquote><pre>
readRealParameter(\"test.txt\", \"w_rel0\")
</pre></blockquote>
</html>"));
    end readRealParameterMultiValues;
        //the MultiValuesConstantFromFile can be tranformed similarly as ConstantFromFile
        //use the modification syntax instead the initial equation
        //but, it does not appear to be used in HumMod
        block MultiValuesConstantFromFile
      "Generate constant signal of type Real with value from file"
          extends ModelVariable;
          parameter Integer num "Number of values";
          parameter Real values[num](fixed=false) "Values";
          parameter String SETUP_FILE = "setup/MV.txt";
        //  parameter String varName;
          Physiolibraryold.Interfaces.RealOutput_ y
        "Connector of Real output signal" annotation (Placement(transformation(
              extent={{100,-10},{120,10}}, rotation=0)));
          Modelica.Blocks.Interfaces.IntegerInput u annotation (Placement(
                transformation(extent={{-28,26},{12,66}}), iconTransformation(
                extent={{-20,-20},{20,20}},
                rotation=270,
                origin={0,40})));
        initial equation
          k = y;
          values = readRealParameterMultiValues(
                SETUP_FILE,
                varName,
                num);
        equation
          y = values[u];
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.1), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.1), graphics),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end MultiValuesConstantFromFile;

    package test
      model T
        MultiValuesConstantFromFile multiValuesConstantFromFile(varName="A",
            num=5)
          annotation (Placement(transformation(extent={{-16,26},{4,46}})));
        MultiValuesConstantFromFile multiValuesConstantFromFile1(varName="B",
            num=5)
          annotation (Placement(transformation(extent={{-44,-18},{-24,2}})));
        Modelica.Blocks.Sources.IntegerConstant integerConstant(k=2)
          annotation (Placement(transformation(extent={{-76,36},{-56,56}})));
      equation
        connect(integerConstant.y, multiValuesConstantFromFile1.u)
          annotation (Line(
            points={{-55,46},{-34,46},{-34,-4}},
            color={255,127,0},
            smooth=Smooth.None));
        connect(integerConstant.y, multiValuesConstantFromFile.u) annotation (
           Line(
            points={{-55,46},{-6,46},{-6,40}},
            color={255,127,0},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent=
                 {{-100,-100},{100,100}}), graphics));
      end T;
    end test;

        block NormalizedDifferenceToFile "Save variable to file"
          import Modelica.Utilities.*;
          extends ModelVariable(k = readRealParameter(ORIGINAL_DATA_FILE, varName));
        //  parameter Real k(fixed=false) "Constant output value";
        //  parameter String varName;
          parameter Real terminationPoint = 0.5;
          discrete output Real initialValue; // = -10^25;
          Interfaces.RealInput_ y "Connector of Real input signal"
            annotation (Placement(transformation(extent={{-100,-10},{-80,10}},
                rotation=0), iconTransformation(extent={{-120,-10},{-100,10}})));
        //use the modification syntax instead ... leads to better code in OMC (maybe in Dymola, too??)
        //-> the readRealParameter() is called only once when the k is bounded
        //which avoids calling the funcion repeatedly during the initialization step
        //initial equation
        //  k = readRealParameter(ORIGINAL_DATA_FILE, varName);
        equation
          //if terminal() then
        //  if terminal() and ( abs((y-k)/k) < terminationPoint or abs((y-k)/k) > 1/terminationPoint) then
        //     terminate(varName + " : base=" + String( k) + ", value=" + String(y));
        //  end if;
          when initial() then
            initialValue = y;
          end when;
          //#if not OMC
          when terminal() then
             Streams.print( ( if (abs(k)>Modelica.Constants.eps) then String( abs((y-k)/k)) else  "Zero vs. " + String( y))  + ";" + varName + ";"  + String(initialValue) + ";" + String(y) + ";" + String(k),  OUTPUT_DIF_FILE);
        //     written = true;
          end when;
          //#endif not OMC
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end NormalizedDifferenceToFile;
    //should be this called FiledVariable instead
    partial block ModelVariable
      "abstract variable of the model - could be input or output"
      //the k must be fixed to enable its initialization directly through extends modification
      //it also means, it MUST be initialized before the initialization equations solver starts
      //which is kind of a "safe" approach as it is most likely expected this variable to be initialized from file or directly
      parameter Real k(fixed=true) = 0 "Constant output value";
      parameter String varName;
      parameter String units="1";
    end ModelVariable;

        block BooleanDifferenceToFile "Save variable difference to file"
          import Modelica.Utilities.*;
        //  extends ModelVariable;
          //the k must be fixed to make this translate safely, see the comment for ModelVariable
          parameter Boolean k(fixed=true) = (readRealParameter(ORIGINAL_DATA_FILE, varName) <> 0)
        "Constant output value";
          parameter String varName;
          parameter String units="1";
          Interfaces.BooleanInput y "Connector of Real input signal"
            annotation (Placement(transformation(extent={{-100,-10},{-80,10}},
                rotation=0), iconTransformation(extent={{-120,-10},{-100,10}})));
        //use the parameter equation syntax instead ... leads to better code in OMC (maybe in Dymola, too??)
        //-> the readRealParameter() is called only once when the k is bounded
        //which avoids calling the funcion repeatedly during the initialization step
        //initial equation
        //  k = (readRealParameter(ORIGINAL_DATA_FILE, varName) <> 0);
        equation
          //if terminal() then
          if terminal() and (y <> k) then
             terminate(varName + " : base=" + String( k) + ", value=" + String(y));
          end if;
        //  if initial() then
        //     Streams.print( ( if (abs(k)>Modelica.Constants.eps) then String( abs((y-k)/k)) else  "Zero vs. " + String( y))  + ";" + varName,  OUTPUT_DIF_FILE);
        //  end if;
          annotation (
            Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics={Rectangle(
              extent={{-100,20},{100,-20}},
              lineColor={0,0,255},
              fillPattern=FillPattern.Solid,
              fillColor={255,255,255}), Text(
              extent={{-100,-10},{100,10}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              textString="%varName")}),
            Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2},
            initialScale=0.04), graphics),
        Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>
</html>"));
        end BooleanDifferenceToFile;

    partial block ModelBooleanVariable
      "abstract boolean variable of the model - could be input or output"
      //make the k fixed=true from the same reason as in ModelVariable
      parameter Boolean k(fixed=true, start=false) "Constant output value";
      parameter String varName;
      parameter String units="1";
    end ModelBooleanVariable;
  end Utilities;

  package Icons
    package Library
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,-100},{98,102}},
              fillColor={235,235,235},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Polygon(
              points={{-100,102},{-80,122},{118,122},{98,102},{-100,102}},
              fillColor={235,235,235},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Polygon(
              points={{118,122},{118,-80},{98,-100},{98,102},{118,122}},
              fillColor={235,235,235},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-120,175},{120,120}},
              lineColor={255,0,0},
              textString="%name")}));
    end Library;

    model Golem
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,98},{100,-100}},
                fileName="icons/golem.png")}));
    end Golem;

    model CardioVascular
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="icons/csv.png")}));
    end CardioVascular;

    model Water
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="icons/indexVoda.png")}));
    end Water;

    model Electrolytes
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="icons/electrolytes.png")}));
    end Electrolytes;

    model Proteins
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-98,100},{100,-100}},
                fileName="icons/protein.png")}));
    end Proteins;

    model Gases
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="icons/gases.png")}));
    end Gases;

    model NutrientsMetabolism
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="icons/vyziva.png")}));
    end NutrientsMetabolism;

    model Heat
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="icons/ohen.png")}));
    end Heat;

    model Hormones
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="icons/hormony.png")}));
    end Hormones;

    model Nerves
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,102},{100,-98}},
                fileName="icons/nervyNeuron.png")}));
    end Nerves;

    model Setup
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="icons/setup.png")}));
    end Setup;

    model Status
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-98,-100},{100,
                  100}}, fileName="icons/tissueFitness.png")}));
    end Status;

    model SkeletalMuscle
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-70,92},{40,-80}},
                fileName="icons/sval.png")}));
    end SkeletalMuscle;

    model Bone
      annotation (Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None), Bitmap(extent={{-88,96},{52,-84}},
                fileName="icons/bone.jpg")}));
    end Bone;

    model OtherTissue
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-74,60},{48,-94}},
                fileName="icons/pojivovaTkan.png")}));
    end OtherTissue;

    model RespiratoryMuscle
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-66,86},{44,-86}},
                fileName="icons/respiracniSvaly.png")}));
    end RespiratoryMuscle;

    model Fat
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-84,86},{38,-68}},
                fileName="icons/tukovaBunka.png")}));
    end Fat;

    model Skin
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-74,56},{48,-84}},
                fileName="icons/skin.jpg")}));
    end Skin;

    model Brain
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-78,62},{44,-92}},
                fileName="icons/brain.jpg")}));
    end Brain;

    model GITract
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-80,74},{42,-80}},
                fileName="icons/traviciTrakt.png")}));
    end GITract;

    model LeftHeart
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-80,100},{44,-84}},
                fileName="icons/srdceLeva.png")}));
    end LeftHeart;

    model RightHeart
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-78,70},{44,-84}},
                fileName="icons/srdceprava.png")}));
    end RightHeart;

    model Liver
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-84,34},{86,-100}},
                fileName="icons/jatra.png")}));
    end Liver;

    model Kidney
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-92,86},{40,-88}},
                fileName="icons/kidney.jpg")}));
    end Kidney;

    model Bladder
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              pattern=LinePattern.None), Bitmap(extent={{-92,86},{40,-88}},
                fileName="icons/mocovyMechyr.png")}));
    end Bladder;

    model GILumen
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="icons/traviciTrakt2.png")}));
    end GILumen;

    model ThyroidGland
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-92,86},{40,-88}},
                fileName="icons/stitnaZlaza.png")}));
    end ThyroidGland;

    model Pancreas
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="icons/pankreas.png")}));
    end Pancreas;

    model AdrenalGland
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="icons/nadledviny.png")}));
    end AdrenalGland;

    model Lungs
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-70,92},{40,-80}},
                fileName="icons/plice.png")}));
    end Lungs;

    model Tissues
      annotation (Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                -100},{100,100}}), graphics={
            Bitmap(extent={{-46,98},{32,26}}, fileName="icons/bone.jpg"),
            Bitmap(extent={{-62,-10},{50,-92}}, fileName="icons/skin.jpg"),
            Bitmap(extent={{-38,90},{64,-20}}, fileName="icons/sval.png"),
            Bitmap(extent={{-10,36},{102,-56}}, fileName=
                  "icons/traviciTrakt.png"),
            Text(
              extent={{64,-66},{94,-96}},
              lineColor={0,0,0},
              textString="..."),
            Bitmap(extent={{-98,36},{-24,-30}}, fileName="icons/brain.jpg")}));
    end Tissues;

    model Peritoneum
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-70,92},{40,-80}},
                fileName="icons/peritoneum.png")}));
    end Peritoneum;

    model Plasma
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-70,92},{40,-80}},
                fileName="icons/plazma.png")}));
    end Plasma;

    model Hypophysis
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="icons/hypofyza.png")}));
    end Hypophysis;

    model Heart
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="icons/heart.png")}));
    end Heart;

    model SweatGland
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="icons/potniZlaza.png")}));
    end SweatGland;

    model Cell
    end Cell;

    package BaseLib
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,-100},{80,50}},
              fillColor={235,235,235},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Polygon(
              points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}},
              fillColor={235,235,235},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Polygon(
              points={{100,70},{100,-80},{80,-100},{80,50},{100,70}},
              fillColor={235,235,235},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-120,122},{120,73}},
              lineColor={255,0,0},
              textString="%name")}));
    end BaseLib;

     package AutonomicControlLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-96,42},{72,-96}},
                fileName="modelica://Physiolibrary/icons/sympatetickeNervy.png")}));
     end AutonomicControlLib;

    package CardioVascularLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-96,42},{76,-100}},
                fileName="icons/csv.png")}));
    end CardioVascularLib;

    package ElectrolytesLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-78,38},{64,-94}},
                fileName="icons/electrolytes.png")}));
    end ElectrolytesLib;

    package GasesLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-88,34},{66,-82}},
                fileName="icons/gases.png")}));
    end GasesLib;

    package GolemLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-96,42},{78,-98}},
                fileName="icons/golem.png")}));
    end GolemLib;

    package HeatLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,44},{76,-82}},
                fileName="icons/ohen.png")}));
    end HeatLib;

    package HormonesLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-88,30},{74,-88}},
                fileName="icons/hormony.png")}));
    end HormonesLib;

     package KidneyLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-96,42},{72,-96}},
                fileName="modelica://Physiolibrary/icons/Kidney.jpg")}));
     end KidneyLib;

     package NervesLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-96,42},{72,-96}},
                fileName="icons/nervyNeuron.png")}));
     end NervesLib;

    package NutrientsMetabolismLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-98,40},{80,-100}},
                fileName="icons/vyziva.png")}));
    end NutrientsMetabolismLib;

    package OxygenLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-96,42},{78,-98}},
                fileName="modelica://Physiolibrary/icons/O2.jpg")}));
    end OxygenLib;

    package ProteinsLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-98,42},{76,-98}},
                fileName="icons/protein.png")}));
    end ProteinsLib;

    package SetupLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-94,44},{72,-98}},
                fileName="icons/setup.png")}));
    end SetupLib;

    package StatusLib
      extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-96,-96},{72,40}},
                fileName="icons/tissueFitness.png")}));
    end StatusLib;

    package WaterLib
     extends BaseLib;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-90,42},{72,-84}},
                fileName="icons/indexVoda.png")}));
    end WaterLib;

    partial model Resistor
     annotation (
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-70,30},{70,-30}},
              lineColor={0,0,0},
              fillColor={241,241,241},
              fillPattern=FillPattern.Solid),
            Line(points={{-90,0},{-70,0}}, color={0,0,0}),
            Line(points={{70,0},{90,0}}, color={0,0,0})}));
    end Resistor;

    model Lymph
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="icons/Lymph.png")}));
    end Lymph;

    model RespiratoryCenter
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/icons/respiracniCentrum.png")}));
    end RespiratoryCenter;

    model Oxygen
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
                      Bitmap(extent={{-100,100},{100,-100}}, fileName=
                  "modelica://Physiolibrary/icons/O2.jpg")}));
    end Oxygen;

    model Carbondioxyd
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
                      Bitmap(extent={{-100,100},{100,-100}}, fileName=
                  "modelica://Physiolibrary/icons/prvkyCO2.png")}));
    end Carbondioxyd;

    model AcidBase
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
                      Bitmap(extent={{-100,100},{100,-100}}, fileName=
                  "modelica://Physiolibrary/icons/acidobaze.png")}));
    end AcidBase;

    model Ventilation
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="icons/dychani.png")}));
    end Ventilation;

    model PeripheralChemoreceptors
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,-100}},
                fileName="modelica://Physiolibrary/icons/baroreflex.png")}));
    end PeripheralChemoreceptors;

    model HeatCore
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{
                -100,-100},{100,100}}), graphics={Bitmap(extent={{-100,100},{
                  100,-100}}, fileName=
                  "modelica://Physiolibrary/icons/torzo2.png")}));
    end HeatCore;

    model Glycogen
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={
                                 Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/glykogen.png")}));
    end Glycogen;

    model Lipids
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/FattyAcid.jpg")}));
    end Lipids;

    model KetoAcids
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/KetoAcid.jpg")}));
    end KetoAcids;

    model Glucose
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/icons/glucose.jpg")}));
    end Glucose;

    model Lactate
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/icons/Lactate.jpg")}));
    end Lactate;

    model AminoAcids
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/AminoAcid.jpg")}));
    end AminoAcids;

    model Urea
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/icons/Urea.jpg")}));
    end Urea;

    model MetabolismPart
      annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                {100,120}}),            graphics), Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-100,-100},{100,120}}),
            graphics={             Rectangle(
              extent={{-100,120},{100,-100}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
                                   Bitmap(extent={{28,120},{98,44}}, fileName=
                 "icons/ohen.png")}));
    end MetabolismPart;

    model CellularMetabolism
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/cellularMetabolism.png")}));
    end CellularMetabolism;

    model FemaleSex
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/hormonesFemaleSex.png")}));
    end FemaleSex;

    model Barroreceptor
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/baroreflex.png")}));
    end Barroreceptor;

    model NervusVagus
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/icons/vagus.png")}));
    end NervusVagus;

    model SympatheticNerves
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/sympatetickeNervy.png")}));
    end SympatheticNerves;

    model PhysicalExercise
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/icons/cviceni.png")}));
    end PhysicalExercise;

    model SinoatrialNode
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/icons/SANode.png")}));
    end SinoatrialNode;

    block StatusNormal
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/siluetaNormal.png")}));
    end StatusNormal;

    block StatusConfused
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/siluetaZmateni.png")}));
    end StatusConfused;

    block StatusImpaired
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/siluetaVaznejsiStav.png")}));
    end StatusImpaired;

    block StatusNotBreathing
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/siluetaNedychaSam.png")}));
    end StatusNotBreathing;

    block StatusComatose
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/siluetaKoma.png")}));
    end StatusComatose;

    block StatusMayBeDead
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/siluetaSkoroMrtvy.png")}));
    end StatusMayBeDead;

    block StatusIsReallyDead
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/siluetaMrtvy.png")}));
    end StatusIsReallyDead;

    model SkeletalMuscleAcidity
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/kyselostVeSvalech.png")}));
    end SkeletalMuscleAcidity;

    model Sodium
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/icons/Na.jpg")}));
    end Sodium;

    model Potassium
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/icons/K.jpg")}));
    end Potassium;

    model Phosphate
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/icons/fosfat.png")}));
    end Phosphate;

    model Sulphate
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/sulfat02.png")}));
    end Sulphate;

    model Amonium
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/icons/NH4.jpg")}));
    end Amonium;

    model Chloride
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/icons/Cl.jpg")}));
    end Chloride;

    model LungShunt
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/lungBloodFlow.jpg")}));
    end LungShunt;

    model Hydrostatics
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/pressureMeassure.png")}));
    end Hydrostatics;

    model UpperTorso
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/icons/torzo1.png")}));
    end UpperTorso;

    model MidleTorso
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/icons/torzo2.png")}));
    end MidleTorso;

    model LowerTorso
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName="modelica://Physiolibrary/icons/torzo3.png")}));
    end LowerTorso;

    model RedCells
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/cervenaKrvinka.png")}));
    end RedCells;

    model SystemicCirculation
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/krevniRecisteSiluetacloveka.png")}));
    end SystemicCirculation;

    model PulmonaryCirculation
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/circulationLungs.png")}));
    end PulmonaryCirculation;

    model Blood
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/bloodProperties.jpg")}));
    end Blood;

    model BloodElasticCompartment
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/elastickyKompartment.png")}));
    end BloodElasticCompartment;

    model BloodSequesteredCompartment
      annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}}), graphics={Bitmap(extent={{-100,100},{100,
                  -100}}, fileName=
                  "modelica://Physiolibrary/icons/sequerestedVolume.png")}));
    end BloodSequesteredCompartment;
  end Icons;

  package Media
    partial package SimpleBlood
      "Simple Blood medium model like a Modelica.Media.Water.ConstantPropertyLiquidWater"
      extends Modelica.Media.Interfaces.PartialSimpleMedium(
         cp_const=0.997*4.178*994.1,
         cv_const=0.997*4.178*994.1,
         d_const = 994.1,
         eta_const=1.e-3,
         lambda_const=0.598,
         a_const=1484,
         T_min=273.15 + 5,
         T_max=273.15 + 45,
         T0=273.15,
         MM_const=0.018015268,
         fluidConstants= Modelica.Media.Water.simpleWaterConstants,
        extraPropertiesNames = {"O2","CO2","Hct","THox","Alb","Glb","PO4","DPG","FHbF","FMetHb","FCOHb"},
        final mediumName =   "Blood",
        final substanceNames={ "H2O"},
        Temperature(start=320.15));
     constant Real HbRBC(unit="mol/m3", displayUnit="mmol/l")=8.4/0.44
        "concentration of hemoglobin in red blood cells";
    /*
redeclare record BloodBaseProperties
    SpecificEnthalpy h "Specific enthalpy of medium";
    ExtraProperty[nC] C "Extra properties of medium";

    Temperature T "Temperature of medium";
    Modelica.SIunits.Conversions.NonSIunits.Temperature_degC T_degC 
      "Temperature of medium in [degC]";

    Real ctO2(unit="mol/m3", displayUnit="mmol/l") "total oxygen concentration";
    Real ctCO2(unit="mol/m3", displayUnit="mmol/l") "total CO2 concentration";
    Real Hct(unit="1") "hematocrit";
    Real ctTHox(unit="mol/m3", displayUnit="mmol/l") 
      "total titratable H+ ion concentration in fully oxygenizated blood";
    Real BEox(unit="mol/m3", displayUnit="mmol/l") 
      "base excess in fully oxygenizated blood";
    Real ctHb(unit="mol/m3", displayUnit="mmol/l") 
      "total hemoglobin concentration";
    Real FHbF(unit="1") "fraction of foetalhemoglobin";
    Real FMetHb(unit="1") "fraction of methemoglobin";
    Real FCOHb(unit="1") "fraction of carboxyhemoglobin";
    Real ceHb(unit="mol/m3", displayUnit="mmol/l") 
      "effective haemoglobin concentration";
    Real ctAlb(unit="mol/m3", displayUnit="mmol/l") 
      "total albumin concentration";
    Real ctGlb(unit="g/l", displayUnit="g/l") "total globulin concentration";
    Real ctPO4(unit="mol/m3", displayUnit="mmol/l") 
      "total phosphates concentration";
    Real cDPG(unit="mol/m3", displayUnit="mmol/l") 
      "total biphosphoglycerate concentration";
end BloodBaseProperties;
*/
     replaceable partial class BaseBloodProperties
        "Base blood properties (h,C) of a medium"
        //Input
        SpecificEnthalpy h "Specific enthalpy of medium";
        //Input
        ExtraProperty[nC] C "Extra properties of medium";
        Temperature T = T0 + h/cp_const "Temperature of medium";
        Modelica.SIunits.Conversions.NonSIunits.Temperature_degC T_degC=
           Modelica.SIunits.Conversions.to_degC(T)
          "Temperature of medium in [degC]";
        Real ctO2(unit="mol/m3", displayUnit="mmol/l") = C[1]
          "total oxygen concentration";
        Real ctCO2(unit="mol/m3", displayUnit="mmol/l") = C[2]
          "total CO2 concentration";
        Real Hct(unit="1") = C[3] "hematocrit";
        Real ctTHox(unit="mol/m3", displayUnit="mmol/l") = C[4]
          "total titratable H+ ion concentration in fully oxygenizated blood";
        Real BEox(unit="mol/m3", displayUnit="mmol/l") = -C[4]
          "base excess in fully oxygenizated blood";
        Real ctHb(unit="mol/m3", displayUnit="mmol/l") = C[3]*HbRBC
          "total hemoglobin concentration";
        Real FHbF(unit="1") = C[10] "fraction of foetalhemoglobin";
        Real FMetHb(unit="1") = C[10] "fraction of methemoglobin";
        Real FCOHb(unit="1") = C[11] "fraction of carboxyhemoglobin";
        Real ceHb(unit="mol/m3", displayUnit="mmol/l") = ctHb * (1-FCOHb-FMetHb)
          "effective haemoglobin concentration";
        Real ctAlb(unit="mol/m3", displayUnit="mmol/l") = C[5]
          "total albumin concentration";
        Real ctGlb(unit="g/l", displayUnit="g/l") = C[6]
          "total globulin concentration";
        Real ctPO4(unit="mol/m3", displayUnit="mmol/l") = C[7]
          "total phosphates concentration";
        Real cDPG(unit="mol/m3", displayUnit="mmol/l") = C[8]
          "total biphosphoglycerate concentration";
        connector InputExtraProperty = input ExtraProperty
          "Extra property as input signal connector";
        connector InputSpecificEnthalpy = input
            Modelica.SIunits.SpecificEnthalpy
          "Specific enthalpy as input signal connector";
     end BaseBloodProperties;

     replaceable class BloodProperties
        extends BaseBloodProperties;
      parameter Boolean isSaturated = false;
      Real betaX(unit = "mEq/l") "buffer value of blood";
      Real betaP(unit = "mEq/l") "buffer value of plasma";
      Real ctTH( unit="mEq/l") "total concentration of tiratable hydrogen ions";
      Real BE( unit="mEq/l") "base excess";
      Real pH "plasma pH";
      Real pH_ery "intracellular erytrocytes pH";
      Real cO2Hb(start=6.1) "concentration of oxygenated hemoglobin";
      Real sO2 "hemoglobin oxygen saturation";
      Real aO2 "solubility of free oxygen";
      Modelica.SIunits.Pressure pO2(start=7000,displayUnit="kPa")
          "partial oxygen pressure";
      Real sO2CO(start=0.8) "hemoglobin saturation with O2 and CO";
      Modelica.SIunits.Pressure pO2CO(start=7000,displayUnit="kPa")
          "partial oxygen pressure";
      Real sCO "hemoglobin saturation with CO";
      Modelica.SIunits.Pressure pCO(displayUnit="kPa")
          "partial oxygen pressure";
      Modelica.SIunits.Pressure pCO2(start=5330, displayUnit="Pa")
          "partial oxygen pressure";
      Real cHCO3(final unit="mmol/l")
          "concentration of plasma HCO3 ions (default=24.5mmol/l)";
       Real tCO2_P(start=24, final unit="mmol/l")
          "total plasme CO2 concentration";
       Real pK_ery "Handersom Hesselbach coeficient in erythrocytes";
       Real pK "Handersom Hesselbach coeficient in plasma";
       Real aCO2_ery(final unit="(mmol/l)/mmHg")
          "solubility of CO2 in arythrocytes";
       Real aCO2(final unit="(mmol/l)/mmHg") "solubility of CO2 in plasma";
       Real tCO2_ery(final unit="mmol/l") "total CO2 in erythrocytes";
       Real cdCO2(final unit="mmol/l") "free disolved CO2";
       Real pO2_mmHg(unit="mmHg") = pO2*(760/101325);
       Real pCO2_mmHg(unit="mmHg") = pCO2*(760/101325);
     //protected
      Real a(start=0.4);
      Real ey;
      Real k;
       Real tnh;
       Real ex;
       Real ey0;
       Real cdO2;
     //  Real pH_;
      parameter Real cHb(unit="mmol/l")=43
          "an empirical parameter accounting for erythrocyte plasma distributions = concentration of Hb inside erythrocytes divided by (1-0.57)";
     equation
      /************ pH ********************/
      //Van Slyke equation:  - T_degC=37
      ctTH = -(1-ctHb/cHb)*((cHCO3-24.5)+betaX*(pH-7.4)); //  _cTH = -(1-(1-0.57)*(0.44))*((cHCO3-24.5)+betaX*(pH-7.4));
     // pH = 7.4 - homotopy( (1/betaX)*(ctTH/(1-ctHb/cHb) + (cHCO3-24.5)),  0);
      betaX = 2.3*ctHb + betaP; //  _betaX = 0.11 * plasmaProteinConc(unit="g/l"); //mmol/l
      betaP =  8*ctAlb + 0.075*ctGlb + 0.309*ctPO4;
      //Haldane effect:
      ctTH = ctTHox - 0.3 * (1-sO2) * ceHb;
      //base excess
      BE = - ctTH;
      //erythrocytes:
      pH_ery = 7.19 + 0.77*(pH-7.4) + 0.035*(1-sO2);
      /************ pH ********************/
      /************ O2 ********************/
      assert(ctO2 <= ceHb*(1.06), "Model does not support this high level of oxygen in blood. Maximum of oxygen concentration should be connected with efective hemoglobin concentration!");
        //pO2,pCO,pCO2 .. Pa
      aO2 = exp(log(0.0105)+(-0.0115*(T_degC-37))+0.5*0.00042*(T_degC-37)^2)/1000; //solubility
      cdO2 = aO2*pO2;
      if (isSaturated) then
        cdO2 = homotopy( ctO2 - sO2*ceHb, ctO2 - 0.9999*ceHb);
      else
        sO2 = homotopy( (ctO2-cdO2)/ceHb,  ctO2/ceHb);  // ctO2 = aO2*pO2 + ceHb*sO2;  nazaciatok postaci veskery kyslik mat iba na hemoglobine a potom pridat uz len to zrnko rozpusteneho..
      end if;
      sO2 = cO2Hb/ceHb;
      //TANH
      a=-0.88*(pH-7.4)+0.048*log(pCO2/5330)-0.7*FMetHb+(0.3-0.1*FHbF)*(cDPG/5 - 1);
      //simplification:
      ey/ey0=ex*exp((3.5 + a)*tnh);  //TANH:  y-log(0.867/(1-0.867))=x+(3.5 + a)*tanh(0.5342857*x);
      ey0=0.867/(1-0.867);  //y0=log(0.867/(1-0.867)); //1.8747
      tnh = ((ex*ex)^k - 1) / ((ex*ex)^k + 1);  // = tanh(k*x)
     // assert(pO2CO>0, "pO2CO < 0 !");
      ex=(pO2CO/7000) / exp(a + 0.055*(T_degC-37));  // = exp(x); x=log(max(1e-15*(1+1e-6*pO2CO),pO2CO/7000)) - a - 0.055*(T_degC-37);
      k=0.5342857;
      ey=sO2CO/(1-sO2CO); // = exp(y);  y=log(max(1e-15*(1+1e-6*sO2CO/(1-sO2CO)),sO2CO/(1-sO2CO)));
      /************ O2 ********************/
      /************ CO ********************/
      //Haldane:
      pCO = sCO*pO2CO/ 218*sO2CO;
      pO2CO = pO2 + 218*pCO;
      sO2CO = (cO2Hb + ctHb*FCOHb)/(ctHb*(1-FMetHb));
      sCO = ctHb*FCOHb/(ctHb*(1-FMetHb));
      //simplification:
     /* pCO=0;
 sCO=0;
 pO2CO=pO2;
 sO2CO=sO2;*/
      /************ CO ********************/
      /************ CO2 ********************/
        tCO2_P = cHCO3 + cdCO2;
        //erythrocytes:
        pK_ery = 6.125 - log10(1+10^(pH_ery-7.84-0.06*sO2));
        tCO2_ery=aCO2_ery*pCO2*(1+10^(pH_ery-pK_ery));
        aCO2_ery=0.195/1000; //solubility
        //plasma+erythrocyte
        ctCO2 = tCO2_ery*Hct + tCO2_P*(1-Hct);
        //Henderson-Hasselbalch equation in plasma:
        pK = 6.1 + (-0.0026)*(T_degC-37);
        aCO2 = (0.23 * 10^(-0.0092*(T_degC-37)))/1000; //solubility depends on temperature
        cdCO2 = aCO2*pCO2;
        cHCO3 = cdCO2 * 10^(pH-pK);
      /************ CO2 ********************/
     //   baseBloodProperties.h = 37*cp_const;
     //   baseBloodProperties.C = {8.4*1.06,21.3,0.44,0.0227,0.66,28,0.169,5.4,0,0,0};
     end BloodProperties;

        class BloodPropertiesByPO2Change
          extends BloodProperties;
          Real der_ctTH_by_pO2;
        Real der_pH_ery_by_pO2;
        Real der_pH_by_pO2;
        Real der_ctO2_by_pO2;
        Real der_sO2_by_pO2;
        Real der_a_by_pO2;
        Real der_ey_by_pO2;
        Real der_tnh_by_pO2;
        Real der_ex_by_pO2;
        Real der_cO2Hb_by_pO2;
        Real der_pCO_by_pO2;
        Real der_sO2CO_by_pO2;
        Real der_sCO_by_pO2;
        Real der_tCO2_P_by_pO2;
        Real der_pCO2_by_pO2;
        Real der_pK_ery_by_pO2;
        Real der_tCO2_ery_by_pO2;
        Real der_cHCO3_by_pO2;
        equation
        der_ctTH_by_pO2 = -(1 - ctHb/cHb)*(der_cHCO3_by_pO2 + betaX*(der_pH_by_pO2));
        der_ctTH_by_pO2 = -0.3*(-der_sO2_by_pO2)*ceHb;
        der_pH_ery_by_pO2 = 0.77*(der_pH_by_pO2) + 0.035*(-der_sO2_by_pO2);
        der_ctO2_by_pO2 = aO2 + der_sO2_by_pO2*ceHb;
        der_sO2_by_pO2 = der_cO2Hb_by_pO2/ceHb;
        der_a_by_pO2 = -0.88*(der_pH_by_pO2) + 0.048*(der_pCO2_by_pO2/5330)/(pCO2/5330);
        der_ey_by_pO2 = ey0*(der_ex_by_pO2*exp((3.5 + a)*tnh) + ex*(der_a_by_pO2*
          tnh + (3.5 + a)*der_tnh_by_pO2)*exp((3.5 + a)*tnh));
        der_tnh_by_pO2 = (4*k*(der_ex_by_pO2)*(ex^(2*k-1)))/((ex^(2*k) + 1)^2);
        der_ex_by_pO2 = (((1.0/7000) - (pO2CO/7000)*der_a_by_pO2)*exp(a + 0.055*(
          T_degC - 37)))/exp(2*(a + 0.055*(T_degC - 37)));
        der_ey_by_pO2 = (der_sO2CO_by_pO2)/((1 - sO2CO)^2);
        der_pCO_by_pO2 = (sCO/218)*((sO2CO - pO2CO*der_sO2CO_by_pO2)/(sO2CO^2));
        der_sO2CO_by_pO2 = (der_cO2Hb_by_pO2)/(ctHb*(1 - FMetHb));
        der_sCO_by_pO2 = 0;  //TODO!!
        der_tCO2_P_by_pO2 = der_cHCO3_by_pO2 + aCO2*der_pCO2_by_pO2;
        der_pK_ery_by_pO2 = -(((der_pH_ery_by_pO2 - 0.06*der_sO2_by_pO2)*10^(pH_ery -
          7.84 - 0.06*sO2))/(1 + 10^(pH_ery - 7.84 - 0.06*sO2)));
        der_tCO2_ery_by_pO2 = aCO2_ery*(der_pCO2_by_pO2*(1 + 10^(pH_ery - pK_ery)) +
          pCO2*log(10)*(der_pH_ery_by_pO2 - der_pK_ery_by_pO2)*10^(pH_ery - pK_ery));
        0 = der_tCO2_ery_by_pO2*Hct + der_tCO2_P_by_pO2*(1 - Hct);
        der_cHCO3_by_pO2 = aCO2*der_pCO2_by_pO2*10^(pH - pK) + cdCO2*(log(10)*(
          der_pH_by_pO2))*exp(log(10)*(pH - pK));
        end BloodPropertiesByPO2Change;

      model ArtysTest
        BloodProperties baseBloodProperties(isSaturated=true)
          annotation (Placement(transformation(extent={{-18,18},{2,38}})));
      equation
         baseBloodProperties.h = 37*cp_const;
         baseBloodProperties.C = {8.4*1.06,21.3,0.44,0.0227,0.66,28,0.169,5.4,0,0,0};
      end ArtysTest;

      model VeinTest
        BloodProperties baseBloodProperties
          annotation (Placement(transformation(extent={{-18,18},{2,38}})));
      equation
         baseBloodProperties.h = 37*cp_const;
         baseBloodProperties.C = {6.326,22.83,0.44,0.0227,0.66,28,0.169,5.4,0,0,0};
      end VeinTest;

      model Test
        ArtysTest artysTest
          annotation (Placement(transformation(extent={{-62,-34},{-42,-14}})));
        VeinTest veinTest
          annotation (Placement(transformation(extent={{-6,-32},{14,-12}})));
      end Test;
      annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end SimpleBlood;

    package SimpleAir "Air: Simple dry air model (0..100 degC)"
      extends Modelica.Media.Interfaces.PartialSimpleIdealGasMedium(
        mediumName="SimpleAir",
        cp_const=1005.45,
        MM_const=0.0289651159,
        R_gas=Constants.R/0.0289651159,
        eta_const=1.82e-5,
        lambda_const=0.026,
        T_min=Cv.from_degC(0),
        T_max=Cv.from_degC(100),
        extraPropertiesNames = {"O2","CO2","CO","N2"});
      import SI = Modelica.SIunits;
      import Cv = Modelica.SIunits.Conversions;
      import Modelica.Constants;
      constant FluidConstants[nS] fluidConstants=
        FluidConstants(iupacName={"simple air"},
                       casRegistryNumber={"not a real substance"},
                       chemicalFormula={"N2, O2, CO2"},
                       structureFormula={"N2, O2, CO2"},
                       molarMass=Modelica.Media.IdealGases.Common.SingleGasesData.N2.MM)
        "constant data for the fluid";
      annotation (Documentation(info="<html>
                              <h4>Simple Ideal gas air model for low temperatures</h4>
                              <p>This model demonstrats how to use the PartialSimpleIdealGas base class to build a
                              simple ideal gas model with a limited temperature validity range.</p>
                              </html>"));
    end SimpleAir;

    partial package BodyFluid
      "Simple solution medium model for blood plasma or for erythrocyte cytosol or for interstitial fluid or for intracellular fluids or for celebbrospinal fluid or for urine..."
     constant String SoluteNames[:] = {
        "Sodium Na^+",
        "Chloride CL^-, Alb(CL3),..Alb(CL22)",
        "Pottasium K^+",
        "Calcium Ca^2+, Alb(Ca),Alb(Ca2)",
        "Magnesium Mg^2+",
        "Sulphates H2SO4,HSO4^-,SO4^2-",
        "Phosphates H3PO4,H2PO4^-,HPO4^2-,PO4^3-",
        "Albumin in all forms Alb^118-,..(H211)Alb^93+, Alb(Cl),Alb(Ca)",
        "2,3-Diphosphoglycerate 2,3-D(H4)P(H)G,.., 2,3-DPG^5-",
        "Haemoglobin tetramer Hb^34-,(H81)Hb^47+,(0-4xO2)Hb(0-4xCOOH)",
        "Other proteins and peptides",
        "Amino acids",
        "Fatty acids",
        "Glucose",
        "Lactate (H)Lac,Lac^-",
        "AcetoAcetate (H)AcAc,AcAc^-",
        "Beta-Hydroxybutyrate (H)b-HB,b-HB^-",
        "Other organic acids",
        "Adenosine triphosphate ATP",
        "Oxygen O2,(O2)Hb,(O2)Hb(COO-)",
        "Carbon dioxide CO2,H2CO3,HCO3^-,CO3^2-,Hb(COO-),(O2)Hb(COO-)"};
     type S = enumeration(
          Na,
          Cl,
          K,
          Ca,
          Mg,
          SO4,
          PO4,
          Alb,
          DPG,
          Hb,
          Pr,
          AA,
          FA,
          Glu,
          Lac,
          AcAc,
          bHB,
          Org,
          ATP,
          O2,
          CO2);
      //TODO: Hemoglobin
      constant Real[nX] normalErythrocyteValences(each unit="Eq/Mol")= {
         1,
         -1,
         1,
         2,
         2,
         -2,
         -1.52,
          0,
         -4.62,
          -0.21,
          0,
          0,
          0,
          0,
          -1,
          -1,
          -1,
          -1,
          -3.65,
          0,
          -0.92}
        "Average charges on molecule on normal erythrocyte cytosol conditions: pH=7.19, T=37degC, pCO2=40mmHG, sO2=1, I=0.15";
     constant Real[nX] normalPlasmaValences(each unit="Eq/Mol")= {
         1,
         -1,
         1,
         2,
         2,
         -2,
         -1.64,
         -18.5375425382473,
          0,
          -0.9,
          1.12515,
          -0.95,
          -0.07,
          0,
          -1,
          -1,
          -1,
          -1,
          -3.65,
          0,
          -0.95}
        "Average charges on molecule on normal conditions: pH=7.4, T=37degC, pCO2=40mmHG, sO2=1, I=0.15";
     //TODO: Org(is set to reach base excess = 0), other organic acids, other proteins concentration, haemoglobin tertamer concentration,
     constant Real[nX] normalArterialErythrocyteConcentrations(each unit="mmol/l")= {
         7.35,
         67.9,
         102,
         0.02,
         2,
         1,
         0.087,
         0,
         5,
         5.6,
         0,
         6.2,
         7,
         0,
         0.84,
         0,
         0,
         2.45676,
         1.3,
         22.1,
         12} "Concentration of the solutes in normal human plasma";
     //TODO: check other organic acids, gases concentrations and other proteins concentration (2.8 g/dl was chosen to fullfill the total plasma proteins to 7.2g/dl)
     constant Real[nX] normalArterialPlasmaConcentrations(each unit="mmol/l")= {
         140,
         104,
         4.03,
         1.26,
         0.78,
         0.33,
         1.1,
         0.66,
         0,
         0,
         0.19,
         3.4,
         13,
         5,
         0.76,
         0.04,
         0.08,
         0,
         0,
         0.135,
         25.9} "Concentration of the solutes in normal human plasma";
     //TODO: better values for: other organic acids, other proteins, albumin(is from Siggaard), fatty acids, amino acids
     constant Real[nX] soluteMollarMass(each unit="g/mol")= {
         22.989770,
         35.4527,
         39.0983,
         40.078,
         24.305,
         98.079,
         97.995,
         66438,
         266.04,
         64458,
         145000,
         127,
         3920,
         180.15588,
         90.08,
         102.09,
         104.10,
         103,
         507.184,
         31.998,
         44.01} "mollarMasses for the solutes";
      constant Real waterDensity(unit="kg/l")=1.025;
      constant Real specificHeat(unit="J/(kg.K)")=4187;
      extends Modelica.Media.Interfaces.PartialMedium(
        mediumName =   "BodyFluid",
        substanceNames = SoluteNames,
        Temperature(start=320.15),
        singleState = true,
        reducedX = false);
      redeclare replaceable record extends ThermodynamicState
        "thermodynamic state variables"
          AbsolutePressure p "Absolute pressure of medium";
          Temperature T "Temperature of medium";
          MassFraction X[nX]
          "Mass fractions (= (component mass)/total mass  m_i/m)";
      end ThermodynamicState;
      annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end BodyFluid;

    package Interfaces
    partial package PartialMixtureAcidBaseMedium
        "Base class for pure substances of several chemical substances with sum of pH dependent electic charges equals to zero"
        extends Modelica.Media.Interfaces.PartialMedium;
        redeclare replaceable record extends ThermodynamicState
          "thermodynamic state variables"
          AbsolutePressure p "Absolute pressure of medium";
          Temperature T "Temperature of medium";
          MassFraction X[nX]
            "Mass fractions (= (component mass)/total mass  m_i/m)";
        end ThermodynamicState;
      constant FluidConstants[nS] fluidConstants "constant data for the fluid";
        function moleToMassFractions
          "Return mass fractions X from mole fractions"
          extends Modelica.Icons.Function;
          input Modelica.SIunits.MoleFraction moleFractions[:]
            "Mole fractions of mixture";
          input MolarMass[:] MMX "molar masses of components";
          output Modelica.SIunits.MassFraction X[size(moleFractions, 1)]
            "Mass fractions of gas mixture";
        protected
          MolarMass Mmix =  moleFractions*MMX "molar mass of mixture";
        algorithm
          for i in 1:size(moleFractions, 1) loop
            X[i] := moleFractions[i]*MMX[i] /Mmix;
          end for;
          annotation(smoothOrder=5);
        end moleToMassFractions;

        function massToMoleFractions
          "Return mole fractions from mass fractions X"
          extends Modelica.Icons.Function;
          input Modelica.SIunits.MassFraction X[:] "Mass fractions of mixture";
          input Modelica.SIunits.MolarMass[:] MMX "molar masses of components";
          output Modelica.SIunits.MoleFraction moleFractions[size(X, 1)]
            "Mole fractions of gas mixture";
        protected
          Real invMMX[size(X, 1)] "inverses of molar weights";
          Modelica.SIunits.MolarMass Mmix "molar mass of mixture";
        algorithm
          for i in 1:size(X, 1) loop
            invMMX[i] := 1/MMX[i];
          end for;
          Mmix := 1/(X*invMMX);
          for i in 1:size(X, 1) loop
            moleFractions[i] := Mmix*X[i]/MMX[i];
          end for;
          annotation(smoothOrder=5);
        end massToMoleFractions;
    end PartialMixtureAcidBaseMedium;

      package Common
        partial model AcidBaseSubstance
          replaceable partial function z
            "Return titration charge of one molecule of substance as function of pH, T and ionic strength"
            extends Modelica.Icons.Function;
            input Real pH "acidity of solution";
            input Temperature T "Temperature";
            input Real I "Ionic strength";
            output Real z "charge of molecule";
          end z;
        end AcidBaseSubstance;

        model Substance
          input Real allSubstancesFractions[:];
          AcidBaseSubstance acidBaseSubstances[:];
          parameter Integer na=size(acidBaseSubstances,1);
          Real acidBaseSubstancesFractions[na];
          Real z;
        end Substance;
      end Common;
    end Interfaces;

    partial package BodyFluid2
      "Simple solution medium model for blood plasma or for erythrocyte cytosol or for interstitial fluid or for intracellular fluids or for celebbrospinal fluid or for urine..."
     constant String SoluteNames[:] = {
        "Water H2O",
        "Sodium Na^+",
        "Chloride CL^-, Alb(CL3),..Alb(CL22)",
        "Pottasium K^+",
        "Calcium Ca^2+, Alb(Ca),Alb(Ca2)",
        "Magnesium Mg^2+",
        "Sulphates H2SO4,HSO4^-,SO4^2-",
        "Phosphates H3PO4,H2PO4^-,HPO4^2-,PO4^3-",
        "Albumin in all forms Alb^118-,..(H211)Alb^93+, Alb(Cl),Alb(Ca)",
        "2,3-Diphosphoglycerate 2,3-D(H4)P(H)G,.., 2,3-DPG^5-",
        "Haemoglobin tetramer Hb^34-,(H81)Hb^47+,(0-4xO2)Hb(0-4xCOOH)",
        "Other proteins and peptides",
        "Amino acids",
        "Fatty acids",
        "Glucose",
        "Lactate (H)Lac,Lac^-",
        "AcetoAcetate (H)AcAc,AcAc^-",
        "Beta-Hydroxybutyrate (H)b-HB,b-HB^-",
        "Other organic acids",
        "Adenosine triphosphate ATP",
        "Oxygen O2,(O2)Hb,(O2)Hb(COO-)",
        "Free Carbon dioxide CO2",
        "Bicarbonate HCO3^-",
        "Other form of CO2: H2CO3,CO3^2-,Hb(COO-),(O2)Hb(COO-)",
        "Another uncharged solutes"};
     type S = enumeration(
          H2O,
          Na,
          Cl,
          K,
          Ca,
          Mg,
          SO4,
          PO4,
          Alb,
          DPG,
          Hb,
          Pr,
          AA,
          FA,
          Glu,
          Lac,
          AcAc,
          bHB,
          Org,
          ATP,
          O2,
          fCO2,
          HCO3,
          H2CO3,
          aus);
      constant Real QuickReactionRate(each unit="1/sec") = 1e5;
      constant Integer[:] StatePlasmaSolutes= {S.H2O, S.Na, S.Cl, S.K, S.Ca, S.Mg, S.SO4, S.PO4, S.Alb, S.DPG, S.Hb, S.Pr, S.AA, S.FA, S.Glu, S.Lac, S.AcAc, S.bHB, S.Org, S.ATP, S.O2, S.fCO2, S.HCO3, S.aus};
      constant Integer[:] StablePlasmaSolutes= {S.H2O, S.Na, S.Cl, S.K, S.Ca, S.Mg, S.SO4, S.PO4, S.Alb, S.DPG, S.Hb, S.Pr, S.AA, S.FA, S.Glu, S.Lac, S.AcAc, S.bHB, S.Org, S.ATP, S.O2, S.aus};
     /* constant Real Ka_CO2 = 
  
  //CO2 <-> H2CO3 by Garg&Maren1971
  constant Real[nX,nX] plasmaUniReactionRates(each unit="1/sec") = {
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,49.6,0}, //fCO2
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,oCO2,0}, //HCO3
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0.145,HCO3,0,0}, //oCO2
      {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
  };
*/
      //TODO: Hemoglobin, oCO2
      constant Real[nX] normalErythrocyteValences(each unit="Eq/Mol")= {
         0,
         1,
         -1,
         1,
         2,
         2,
         -2,
         -1.52,
          0,
         -4.62,
          -0.21,
          0,
          0,
          0,
          0,
          -1,
          -1,
          -1,
          -1,
          -3.65,
          0,
          0,
          -1,
          0,
          0}
        "Average charges on molecule on normal erythrocyte cytosol conditions: pH=7.19, T=37degC, pCO2=40mmHG, sO2=1, I=0.15";
     //TODO oCO2
     constant Real[nX] normalPlasmaValences(each unit="Eq/Mol")= {
         0,
         1,
         -1,
         1,
         2,
         2,
         -2,
         -1.64,
         -18.5375425382473,
          0,
          -0.9,
          1.12515,
          -0.95,
          -0.07,
          0,
          -1,
          -1,
          -1,
          -1,
          -3.65,
          0,
          0,
          -1,
          0,
          0}
        "Average charges on molecule on normal conditions: pH=7.4, T=37degC, pCO2=40mmHG, sO2=1, I=0.15";
     //TODO: oCO2, Org(is set to reach base excess = 0), other organic acids, other proteins concentration, haemoglobin tertamer concentration,
     constant Real[nX] normalArterialErythrocyteConcentrations(each unit="mmol/l")= {
         55500*waterDensity,
         7.35,
         67.9,
         102,
         0.02,
         2,
         1,
         0.087,
         0,
         5,
         5.6,
         0,
         6.2,
         7,
         0,
         0.84,
         0,
         0,
         2.45676,
         1.3,
         22.1,
         1.2,
         10.8,
         0.006,
         50} "Concentration of the solutes in normal human plasma";
     //TODO: oCO2, check other organic acids, gases concentrations and other proteins concentration (2.8 g/dl was chosen to fullfill the total plasma proteins to 7.2g/dl)
     constant Real[nX] normalArterialPlasmaConcentrations(each unit="mmol/l")= {
         55500*waterDensity,
         140,
         104,
         4.03,
         1.26,
         0.78,
         0.33,
         1.1,
         0.66,
         0,
         0,
         0.19,
         3.4,
         13,
         5,
         0.76,
         0.04,
         0.08,
         0,
         0,
         0.135,
         1.2,
         24.7,
         0.006,
         0} "Concentration of the solutes in normal human plasma";
     //TODO: better values for: other organic acids, other proteins, albumin(is from Siggaard), fatty acids, amino acids
     constant Real[nX] soluteMollarMass(each unit="g/mol")= {
         18.01528,
         22.989770,
         35.4527,
         39.0983,
         40.078,
         24.305,
         98.079,
         97.995,
         66438,
         266.04,
         64458,
         145000,
         127,
         3920,
         180.15588,
         90.08,
         102.09,
         104.10,
         103,
         507.184,
         31.998,
         44.01,
         44.01,
         44.01,
         100} "mollarMasses for the solutes";
      constant Real waterDensity(unit="kg/l")=1.025;
      constant Real specificHeat(unit="J/(kg.K)")=4187;
      constant Real[nX] nominalMass(each unit="mg") = soluteMollarMass .* normalArterialPlasmaConcentrations;
      extends Modelica.Media.Interfaces.PartialMedium(
        mediumName =   "BodyFluid",
        substanceNames = SoluteNames,
        Temperature(start=320.15),
        singleState = true,
        reducedX = false);
      redeclare replaceable record extends ThermodynamicState
        "thermodynamic state variables"
          AbsolutePressure p "Absolute pressure of medium";
          Temperature T "Temperature of medium";
          MassFraction X[nX]
          "Mass fractions (= (component mass)/total mass  m_i/m)";
      end ThermodynamicState;
      annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"));
    end BodyFluid2;
  end Media;

  package Fluid
    package Blood
      model Measurement
       extends Modelica.Icons.RotationalSensor;
       extends BloodMedium.BloodProperties;
       replaceable package BloodMedium =
            Physiolibraryold.Media.SimpleBlood "Blood Medium"
          annotation(choicesAllMatching=true);
        Modelica.Fluid.Interfaces.FluidPort_a port(redeclare package Medium =
              BloodMedium)
          annotation (Placement(transformation(extent={{-10,-88},{10,-68}}),
              iconTransformation(extent={{-10,-90},{10,-70}})));
      equation
        C = inStream(port.C_outflow);
        h = inStream(port.h_outflow);
        port.m_flow=0;
        port.h_outflow = 0;
        port.Xi_outflow = zeros(BloodMedium.nXi);
        port.C_outflow = zeros(BloodMedium.nC);
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                  {100,100}}),
                            graphics), Icon(graphics));
      end Measurement;

      model GasMembrane
       replaceable package BloodMedium =
            Physiolibraryold.Media.SimpleBlood "Blood Medium"
          annotation(choicesAllMatching=true);
       replaceable package AirMedium =
            Physiolibraryold.Media.SimpleAir "Air Medium"
          annotation(choicesAllMatching=true);
        Modelica.Fluid.Interfaces.FluidPort_a gas_in(redeclare package Medium
            =                                                                   AirMedium)
          annotation (Placement(transformation(extent={{-10,90},{10,110}})));
        Modelica.Fluid.Interfaces.FluidPort_b gas_out(redeclare package Medium
            =                                                                    AirMedium)
          annotation (Placement(transformation(extent={{-4,-108},{16,-88}})));
        Modelica.Fluid.Interfaces.FluidPort_a blood_in(redeclare package Medium
            = BloodMedium)
          annotation (Placement(transformation(extent={{-108,2},{-88,22}})));
        Modelica.Fluid.Interfaces.FluidPort_b blood_out(redeclare package
            Medium =
              BloodMedium)
          annotation (Placement(transformation(extent={{90,0},{110,20}})));
        Real gasSpecificHeatCapacity;
        Real bloodSpecificHeatCapacity;
      //  Real T;
        BloodMedium.BloodProperties finalBloodProperties(isSaturated=true);
      equation
        gas_in.m_flow + gas_out.m_flow = 0;
        blood_in.m_flow + blood_out.m_flow = 0;
        gas_in.p = gas_out.p;
        blood_in.p = blood_out.p;
       //not permeable substances
       gas_in.m_flow*(if gas_in.m_flow > 0 then inStream(gas_in.Xi_outflow) else gas_in.Xi_outflow)
        = - gas_out.m_flow*(if gas_out.m_flow > 0 then inStream(gas_out.Xi_outflow) else gas_out.Xi_outflow);
       //not permeable substances
        blood_in.m_flow*(if blood_in.m_flow > 0 then inStream(blood_in.Xi_outflow) else blood_in.Xi_outflow)
        = - blood_out.m_flow*(if blood_out.m_flow > 0 then inStream(blood_out.Xi_outflow) else blood_out.Xi_outflow);
       for i in 1:2 loop //O2,CO2
          0 =
            blood_in.m_flow *  ((if (blood_in.m_flow>0) then inStream(blood_in.C_outflow) else blood_in.C_outflow)[i]) +
            blood_out.m_flow * ((if (blood_out.m_flow>0) then inStream(blood_out.C_outflow) else blood_out.C_outflow)[i]) +
            gas_in.m_flow * ((if (gas_in.m_flow>0) then inStream(gas_in.C_outflow) else gas_in.C_outflow)[i]) +
            gas_out.m_flow * ((if (gas_out.m_flow>0) then inStream(gas_out.C_outflow) else gas_out.C_outflow)[i]);
       end for;
      // assert(blood_in.m_flow<=0, "Not supported blood direction!");
       finalBloodProperties.h = blood_out.h_outflow;
       finalBloodProperties.C = blood_out.C_outflow;
        gas_out.C_outflow[1] = finalBloodProperties.pO2 / ( Modelica.Constants.R * finalBloodProperties.T);
        gas_out.C_outflow[2] = finalBloodProperties.pCO2/ ( Modelica.Constants.R * finalBloodProperties.T);
      //  gas_out.C_outflow[1] = 13000 / ( Modelica.Constants.R * (273.15+37)); //finalBloodProperties.T);
      //  gas_out.C_outflow[2] = 5330 / ( Modelica.Constants.R * (273.15+37)); // finalBloodProperties.T);
        for i in 3:BloodMedium.nC loop //not permeable substances
          0 = blood_in.m_flow * (if (blood_in.m_flow>0) then inStream(blood_in.C_outflow) else blood_in.C_outflow)[i] +
            blood_out.m_flow * (if (blood_out.m_flow>0) then inStream(blood_out.C_outflow) else blood_out.C_outflow)[i];
        //  blood_out.C_outflow[i] = (if (blood_in.m_flow>0) then inStream(blood_in.C_outflow) else blood_in.C_outflow)[i];
        end for;
        for i in 3:AirMedium.nC loop //not permeable substances
           0 = gas_in.m_flow * (if (gas_in.m_flow>0) then inStream(gas_in.C_outflow) else gas_in.C_outflow)[i] +
            gas_out.m_flow * (if (gas_out.m_flow>0) then inStream(gas_out.C_outflow) else gas_out.C_outflow)[i];
        //   gas_out.C_outflow[i]=(if (gas_in.m_flow>0) then inStream(gas_in.C_outflow) else gas_in.C_outflow)[i];
        end for;
        gasSpecificHeatCapacity=AirMedium.specificHeatCapacityCp(  AirMedium.setState_phX(gas_in.p, inStream(gas_in.h_outflow), inStream(gas_in.Xi_outflow)));
        bloodSpecificHeatCapacity=BloodMedium.specificHeatCapacityCp(  BloodMedium.setState_phX(blood_in.p, inStream(blood_in.h_outflow), inStream(blood_in.Xi_outflow)));
        //teplota vychadzajuceho vzduchu aj krvi sa vyrovna
      //  (if gas_in.m_flow > 0 then gas_out.h_outflow else gas_in.h_outflow)/gasSpecificHeatCapacity  = T;
      //  T = (if blood_in.m_flow > 0 then blood_out.h_outflow else blood_in.h_outflow)/bloodSpecificHeatCapacity;
        AirMedium.T0 + (if gas_in.m_flow > 0 then gas_out.h_outflow else gas_in.h_outflow)/gasSpecificHeatCapacity  =
        BloodMedium.T0 + (if blood_in.m_flow > 0 then blood_out.h_outflow else blood_in.h_outflow)/bloodSpecificHeatCapacity;
        0 = blood_in.m_flow * (if (blood_in.m_flow>0) then inStream(blood_in.h_outflow) else blood_in.h_outflow) +
            blood_out.m_flow * (if (blood_out.m_flow>0) then inStream(blood_out.h_outflow) else blood_out.h_outflow) +
            gas_in.m_flow * (if (gas_in.m_flow>0) then inStream(gas_in.h_outflow) else gas_in.h_outflow) +
            gas_out.m_flow * (if (gas_out.m_flow>0) then inStream(gas_out.h_outflow) else gas_out.h_outflow);
        blood_out.h_outflow = gas_in.h_outflow;
        blood_in.h_outflow = gas_out.h_outflow;
        gas_out.Xi_outflow = gas_in.Xi_outflow;
        blood_out.Xi_outflow = blood_in.Xi_outflow;
        gas_out.C_outflow = gas_in.C_outflow;
        blood_out.C_outflow = blood_in.C_outflow;
        annotation (Diagram(graphics));
      end GasMembrane;

      model Termostat
        replaceable package BloodMedium =
            Physiolibraryold.Media.SimpleBlood "Blood Medium"
          annotation(choicesAllMatching=true);
          replaceable package WaterMedium =
            Modelica.Media.Water.ConstantPropertyLiquidWater "Water Medium"
          annotation(choicesAllMatching=true);
        Modelica.Fluid.Interfaces.FluidPort_a blood_in(redeclare package Medium
            = BloodMedium)
          annotation (Placement(transformation(extent={{-112,-10},{-92,10}})));
        Modelica.Fluid.Interfaces.FluidPort_b blood_out(redeclare package
            Medium =
              BloodMedium)
          annotation (Placement(transformation(extent={{88,-10},{108,10}})));
        Modelica.Fluid.Interfaces.FluidPort_a water_in(redeclare package Medium
            = WaterMedium)
          annotation (Placement(transformation(extent={{-10,90},{10,110}})));
        Modelica.Fluid.Interfaces.FluidPort_b water_out(redeclare package
            Medium =
              WaterMedium)
          annotation (Placement(transformation(extent={{-8,-108},{12,-88}})));
        Real waterSpecificHeatCapacity;
        Real bloodSpecificHeatCapacity;
      equation
        water_in.m_flow + water_out.m_flow = 0;
        blood_in.m_flow + blood_out.m_flow = 0;
        water_in.p = water_out.p;
        blood_in.p = blood_out.p;
        water_in.m_flow*(if water_in.m_flow > 0 then inStream(water_in.Xi_outflow) else water_in.Xi_outflow)
        = - water_out.m_flow*(if water_out.m_flow > 0 then inStream(water_out.Xi_outflow) else water_out.Xi_outflow);
        water_out.Xi_outflow = water_in.Xi_outflow;
        water_in.m_flow*(if water_in.m_flow > 0 then inStream(water_in.C_outflow) else water_in.C_outflow)
        = -  water_out.m_flow*(if water_out.m_flow > 0 then inStream(water_out.C_outflow) else water_out.C_outflow);
        water_out.C_outflow = water_in.C_outflow;
        blood_in.m_flow*(if blood_in.m_flow > 0 then inStream(blood_in.Xi_outflow) else blood_in.Xi_outflow)
        = - blood_out.m_flow*(if blood_out.m_flow > 0 then inStream(blood_out.Xi_outflow) else blood_out.Xi_outflow);
        blood_out.Xi_outflow = blood_in.Xi_outflow;
        blood_in.m_flow*(if blood_in.m_flow > 0 then inStream(blood_in.C_outflow) else blood_in.C_outflow)
        = -  blood_out.m_flow*(if blood_out.m_flow > 0 then inStream(blood_out.C_outflow) else blood_out.C_outflow);
        blood_out.C_outflow = blood_in.C_outflow;
        waterSpecificHeatCapacity=WaterMedium.specificHeatCapacityCp(  WaterMedium.setState_phX(water_in.p, inStream(water_in.h_outflow), inStream(water_in.Xi_outflow)));
        bloodSpecificHeatCapacity=BloodMedium.specificHeatCapacityCp(  BloodMedium.setState_phX(blood_in.p, inStream(blood_in.h_outflow), inStream(blood_in.Xi_outflow)));
        (if water_in.m_flow > 0 then water_out.h_outflow else water_in.h_outflow)/waterSpecificHeatCapacity  =
        (if blood_in.m_flow > 0 then blood_out.h_outflow else blood_in.h_outflow)/bloodSpecificHeatCapacity;
                                                                                                            //teplota vytekajucej vody aj krvi sa vyrovna
        0 = blood_in.m_flow * (if (blood_in.m_flow>0) then inStream(blood_in.h_outflow) else blood_in.h_outflow) +
            blood_out.m_flow * (if (blood_out.m_flow>0) then inStream(blood_out.h_outflow) else blood_out.h_outflow) +
            water_in.m_flow * (if (water_in.m_flow>0) then inStream(water_in.h_outflow) else water_in.h_outflow) +
            water_out.m_flow * (if (water_out.m_flow>0) then inStream(water_out.h_outflow) else water_out.h_outflow);
        blood_out.h_outflow = water_in.h_outflow;
        blood_in.h_outflow = water_out.h_outflow;
        annotation (Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                  -100},{100,100}}),
                            graphics));
      end Termostat;

      package Examples
        model ECMO
         replaceable package BloodMedium =
              Physiolibraryold.Media.SimpleBlood "Blood Medium"
            annotation(choicesAllMatching=true);
          replaceable package AirMedium =
              Physiolibraryold.Media.SimpleAir "Air Medium"
            annotation(choicesAllMatching=true);
           replaceable package WaterMedium =
              Modelica.Media.Water.ConstantPropertyLiquidWater "Water Medium"
            annotation(choicesAllMatching=true);
          Modelica.Fluid.Sources.MassFlowSource_T air(
            redeclare package Medium = AirMedium,
            C={(20/100)*101325/(Modelica.Constants.R*(273.15 + 37)),(0.03/100)*
                101325/(Modelica.Constants.R*(273.15 + 37)),0,(79/100)*101325/(
                Modelica.Constants.R*(273.15 + 37))},
            nPorts=1,
            m_flow=4/60,
            T=310.15)
            annotation (Placement(transformation(extent={{-6,42},{14,62}})));
          Modelica.Fluid.Sources.MassFlowSource_T veins(
            redeclare package Medium = BloodMedium,
            use_m_flow_in=false,
            use_T_in=false,
            use_C_in=false,
            use_X_in=false,
            C={6.326,22.83,0.44,0.0227,0.66,28,0.169,5.4,0,0,0},
            m_flow=5/60,
            nPorts=1,
            T=308.15)
            annotation (Placement(transformation(extent={{-94,-14},{-74,6}})));
          Modelica.Fluid.Sources.Boundary_pT boundary(
            p(displayUnit="kPa") = 101000,
            redeclare package Medium = AirMedium,
            nPorts=1)
            annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                rotation=90,
                origin={14,-74})));
          Modelica.Fluid.Sources.Boundary_pT boundary1(
            p(displayUnit="kPa") = 101000,
            redeclare package Medium = BloodMedium,
            nPorts=1)
            annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                rotation=180,
                origin={90,-2})));
          inner Modelica.Fluid.System system
            annotation (Placement(transformation(extent={{48,30},{68,50}})));
          Physiolibraryold.Fluid.Blood.GasMembrane gasMembrane2_1
            annotation (Placement(transformation(extent={{4,-16},{24,4}})));
          Physiolibraryold.Fluid.Blood.Termostat termostat
            annotation (Placement(transformation(extent={{-46,-14},{-26,6}})));
          Modelica.Fluid.Sources.MassFlowSource_T heatedWater(
            nPorts=1,
            redeclare package Medium = WaterMedium,
            m_flow=4*60,
            T=311.15)
            annotation (Placement(transformation(extent={{-66,42},{-46,62}})));
          Modelica.Fluid.Sources.Boundary_pT boundary2(
            p(displayUnit="kPa") = 101000,
            redeclare package Medium = WaterMedium,
            nPorts=1)
            annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                rotation=90,
                origin={-36,-70})));
          Modelica.Fluid.Sensors.TemperatureTwoPort temperature3(redeclare
              package Medium =
                       WaterMedium) annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                rotation=270,
                origin={-36,-32})));
          Modelica.Fluid.Sensors.Temperature temperature1(redeclare package
              Medium =
                WaterMedium)
            annotation (Placement(transformation(extent={{-46,52},{-26,72}})));
          Physiolibraryold.Fluid.Blood.Measurement measurement4_1
            annotation (Placement(transformation(extent={{28,4},{48,24}})));
          Physiolibraryold.Fluid.Blood.Measurement measurement4_2
            annotation (Placement(transformation(extent={{-22,8},{-2,28}})));
          Physiolibraryold.Fluid.Blood.Measurement measurement4_3
            annotation (Placement(transformation(extent={{-68,10},{-48,30}})));
        equation
          connect(gasMembrane2_1.gas_in,air. ports[1]) annotation (Line(
              points={{14,4},{14,52}},
              color={0,127,255},
              smooth=Smooth.None));
          connect(gasMembrane2_1.gas_out, boundary.ports[1]) annotation (Line(
              points={{14.6,-15.8},{14.6,-39.9},{14,-39.9},{14,-64}},
              color={0,127,255},
              smooth=Smooth.None));
          connect(gasMembrane2_1.blood_out, boundary1.ports[1]) annotation (Line(
              points={{24,-5},{52,-5},{52,-2},{80,-2}},
              color={0,127,255},
              smooth=Smooth.None));
          connect(veins.ports[1], termostat.blood_in) annotation (Line(
              points={{-74,-4},{-46.2,-4}},
              color={0,127,255},
              smooth=Smooth.None));
          connect(temperature3.port_b, boundary2.ports[1])
                                                          annotation (Line(
              points={{-36,-42},{-36,-60}},
              color={0,127,255},
              smooth=Smooth.None));
          connect(termostat.water_out,temperature3. port_a) annotation (Line(
              points={{-35.8,-13.8},{-35.8,-17.9},{-36,-17.9},{-36,-22}},
              color={0,127,255},
              smooth=Smooth.None));
          connect(termostat.water_in,temperature1. port) annotation (Line(
              points={{-36,6},{-36,52}},
              color={0,127,255},
              smooth=Smooth.None));
          connect(temperature1.port, heatedWater.ports[1]) annotation (Line(
              points={{-36,52},{-46,52}},
              color={0,127,255},
              smooth=Smooth.None));
          connect(termostat.blood_out, gasMembrane2_1.blood_in) annotation (Line(
              points={{-26.2,-4},{-12,-4},{-12,-4.8},{4.2,-4.8}},
              color={0,127,255},
              smooth=Smooth.None));
          connect(measurement4_1.port, gasMembrane2_1.blood_out) annotation (Line(
              points={{38,6},{38,-5},{24,-5}},
              color={0,127,255},
              smooth=Smooth.None));
          connect(termostat.blood_out, measurement4_2.port) annotation (Line(
              points={{-26.2,-4},{-12,-4},{-12,10}},
              color={0,127,255},
              smooth=Smooth.None));
          connect(termostat.blood_in, measurement4_3.port) annotation (Line(
              points={{-46.2,-4},{-58,-4},{-58,12}},
              color={0,127,255},
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end ECMO;

        model SimpleWholeBodyGases
          Physiolibraryold.Fluid.Blood.SimpleAlveolarPerfusion alveolarPerfusion
            annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
          Physiolibraryold.Fluid.Blood.SimpleMetabolism metabolism
            annotation (Placement(transformation(extent={{8,-40},{-12,-20}})));
          Physiolibraryold.Fluid.Blood.Measurement measurement2
            annotation (Placement(transformation(extent={{40,-4},{60,16}})));
          Physiolibraryold.Fluid.Blood.Measurement measurement3
            annotation (Placement(transformation(extent={{-56,4},{-36,24}})));
          Physiolibraryold.Fluid.Blood.BloodFlowSource bloodFlow
            annotation (Placement(transformation(extent={{34,-30},{54,-10}})));
        equation
          connect(alveolarPerfusion.blood_in, metabolism.blood_out) annotation (Line(
              points={{-11.8,1.2},{-30,1.2},{-30,-28.6},{-12,-28.6}},
              color={0,127,255},
              smooth=Smooth.None));
          connect(alveolarPerfusion.blood_out, measurement2.port) annotation (Line(
              points={{8,1},{30,1},{30,-2},{50,-2}},
              color={0,127,255},
              smooth=Smooth.None));
          connect(measurement3.port, alveolarPerfusion.blood_in) annotation (Line(
              points={{-46,6},{-46,1.2},{-11.8,1.2}},
              color={0,127,255},
              smooth=Smooth.None));
          connect(alveolarPerfusion.blood_out, bloodFlow.blood_in) annotation (Line(
              points={{8,1},{22,1},{22,-18.8},{34.2,-18.8}},
              color={0,127,255},
              smooth=Smooth.None));
          connect(bloodFlow.blood_out, metabolism.blood_in) annotation (Line(
              points={{54,-18.6},{68,-18.6},{68,-42},{18,-42},{18,-28.8},{7.8,-28.8}},
              color={0,127,255},
              smooth=Smooth.None));
          annotation (Diagram(graphics));
        end SimpleWholeBodyGases;
      end Examples;

      model SimpleAlveolarPerfusion
       replaceable package BloodMedium =
            Physiolibraryold.Media.SimpleBlood "Blood Medium"
          annotation(choicesAllMatching=true);
        Modelica.Fluid.Interfaces.FluidPort_a blood_in(redeclare package Medium
            = BloodMedium)
          annotation (Placement(transformation(extent={{-108,2},{-88,22}})));
        Modelica.Fluid.Interfaces.FluidPort_b blood_out(redeclare package
            Medium =
              BloodMedium)
          annotation (Placement(transformation(extent={{90,0},{110,20}})));
       // Real gasSpecificHeatCapacity;
      //  Real bloodSpecificHeatCapacity;
        parameter Real pO2=(101325/760)*100;
        parameter Real pCO2=(101325/760)*40;
      //  Real T;
        BloodMedium.BloodProperties finalBloodProperties(isSaturated=true);
      equation
        blood_in.m_flow + blood_out.m_flow = 0;
        blood_in.p = blood_out.p;
       //not permeable substances
        blood_in.m_flow*(if blood_in.m_flow > 0 then inStream(blood_in.Xi_outflow) else blood_in.Xi_outflow)
        = - blood_out.m_flow*(if blood_out.m_flow > 0 then inStream(blood_out.Xi_outflow) else blood_out.Xi_outflow);
       blood_in.m_flow*(if blood_in.m_flow > 0 then inStream(blood_in.h_outflow) else blood_in.h_outflow)
        = - blood_out.m_flow*(if blood_out.m_flow > 0 then inStream(blood_out.h_outflow) else blood_out.h_outflow);
      /* for i in 1:2 loop //O2,CO2
    0 =
      blood_in.m_flow *  ((if (blood_in.m_flow>0) then inStream(blood_in.C_outflow) else blood_in.C_outflow)[i]) +
      blood_out.m_flow * ((if (blood_out.m_flow>0) then inStream(blood_out.C_outflow) else blood_out.C_outflow)[i]) +
      gas_in.m_flow * ((if (gas_in.m_flow>0) then inStream(gas_in.C_outflow) else gas_in.C_outflow)[i]) +
      gas_out.m_flow * ((if (gas_out.m_flow>0) then inStream(gas_out.C_outflow) else gas_out.C_outflow)[i]);
 end for;
*/
      // assert(blood_in.m_flow<=0, "Not supported blood direction!");
       finalBloodProperties.h = blood_out.h_outflow;
       finalBloodProperties.C = blood_out.C_outflow;
       finalBloodProperties.pO2= pO2;
       finalBloodProperties.pCO2= pCO2;
        for i in 3:BloodMedium.nC loop //not permeable substances
          0 = blood_in.m_flow * (if (blood_in.m_flow>0) then inStream(blood_in.C_outflow) else blood_in.C_outflow)[i] +
            blood_out.m_flow * (if (blood_out.m_flow>0) then inStream(blood_out.C_outflow) else blood_out.C_outflow)[i];
        //  blood_out.C_outflow[i] = (if (blood_in.m_flow>0) then inStream(blood_in.C_outflow) else blood_in.C_outflow)[i];
        end for;
        blood_out.h_outflow = blood_in.h_outflow;
        blood_out.Xi_outflow = blood_in.Xi_outflow;
        blood_out.C_outflow = blood_in.C_outflow;
        annotation (Diagram(graphics), Icon(graphics));
      end SimpleAlveolarPerfusion;

      model SimpleMetabolism
       replaceable package BloodMedium =
            Physiolibraryold.Media.SimpleBlood "Blood Medium"
          annotation(choicesAllMatching=true);
        Modelica.Fluid.Interfaces.FluidPort_a blood_in(redeclare package Medium
            = BloodMedium)
          annotation (Placement(transformation(extent={{-108,2},{-88,22}})));
       // Real gasSpecificHeatCapacity;
      //  Real bloodSpecificHeatCapacity;
        parameter Real RQ(unit="1")= 0.8 "respiratory quotient";
        parameter Real MR(unit="kcall/day")=1800 "metabolism rate";
        parameter Real MetabolismOxygenEfectivity(unit="ml/kcall") = 0.2093
          "how much oxygen need to be consumped to create one kcall";
        Real qO2(unit="mol/s") = ((MetabolismOxygenEfectivity*MR)/(24*60*60))*((101325/273.15)/Modelica.Constants.R)
          "O2 metabolic consumption";
      //  Real qO2(unit="mol/s") = 165.502 * (10^(-3)) "O2 metabolic consumption";
        Real qCO2(unit="mol/s") = RQ* (qO2) "CO2 metabolic production";  //130.1191 * (10^(-6))
       // BloodMedium.BloodProperties finalBloodProperties(isSaturated=true);
        Modelica.Fluid.Interfaces.FluidPort_b blood_out(redeclare package
            Medium =
              BloodMedium)
          annotation (Placement(transformation(extent={{90,4},{110,24}})));
      equation
        blood_in.m_flow + blood_out.m_flow = 0;
        blood_in.p = blood_out.p;
       //not permeable substances
        blood_in.m_flow*(if blood_in.m_flow > 0 then inStream(blood_in.Xi_outflow) else blood_in.Xi_outflow)
        = - blood_out.m_flow*(if blood_out.m_flow > 0 then inStream(blood_out.Xi_outflow) else blood_out.Xi_outflow);
       blood_in.m_flow*(if blood_in.m_flow > 0 then inStream(blood_in.h_outflow) else blood_in.h_outflow)
        = - blood_out.m_flow*(if blood_out.m_flow > 0 then inStream(blood_out.h_outflow) else blood_out.h_outflow);
        for i in 3:BloodMedium.nC loop //not permeable substances
          0 = blood_in.m_flow * (if (blood_in.m_flow>0) then inStream(blood_in.C_outflow) else blood_in.C_outflow)[i] +
            blood_out.m_flow * (if (blood_out.m_flow>0) then inStream(blood_out.C_outflow) else blood_out.C_outflow)[i];
        end for;
        0 = blood_in.m_flow * (if (blood_in.m_flow>0) then inStream(blood_in.C_outflow) else blood_in.C_outflow)[1] +
            blood_out.m_flow * (if (blood_out.m_flow>0) then inStream(blood_out.C_outflow) else blood_out.C_outflow)[1] - qO2;
        0 = blood_in.m_flow * (if (blood_in.m_flow>0) then inStream(blood_in.C_outflow) else blood_in.C_outflow)[2] +
            blood_out.m_flow * (if (blood_out.m_flow>0) then inStream(blood_out.C_outflow) else blood_out.C_outflow)[2] + qCO2;
        blood_out.h_outflow = blood_in.h_outflow;
        blood_out.Xi_outflow = blood_in.Xi_outflow;
        blood_out.C_outflow = blood_in.C_outflow;
        annotation (Diagram(graphics), Icon(graphics));
      end SimpleMetabolism;

      model BloodFlowSource
       replaceable package BloodMedium =
            Physiolibraryold.Media.SimpleBlood "Blood Medium"
          annotation(choicesAllMatching=true);
        Modelica.Fluid.Interfaces.FluidPort_a blood_in(redeclare package Medium
            = BloodMedium)
          annotation (Placement(transformation(extent={{-108,2},{-88,22}})));
       // Real gasSpecificHeatCapacity;
      //  Real bloodSpecificHeatCapacity;
        Real CO(unit="l/min") = 5 "cardiac output";
        Real P(unit="mmHg") = 100 "output pressure";
        Real T(unit="degC") = 37;
        Real Xi[BloodMedium.nX-1];
        Real C[:]={6.326,22.83,0.44,0.0227,0.66,28,0.169,5.4,0,0,0};
       // BloodMedium.BloodProperties finalBloodProperties(isSaturated=true);
        Modelica.Fluid.Interfaces.FluidPort_b blood_out(redeclare package
            Medium =
              BloodMedium)
          annotation (Placement(transformation(extent={{90,4},{110,24}})));
      equation
        blood_in.m_flow = CO/60;
        assert( blood_in.m_flow == -blood_out.m_flow,  "Inflow and outflow does not fit");
        blood_out.p = P*(760/101325);
        blood_in.m_flow*(if blood_in.m_flow > 0 then Xi else blood_in.Xi_outflow)
        = - blood_out.m_flow*(if blood_out.m_flow > 0 then Xi else blood_out.Xi_outflow);
       blood_in.m_flow*(if blood_in.m_flow > 0 then T* BloodMedium.cp_const else blood_in.h_outflow)
        = - blood_out.m_flow*(if blood_out.m_flow > 0 then T*BloodMedium.cp_const else blood_out.h_outflow);
      // blood_in.m_flow * (if (blood_in.m_flow>0) then inStream(blood_in.C_outflow) else blood_in.C_outflow)
      //  = - blood_out.m_flow * (if (blood_out.m_flow>0) then inStream(blood_out.C_outflow) else blood_out.C_outflow);
       for i in 3:BloodMedium.nC loop //not permeable substances
          0 = blood_in.m_flow * (if (blood_in.m_flow>0) then C else blood_in.C_outflow)[i] +
            blood_out.m_flow * (if (blood_out.m_flow>0) then C else blood_out.C_outflow)[i];
       end for;
        0 = blood_in.m_flow * (if (blood_in.m_flow>0) then inStream(blood_in.C_outflow) else blood_in.C_outflow)[1] +
            blood_out.m_flow * (if (blood_out.m_flow>0) then inStream(blood_out.C_outflow) else blood_out.C_outflow)[1];
        0 = blood_in.m_flow * (if (blood_in.m_flow>0) then inStream(blood_in.C_outflow) else blood_in.C_outflow)[2] +
            blood_out.m_flow * (if (blood_out.m_flow>0) then inStream(blood_out.C_outflow) else blood_out.C_outflow)[2];
        blood_out.h_outflow = blood_in.h_outflow;
        blood_out.Xi_outflow = blood_in.Xi_outflow;
        blood_out.C_outflow = blood_in.C_outflow;
        annotation (Diagram(graphics), Icon(graphics));
      end BloodFlowSource;
    end Blood;

    package Blood2
      model Plasma
       extends SimpleBodyFluidCompartment(initialConcentrations=Medium.normalArterialPlasmaConcentrations, normalValences = Medium.normalPlasmaValences, stateSolutes=Medium.StatePlasmaSolutes);
        parameter Real pH=7.4;
      equation
        for i in Medium.StablePlasmaSolutes loop
          internalChanges[i] = 0;
        end for;
        //fast H2CO3 <-> HCO3
        1.59e-4 = (10^(-pH))*concentrations[Medium.S.HCO3]/concentrations[Medium.S.H2CO3];  //Ka1=10^(-3.7986)
        //slow CO2 <-> H2CO3
        internalChanges[Medium.S.fCO2]=-0.145*concentrations[Medium.S.fCO2]+49.6*concentrations[Medium.S.H2CO3];
        internalChanges[Medium.S.H2CO3]= -internalChanges[Medium.S.fCO2] - internalChanges[Medium.S.HCO3];
        annotation (Diagram(graphics), Icon(graphics),
          experiment(StopTime=100, Tolerance=1e-009),
          __Dymola_experimentSetupOutput);
      end Plasma;

      model Erythrocyte
       extends SimpleBodyFluidCompartment(initialConcentrations=Medium.normalArterialErythrocyteConcentrations, normalValences = Medium.normalErythrocyteValences);
      //internalChanges(mmol/sec)
      equation
        internalChanges = zeros(Medium.nS);
      end Erythrocyte;

      model Blood
        Plasma plasma
          annotation (Placement(transformation(extent={{-6,18},{14,38}})));
        Erythrocyte erythrocyte
          annotation (Placement(transformation(extent={{-6,-42},{14,-22}})));
        ErythrocyteMembrane membrane "erythrocyte membrane"
          annotation (Placement(transformation(extent={{-6,-12},{14,8}})));
        Modelica.Fluid.Interfaces.FluidPorts_a ports_a[2](redeclare package
            Medium = Physiolibrary.Media.BodyFluid2)
          annotation (Placement(transformation(extent={{86,-40},{106,40}})));
      equation
        connect(membrane.port_inside, erythrocyte.membrane) annotation (Line(
            points={{4,-11},{4,-23}},
            color={127,0,0},
            smooth=Smooth.None));
        connect(membrane.port_outside, plasma.membrane) annotation (Line(
            points={{4,7},{4,37}},
            color={127,0,0},
            smooth=Smooth.None));
        connect(erythrocyte.port_a, ports_a[2]) annotation (Line(
            points={{14,-32},{64,-32},{64,20},{96,20}},
            color={0,127,255},
            smooth=Smooth.Bezier));
        connect(plasma.port_a, ports_a[1]) annotation (Line(
            points={{14,28},{64,28},{64,-20},{96,-20}},
            color={0,127,255},
            smooth=Smooth.Bezier));
        annotation (Diagram(graphics));
      end Blood;

      partial model SimpleBodyFluidCompartment
        replaceable package Medium =
            Physiolibraryold.Media.BodyFluid2 "Body fluid Medium"
          annotation(choicesAllMatching=true);
        Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium
            =                                                                   Medium)
          annotation (Placement(transformation(extent={{90,-10},{110,10}})));
        parameter Real initialVolume(unit="l")=1;
        parameter Real initialConcentrations[Medium.nS](each unit="mMol/l");
        parameter Real initialTemperature(unit="K")=273.15+37;
        parameter Real normalValences[Medium.nS](each unit="Eq/Mol");
        parameter Integer stateSolutes[:];
        Real masses[Medium.nS](each unit="mg"); //, nominal=Medium.nominalMass);
        Real internalChanges[Medium.nS](each unit="mmol/sec"); //, nominal=Medium.soluteMollarMass.*Medium.nominalMassChange);
        Real waterVolume(unit="l");
        Real heat(unit="J");
        Real concentrations[Medium.nS](each unit="mmol/l");
        Real baseExcess(each unit="mEq/l");
        Interfaces.ConcentrationPorts_a membrane[Medium.nS]
          "concentrations and solutes bidirectional flows on membrane"  annotation (Placement(transformation(extent={{-10,90},{10,110}}), iconTransformation(extent={{-40,80},
                  {40,100}})));
      initial equation
       // waterVolume = initialVolume;
        for i in stateSolutes loop
          masses[i] = (Medium.soluteMollarMass[i]*initialConcentrations[i]*initialVolume);
        end for;
        heat = initialTemperature*initialVolume*Medium.waterDensity*Medium.specificHeat; //(unit="J/(kg.K)")=4187
      equation
      //  der(waterVolume) = port_a.m_flow/Medium.waterDensity; //*(1-ones(Medium.nXi)*port_a.Xi_outflow)
        der(masses) = membrane.q  +  port_a.m_flow*1000000*actualStream(port_a.Xi_outflow) + (Medium.soluteMollarMass.*internalChanges);  // mg/sec
        waterVolume = (masses[Medium.S.H2O]/1000000)/Medium.waterDensity;
        der(heat) = port_a.m_flow*actualStream(port_a.h_outflow);
        port_a.Xi_outflow = (masses)./(masses[Medium.S.H2O]);
        //port_a.Xi_outflow = (masses/1000000)./(waterVolume*Medium.waterDensity);
        port_a.h_outflow = heat/(masses[Medium.S.H2O]*1000000); //TODO: heat flow  [J/kg]
        //port_a.h_outflow = heat/(waterVolume*Medium.waterDensity); //TODO: heat flow  [J/kg]
        port_a.p = 0;//osmotic pressure == R*T*sum of conc; //TODO: absolute thermodynamic pressure (= hydroynamic + hydrostatic + osmotis)
        concentrations = (masses./Medium.soluteMollarMass)/(waterVolume);
        baseExcess = concentrations*normalValences;
        membrane.conc = concentrations;
        annotation (Documentation(revisions="<html>
<p><i>2013</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>"),   Diagram(graphics),
          Icon(graphics));
      end SimpleBodyFluidCompartment;

      model ErythrocyteMembrane
        replaceable package Medium =
            Physiolibraryold.Media.BodyFluid2 "Blood Plasma Medium"
          annotation(choicesAllMatching=true);
        Interfaces.ConcentrationPorts_a port_outside[Medium.nS]
          "outside the erythrocyte"
          annotation (Placement(transformation(extent={{-10,-102},{10,-82}}),
              iconTransformation(extent={{-40,80},{40,100}})));
        Interfaces.ConcentrationPorts_b port_inside[Medium.nS]
          "inside the erythrocyte"
          annotation (Placement(transformation(extent={{-10,80},{10,100}}),
              iconTransformation(extent={{-40,-100},{40,-80}})));
        parameter Real permeabilities[Medium.nS] = ones(Medium.nS);
        Physiolibraryold.Fluid.Blood2.MembraneChannels.Band3 band3
          annotation (Placement(transformation(extent={{-10,-4},{10,16}})));
        MembraneChannels.Aquaporin1 aquaporin1
          annotation (Placement(transformation(extent={{20,-4},{42,16}})));
      equation
      // port_inside.q + port_outside.q = zeros(Medium.nS);
      // port_inside.q = (port_outside.conc - port_inside.conc) .* permeabilities;
        connect(band3.port_outside, port_outside)          annotation (Line(
            points={{0,-3},{0,-92}},
            color={127,0,0},
            smooth=Smooth.None));
        connect(band3.port_inside, port_inside)          annotation (Line(
            points={{0,15},{0,90}},
            color={127,0,0},
            smooth=Smooth.None));
        connect(port_inside, aquaporin1.port_inside) annotation (Line(
            points={{0,90},{0,48},{31,48},{31,15}},
            color={127,0,0},
            smooth=Smooth.None));
        connect(aquaporin1.port_outside, port_outside) annotation (Line(
            points={{31,-3},{31,-40},{0,-40},{0,-92}},
            color={127,0,0},
            smooth=Smooth.None));
        annotation (Diagram(graphics), Icon(graphics));
      end ErythrocyteMembrane;

      package MembraneChannels
        model BaseChannel
         replaceable package Medium =
              Physiolibraryold.Media.BodyFluid2 "Blood Plasma Medium"
            annotation(choicesAllMatching=true);
          Interfaces.ConcentrationPorts_a port_outside[Medium.nS]
            "outside the erythrocyte"
            annotation (Placement(transformation(extent={{-10,-98},{10,-78}}),
                iconTransformation(extent={{-40,-100},{40,-80}})));
          Interfaces.ConcentrationPorts_b port_inside[Medium.nS]
            "inside the erythrocyte"
            annotation (Placement(transformation(extent={{-10,84},{10,104}}),
                iconTransformation(extent={{-40,80},{40,100}})));
          parameter Real k=1000;
          constant Real I[Medium.nS,Medium.nS] = identity(Medium.nS);
          parameter Real Q[Medium.nS];
          Real q;
        equation
          port_inside.q + port_outside.q = zeros(Medium.nS);
          //q=k*(port_outside[Medium.S.Cl].conc*port_inside[Medium.S.HCO3].conc - port_inside[Medium.S.Cl].conc*port_outside[Medium.S.HCO3].conc);
          port_outside.q=q*Q;
          annotation (Icon(graphics));
        end BaseChannel;

        model Band3
         extends BaseChannel(Q= I[:,Medium.S.Cl] - I[:,Medium.S.HCO3]);
        equation
          q=k*(port_outside[Medium.S.Cl].conc*port_inside[Medium.S.HCO3].conc - port_inside[Medium.S.Cl].conc*port_outside[Medium.S.HCO3].conc);
          annotation (Icon(graphics));
        end Band3;

        model Aquaporin1
         extends BaseChannel(Q = I[:,Medium.S.H2O]);
         Real osmOut;
          Real osmIn;
        equation
          //todo: osmotic gradient = sum of all concentrations inside - sum of all concentrations outside
          osmOut = sum(port_outside[i].conc for i in 2:Medium.nS);
          osmIn = sum(port_inside[i].conc for i in 2:Medium.nS);
          q=-k*(osmOut-osmIn); //k*(port_outside[Medium.S.Cl].conc*port_inside[Medium.S.HCO3].conc - port_inside[Medium.S.Cl].conc*port_outside[Medium.S.HCO3].conc);
          annotation (Icon(graphics));
        end Aquaporin1;

        model Glut1
          extends BaseChannel(Q= I[:,Medium.S.Glu]);
        end Glut1;

        model NHE1
         extends BaseChannel(Q= I[:,Medium.S.Na] + I[:,Medium.S.NH4] - I[:,Medium.S.H]);
        equation
          q=0;
          //q=k*(port_outside[Medium.S.Cl].conc*port_inside[Medium.S.HCO3].conc - port_inside[Medium.S.Cl].conc*port_outside[Medium.S.HCO3].conc);
          annotation (Icon(graphics));
        end NHE1;
      end MembraneChannels;

      model Blood2
        Plasma plasma
          annotation (Placement(transformation(extent={{-18,10},{2,30}})));
        Erythrocyte erythrocyte
          annotation (Placement(transformation(extent={{-18,-44},{2,-24}})));
        ErythrocyteMembrane membrane "erythrocyte membrane"
          annotation (Placement(transformation(extent={{-18,-14},{2,6}})));
      equation
      //  plasma.port_a.m_flow=0;
      //  erythrocyte.port_a.m_flow=0;
        connect(membrane.port_inside, erythrocyte.membrane) annotation (Line(
            points={{-8,-13},{-8,-25}},
            color={127,0,0},
            smooth=Smooth.None));
        connect(membrane.port_outside, plasma.membrane) annotation (Line(
            points={{-8,5},{-8,29}},
            color={127,0,0},
            smooth=Smooth.None));
        annotation (Diagram(graphics));
      end Blood2;

      model CarbonicAcid
        Real CO2(start = 1.3);
        Real HCO3(start = 24.5);
        Real H2CO3;
        parameter Real pH=7.4;
      equation
        1.59e-4 = (10^(-pH))*HCO3/H2CO3;  //Ka1=10^(-3.7986)
        der(CO2)=-0.145*CO2+49.6*H2CO3;
        der(H2CO3)=0.145*CO2-49.6*H2CO3 - der(HCO3);
      end CarbonicAcid;
    end Blood2;

    package Interfaces
      connector ConcentrationPorts_a
        extends ConcentrationFlow.ConcentrationFlow;
        annotation (Icon(
              coordinateSystem(
              preserveAspectRatio=false,
              extent={{-200,-50},{200,50}},
              grid={1,1},
              initialScale=0.2),
              graphics={
              Rectangle(
                extent={{-201,50},{200,-50}},
                lineColor={127,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
                                  Polygon(
                points={{0,46},{44,0},{0,-44},{-46,0},{0,46}},
                lineColor={200,0,0},
                smooth=Smooth.None,
                fillPattern=FillPattern.Solid,
                fillColor={200,0,0}),
                                  Polygon(
                points={{-126,44},{-82,-2},{-126,-46},{-172,-2},{-126,44}},
                lineColor={200,0,0},
                smooth=Smooth.None,
                fillPattern=FillPattern.Solid,
                fillColor={200,0,0}),
                                  Polygon(
                points={{128,44},{172,-2},{128,-46},{82,-2},{128,44}},
                lineColor={200,0,0},
                smooth=Smooth.None,
                fillPattern=FillPattern.Solid,
                fillColor={200,0,0})}));
      end ConcentrationPorts_a;

      connector ConcentrationPorts_b
        extends ConcentrationFlow.ConcentrationFlow;
        annotation (Icon(
              coordinateSystem(
              preserveAspectRatio=false,
              extent={{-200,-50},{200,50}},
              grid={1,1},
              initialScale=0.2),
              graphics={
              Rectangle(
                extent={{-201,50},{200,-50}},
                lineColor={127,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
                                  Polygon(
                points={{0,46},{44,0},{0,-44},{-46,0},{0,46}},
                lineColor={200,0,0},
                smooth=Smooth.None,
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}),
                                  Polygon(
                points={{-126,44},{-82,-2},{-126,-46},{-172,-2},{-126,44}},
                lineColor={200,0,0},
                smooth=Smooth.None,
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255}),
                                  Polygon(
                points={{128,44},{172,-2},{128,-46},{82,-2},{128,44}},
                lineColor={200,0,0},
                smooth=Smooth.None,
                fillPattern=FillPattern.Solid,
                fillColor={255,255,255})}));
      end ConcentrationPorts_b;
    end Interfaces;
  end Fluid;
  annotation (Documentation(revisions="<html>
<table>
<tr>
<td>Author:</td>
<td>Marek Matejak</td>
</tr>
<tr>
<td>Copyright:</td>
<td>In public domains</td>
</tr>
<tr>
<td>By:</td>
<td>Charles University, Prague</td>
</tr>
<tr>
<td>Date of:</td>
<td>2008-2009</td>
</tr>
</table>
</html>"), uses(Modelica(version="3.2.1")));
end Physiolibraryold;
