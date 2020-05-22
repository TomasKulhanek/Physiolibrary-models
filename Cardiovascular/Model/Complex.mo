within Cardiovascular.Model;
package Complex
  "Complex model unifying state-of-the-art circAdapt model with coronary arteries and complex arterial tree"
     extends Modelica.Icons.ExamplesPackage;
  package Environment "Central model settings and environment"

    import Physiolibrary.Types.*;

    model ComplexEnvironment "Class encompassing all settings"
      extends Cardiovascular.Icons.Settings;
      import Cardiovascular.Model.Complex.Components.Main.SystemicArteries.*;

      inner replaceable Conditions.Rest_NoAdapt condition constrainedby
        Conditions.Abstraction.Condition
        "Selected global condition and adaptation"
        annotation (choicesAllMatching=true);

      replaceable Supports.No supports constrainedby
        Supports.Abstraction.Supports
        "Selected settings of cardiac supports"
        annotation (choicesAllMatching=true);

      replaceable Initialization.PhysiologicalAdapted initialization
        constrainedby Initialization.Abstraction.Initialization
        "Selected initialization of components"
        annotation (choicesAllMatching=true);

      replaceable ModelConstants.Standard constants constrainedby
        ModelConstants.Standard "Selected set of basic constants"
        annotation (choicesAllMatching=true);

      Time t(start=0, fixed=true)
        "Time with respect to start of cardiac cycle";
      inner Boolean stepCycle(start=true, fixed=true)
        "Steps denote start of new cardiac cycle";

    //   discrete Real[:] feedback(start = {0, 0, 0})
    //     "Monitored values for stability convergence";
    //   discrete Real feedbackError
    //     "Total square error of monitored values - used as a convergence criterion";
    //   discrete Real newMode
    //     "New mode to switch to - used during adaptation protocol";
    //   Integer counter
    //     "Counts sequential mode transitions realized without a need for further adaptation - used as a convergence criterion";
      Real HeartRate=60/condition.cycleDuration "Heart rate BPM";
    equation

      // Watching cardiac cycle time
      der(t) = 1;
      when t >= condition.cycleDuration then
        reinit(t, t - condition.cycleDuration);
        stepCycle = not pre(stepCycle);
      end when;

    //   // Controling adaptation convergence
    //   when change(stepCycle) then
    //     feedback[:] = {avg_PC_dp. average  * 760 / 101325, avg_cVSA_q. average * 1e6, avg_cVSA_p. average * 760 / 101325};
    //     feedbackError = sum((feedback[i] - pre(feedback[i])) ^ 2 for i in 1 : size(feedback, 1));
    //     newMode = settings.condition.processFeedback(feedbackError, pre(counter) >= 14);
    //     counter = if pre(counter) < 14 and settings. condition. adaptationPhase and pre(settings. condition. adaptationPhase) then (if newMode <> pre(settings. condition. mode) then pre(counter) + 1 else max(0, pre(counter) - 1)) else pre(counter);
    //     reinit(settings. condition. mode, newMode);
    //   end when;

      annotation (
              defaultComponentName="settings",
        defaultComponentPrefixes="inner",
        missingInnerMessage="No \"Settings\" component is defined. A default settings
    component is required for proper function. Its enough to drop it to the top-level scene!
    You can find it in Cardiovascular.Model.Complex.Settings.",
              Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                {100,100}})));
    end ComplexEnvironment;

    package Conditions "Setting global condition including adaptation"
      package Abstraction "Common ancestors"
        partial model Condition "Basic condition definition"
          import Cardiovascular.Types.*;

          parameter Frequency heartBeat(displayUnit="1/s") = 1/0.85
            "Heart beat";
          parameter Pressure aortalPressureRef=12200
            "Reference pressure in aorta";
          parameter Pressure pulmonaryPressureDropRef=1500
            "Reference pressure drop over pulmonary capillaries";

          Time cycleDuration=1/heartBeat "Duration of cardiac cycle";
          VolumeFlowRate aortalFlowRef=85e-6 "Reference flow through aorta";
          Volume bloodVolumeRef=0.95e-3 "Reference blood volume";

          Boolean adaptCapillaryResistance=true
            "Whether capillary resistance should be adapted";
          Boolean adaptVesselDiameter=false
            "Whether cross-sectional area of vessels should be adapted";
          Boolean adaptValveDiameter=false
            "Whether valve cross-sectional area should be adapted";
          Boolean adaptVesselWVolume=false
            "Whether wall volume of vessels should be adapted";
          Boolean adaptTriSegJunction=false
            "Whether correctional coefficient for heart geometry should be adapted";
          Boolean adaptChamberWVolume=false
            "Whether wall volume in heart walls should be adapted";
          Boolean adaptChamberWArea=false
            "Whether wall surface area in heart walls should be adapted";
          Boolean adaptChamberEcmStress=false
            "Whether reference myofiber passive stress should be adapted";
          Boolean adaptPericardium=false
            "Whether pericardium should be adapted";
          Boolean adaptationPhase=false "Whether adaptation is in progress";

          Real mode(start=0, fixed=true)
            "Inner state used in adaptation protocol";

          function processFeedback = ProcessFeedback (mode=mode)
            "Evaluates convergence";

          replaceable partial function ProcessFeedback
            "Can evaluate and react to convergence when redeclared"
            input Real error "Feedback error to evaluate convergence";
            input Boolean inEndPhase=false
              "Whether global convergence has been reached";
            input Real mode
              "Inner state through which the function interacts";
            output Real result=mode "New state";
          algorithm
          end ProcessFeedback;

        equation
          der(mode) = 0;

        end Condition;
      end Abstraction;

      model Rest_NoAdapt "Resting condition with no adaptation"
        extends Conditions.Abstraction.Condition(adaptCapillaryResistance=
              false);

      end Rest_NoAdapt;

      model Rest_MinimalAdapt
        "Resting condition with adaptation of capillary resistance"
        extends Conditions.Abstraction.Condition(adaptCapillaryResistance=
              true, adaptationPhase=true);

      end Rest_MinimalAdapt;

      model Rest_Adapt "Adaptation phase in resting condition"
        extends Conditions.Rest_MinimalAdapt(adaptVesselDiameter=true,
          adaptValveDiameter=true);

      end Rest_Adapt;

      model Exercise_Adapt "Adaptation phase for exercise"
        extends Conditions.Rest_MinimalAdapt(
          heartBeat=1/0.425,
          aortalFlowRef=255e-6,
          bloodVolumeRef=1.3e-3,
          adaptVesselWVolume=true,
          adaptTriSegJunction=true,
          adaptChamberWVolume=true,
          adaptChamberWArea=true,
          adaptChamberEcmStress=true,
          adaptPericardium=true);

      end Exercise_Adapt;

      model AdaptationProtocol
        "Adaptation protocol switching between resting and exercise adaptation phases"
        extends Conditions.Abstraction.Condition(
          cycleDuration=if mode < 2 then adaptRest.cycleDuration else
              adaptEx.cycleDuration,
          adaptCapillaryResistance=true,
          adaptVesselDiameter=mode >= 1 and mode < 2,
          adaptValveDiameter=mode >= 1 and mode < 2,
          adaptVesselWVolume=mode >= 3,
          adaptTriSegJunction=mode >= 3,
          adaptChamberWVolume=mode >= 3,
          adaptChamberWArea=mode >= 3,
          adaptChamberEcmStress=mode >= 3,
          adaptPericardium=mode >= 3,
          aortalFlowRef=if mode < 2 then adaptRest.aortalFlowRef else
              adaptEx.aortalFlowRef,
          bloodVolumeRef=if mode < 2 then adaptRest.bloodVolumeRef else
              adaptEx.bloodVolumeRef,
          adaptationPhase=mode >= 1 and mode < 2 or mode >= 3);

        Conditions.Rest_Adapt adaptRest "Resting adaptation phase settings";
        Conditions.Exercise_Adapt adaptEx
          "Exercise adaptation phase settings";

        redeclare partial function ProcessFeedback
          "Evaluates changes between two cardiac cycles and adjusts adaptation mode"
          input Real error "Feedback error to evaluate convergence";
          input Boolean inEndPhase=false
            "Whether global convergence has been reach - parking in resting condition is awaited";
          input Real mode
            "Adaptation phase - 0-1: stabilization at rest, 1-2: adaptation at rest, 2-3: stabilization during exercise, 3-4: adaptation during exercise";
          output Real result=if error < 1e-2 then (if mode > 0 then (if
              inEndPhase and mode >= 1 and mode <= 1.25 then mode else mod(
              mode + 0.25, 4)) else mode + 0.25) else mode "New mode";
        algorithm
        end ProcessFeedback;

      end AdaptationProtocol;

    end Conditions;

    package Initialization "Initialization for components"
      package Abstraction "Common ancestors"
        partial record Initialization "Initial values for circuit segments"
          import Cardiovascular.Types.*;
          import Physiolibrary.Types.*;

          parameter Pressure SA_pRef
            "Reference pressure for systemic arteries";
          parameter Cardiovascular.Types.Area SA_ARef
            "Reference cavity cross-sectional area for systemic arteries";
          parameter Cardiovascular.Types.Area SA_AW
            "Wall cross-sectional area for systemic arteries";
          parameter Cardiovascular.Types.Length SA_l
            "Length of systemic arteries";
          parameter Real SA_k
            "Stiffness non-linearity coefficient for systemic arteries";

          parameter Pressure SV_pRef
            "Reference pressure for systemic veins";
          parameter Cardiovascular.Types.Area SV_ARef
            "Reference cavity cross-sectional area for systemic veins";
          parameter Cardiovascular.Types.Area SV_AW
            "Wall cross-sectional area for systemic veins";
          parameter Cardiovascular.Types.Length SV_l "Length of systemic veins";
          parameter Real SV_k
            "Stiffness non-linearity coefficient for systemic veins";

          parameter Pressure PA_pRef
            "Reference pressure for pulmonary arteries";
          parameter Cardiovascular.Types.Area PA_ARef
            "Reference cavity cross-sectional area for pulmonary arteries";
          parameter Cardiovascular.Types.Area PA_AW
            "Wall cross-sectional area for pulmonary arteries";
          parameter Cardiovascular.Types.Length PA_l
            "Length of pulmonary arteries";
          parameter Real PA_k
            "Stiffness non-linearity coefficient for pulmonary arteries";

          parameter Pressure PV_pRef
            "Reference pressure for pulmonary veins";
          parameter Cardiovascular.Types.Area PV_ARef
            "Reference cavity cross-sectional area for pulmonary veins";
          parameter Cardiovascular.Types.Area PV_AW
            "Wall cross-sectional area for pulmonary veins";
          parameter Cardiovascular.Types.Length PV_l
            "Length of pulmonary veins";
          parameter Real PV_k
            "Stiffness non-linearity coefficient for pulmonary veins";

          parameter HydraulicResistance SC_R
            "Resistence of systemic capillaries";
          parameter HydraulicResistance PC_R
            "Resistence of pulmonary capillaries";

          parameter Cardiovascular.Types.Area vLAV_ARef
            "Reference cross-sectional area of left atrio-ventricular valve";
          parameter Cardiovascular.Types.Length vLAV_l
            "Length of left atrio-ventricular valve";
          parameter Real vLAV_Ko
            "Time coefficient for opening of left atrio-ventricular valve";
          parameter Real vLAV_Kc
            "Time coefficient for closing of left atrio-ventricular valve";
          parameter Fraction vLAV_Mrg
            "Severity of left atrio-ventricular valve regurgitation";
          parameter Fraction vLAV_Mst
            "Severity of left atrio-ventricular valve stenosis";
          parameter Pressure vLAV_dpO
            "Opening pressure for left atrio-ventricular valve";
          parameter Pressure vLAV_dpC
            "Closing pressure for left atrio-ventricular valve";

          parameter Cardiovascular.Types.Area vRAV_ARef
            "Reference cross-sectional area of right atrio-ventricular valve";
          parameter Cardiovascular.Types.Length vRAV_l
            "Length of right atrio-ventricular valve";
          parameter Real vRAV_Ko
            "Time coefficient for opening of right atrio-ventricular valve";
          parameter Real vRAV_Kc
            "Time coefficient for closing of right atrio-ventricular valve";
          parameter Real vRAV_Mrg
            "Severity of right atrio-ventricular valve regurgitation";
          parameter Real vRAV_Mst
            "Severity of right atrio-ventricular valve stenosis";
          parameter Pressure vRAV_dpO
            "Opening pressure for right atrio-ventricular valve";
          parameter Pressure vRAV_dpC
            "Closing pressure for right atrio-ventricular valve";

          parameter Cardiovascular.Types.Area vSA_ARef
            "Reference cross-sectional area of aortic valve";
          parameter Cardiovascular.Types.Length vSA_l "Length of aortic valve";
          parameter Real vSA_Ko
            "Time coefficient for opening of aortic valve";
          parameter Real vSA_Kc
            "Time coefficient for closing of aortic valve";
          parameter Fraction vSA_Mrg
            "Severity of aortic valve regurgitation";
          parameter Fraction vSA_Mst "Severity of aortic valve stenosis";
          parameter Pressure vSA_dpO "Opening pressure for aortic valve";
          parameter Pressure vSA_dpC "Closing pressure for aortic valve";

          parameter Cardiovascular.Types.Area vPA_ARef
            "Reference cross-sectional area of pulmonary valve";
          parameter Cardiovascular.Types.Length vPA_l
            "Length of pulmonary valve";
          parameter Real vPA_Ko
            "Time coefficient for opening of pulmonary valve";
          parameter Real vPA_Kc
            "Time coefficient for closing of pulmonary valve";
          parameter Fraction vPA_Mrg
            "Severity of pulmonary valve regurgitation";
          parameter Fraction vPA_Mst "Severity of pulmonary valve stenosis";
          parameter Pressure vPA_dpO "Opening pressure for pulmonary valve";
          parameter Pressure vPA_dpC "Closing pressure for pulmonary valve";

          parameter Cardiovascular.Types.Area vSV_ARef
            "Reference cross-sectional area of left atrial inlet";
          parameter Cardiovascular.Types.Length vSV_l
            "Length of left atrial inlet";
          parameter Real vSV_Ko
            "Time coefficient for opening of left atrial inlet";
          parameter Real vSV_Kc
            "Time coefficient for closing of left atrial inlet";
          parameter Fraction vSV_Mrg
            "Severity left atrial inlet regurgitation (pseudo-valve - should be 100 %)";
          parameter Fraction vSV_Mst
            "Severity of left atrial inlet stenosis";
          parameter Pressure vSV_dpO
            "Opening pressure for left atrial inlet";
          parameter Pressure vSV_dpC
            "Closing pressure for left atrial inlet";

          parameter Cardiovascular.Types.Area vPV_ARef
            "Reference cross-sectional area of right atrial inlet";
          parameter Cardiovascular.Types.Length vPV_l
            "Length of right atrial inlet";
          parameter Real vPV_Ko
            "Time coefficient for opening of right atrial inlet";
          parameter Real vPV_Kc
            "Time coefficient for closing of right atrial inlet";
          parameter Fraction vPV_Mrg
            "Severity of right atrial inlet regurgitation (pseudo-valve - should be 100 %)";
          parameter Fraction vPV_Mst
            "Severity of right atrial inlet stenosis";
          parameter Pressure vPV_dpO
            "Opening pressure for right atrial inlet";
          parameter Pressure vPV_dpC
            "Closing pressure for right atrial inlet";

          parameter Volume RA_Am "Mid-wall area of right atrium";
          parameter Cardiovascular.Types.Area RA_AmRef
            "Reference mid-wall area of right atrium";
          parameter Cardiovascular.Types.Area RA_Am0
            "Dead space mid-wall area of right atrium";
          parameter Volume RA_VW "Wall volume of right atrium";
          parameter Pressure RA_sigmaPRef
            "Reference passive myofiber stress in right atrium";
          parameter Time RA_tauA_Base(displayUnit="s")
            "Activation time offset for right atrium";
          parameter Real RA_tauA_CycleFraction
            "Activation time fraction of cardiac cycle duration for right atrium";
          parameter Time RA_tDelay_Base(displayUnit="s")
            "Activation delay offset for right atrium";
          parameter Real RA_tDelay_CycleFraction
            "Activation delay fraction of cardiac cycle duration for right atrium";

          parameter Volume LA_Am "Mid-wall area of left atrium";
          parameter Cardiovascular.Types.Area LA_AmRef
            "Reference mid-wall area of left atrium";
          parameter Cardiovascular.Types.Area LA_Am0
            "Dead space mid-wall area of left atrium";
          parameter Volume LA_VW "Wall volume of left atrium";
          parameter Pressure LA_sigmaPRef
            "Reference passive myofiber stress in left atrium";
          parameter Time LA_tauA_Base(displayUnit="s")
            "Activation time offset for left atrium";
          parameter Real LA_tauA_CycleFraction
            "Activation time fraction of cardiac cycle duration for left atrium";
          parameter Time LA_tDelay_Base(displayUnit="s")
            "Activation delay offset for left atrium";
          parameter Real LA_tDelay_CycleFraction
            "Activation delay fraction of cardiac cycle duration for left atrium";

          parameter Cardiovascular.Types.Area LW_EAmRef
            "Correctional coefficient of ventricle geometry for left ventricular wall";
          parameter Cardiovascular.Types.Area LW_AmRef
            "Reference mid-wall area of left ventricular wall";
          parameter Cardiovascular.Types.Area LW_Am0
            "Dead space mid-wall area of left ventricular wall";
          parameter Volume LW_VW "Wall volume of left ventricular wall";
          parameter Pressure LW_sigmaPRef
            "Reference passive myofiber stress in left ventricular wall";
          parameter Time LW_tauA_Base(displayUnit="s")
            "Activation time offset for left ventricular wall";
          parameter Real LW_tauA_CycleFraction
            "Activation time fraction of cardiac cycle duration for left ventricular wall";
          parameter Time LW_tDelay_Base(displayUnit="s")
            "Activation delay offset for left ventricular wall";
          parameter Real LW_tDelay_CycleFraction
            "Activation delay fraction of cardiac cycle duration for left ventricular wall";

          parameter Cardiovascular.Types.Area SW_EAmRef
            "Correctional coefficient of ventricle geometry for sepal wall";
          parameter Cardiovascular.Types.Area SW_AmRef
            "Reference mid-wall area of sepal wall";
          parameter Cardiovascular.Types.Area SW_Am0
            "Dead space mid-wall area of sepal wall";
          parameter Volume SW_VW "Wall volume of sepal wall";
          parameter Pressure SW_sigmaPRef
            "Reference passive myofiber stress in sepal wall";
          parameter Time SW_tauA_Base(displayUnit="s")
            "Activation time offset for sepal wall";
          parameter Real SW_tauA_CycleFraction
            "Activation time fraction of cardiac cycle duration for sepal wall";
          parameter Time SW_tDelay_Base(displayUnit="s")
            "Activation delay offset for sepal wall";
          parameter Real SW_tDelay_CycleFraction
            "Activation delay fraction of cardiac cycle duration for sepal wall";

          parameter Cardiovascular.Types.Area RW_EAmRef
            "Correctional coefficient of ventricle geometry for right ventricular wall";
          parameter Cardiovascular.Types.Area RW_AmRef
            "Reference mid-wall area of right ventricular wall";
          parameter Cardiovascular.Types.Area RW_Am0
            "Dead space mid-wall area of right ventricular wall";
          parameter Volume RW_VW "Wall volume of right ventricular wall";
          parameter Pressure RW_sigmaPRef
            "Reference passive myofiber stress in right ventricular wall";
          parameter Time RW_tauA_Base(displayUnit="s")
            "Activation time offset for right ventricular wall";
          parameter Real RW_tauA_CycleFraction
            "Activation time fraction of cardiac cycle duration for right ventricular wall";
          parameter Time RW_tDelay_Base(displayUnit="s")
            "Activation delay offset for right ventricular wall";
          parameter Real RW_tDelay_CycleFraction
            "Activation delay fraction of cardiac cycle duration for right ventricular wall";

          parameter Real peri_k
            "Stiffness non-linearity coefficient for pericardium";
          parameter Volume peri_VRef "Reference volume of pericardium";
          parameter Pressure peri_pRef "Reference pericardial pressure";

        end Initialization;
      end Abstraction;

      record Original
        "Original set of initialization parameters based on source code for CircAdapt by Arts et al. (2012)"
        extends Abstraction.Initialization(
          SA_pRef=12289,
          SA_ARef=499e-6,
          SA_AW=117e-6,
          SA_l=0.4001,
          SA_k=8,
          SV_pRef=133,
          SV_ARef=499e-6,
          SV_AW=34e-6,
          SV_l=0.4001,
          SV_k=10,
          PA_pRef=1804,
          PA_ARef=507e-6,
          PA_AW=50e-6,
          PA_l=0.2001,
          PA_k=8,
          PV_pRef=326,
          PV_ARef=504e-6,
          PV_AW=49e-6,
          PV_l=0.2001,
          PV_k=10,
          SC_R=141.81e6,
          PC_R=17.663e6,
          vLAV_ARef=7.474e-4,
          vLAV_l=0.0246,
          vLAV_Ko=0.3,
          vLAV_Kc=0.4,
          vLAV_Mrg=0,
          vLAV_Mst=0,
          vLAV_dpO=0,
          vLAV_dpC=0,
          vRAV_ARef=7.4785e-4,
          vRAV_l=0.0246,
          vRAV_Ko=0.3,
          vRAV_Kc=0.4,
          vRAV_Mrg=0,
          vRAV_Mst=0,
          vRAV_dpO=0,
          vRAV_dpC=0,
          vSA_ARef=4.9827e-4,
          vSA_l=0.0201,
          vSA_Ko=0.12,
          vSA_Kc=0.12,
          vSA_Mrg=0,
          vSA_Mst=0,
          vSA_dpO=0,
          vSA_dpC=0,
          vPA_ARef=4.9857e-4,
          vPA_l=0.0201,
          vPA_Ko=0.2,
          vPA_Kc=0.2,
          vPA_Mrg=0,
          vPA_Mst=0,
          vPA_dpO=0,
          vPA_dpC=0,
          vSV_ARef=5.2312e-4,
          vSV_l=0.0201,
          vSV_Ko=1/inf,
          vSV_Kc=1/inf,
          vSV_Mrg=1,
          vSV_Mst=0,
          vSV_dpO=0,
          vSV_dpC=0,
          vPV_ARef=5.1906e-4,
          vPV_l=0.0201,
          vPV_Ko=1/inf,
          vPV_Kc=1/inf,
          vPV_Mrg=1,
          vPV_Mst=0,
          vPV_dpO=0,
          vPV_dpC=0,
          RA_Am=57e-4,
          RA_AmRef=55e-4,
          RA_Am0=12e-4,
          RA_VW=4.8e-6,
          RA_sigmaPRef=19353,
          RA_tauA_Base=0,
          RA_tauA_CycleFraction=0.15/0.85,
          RA_tDelay_Base=0,
          RA_tDelay_CycleFraction=0,
          LA_Am=68e-4,
          LA_AmRef=62e-4,
          LA_Am0=12e-4,
          LA_VW=15e-6,
          LA_sigmaPRef=11156,
          LA_tauA_Base=0,
          LA_tauA_CycleFraction=0.15/0.85,
          LA_tDelay_Base=0.02,
          LA_tDelay_CycleFraction=0,
          LW_EAmRef=0,
          LW_AmRef=89e-4,
          LW_Am0=12e-4,
          LW_VW=99e-6,
          LW_sigmaPRef=4373,
          LW_tauA_Base=0.085,
          LW_tauA_CycleFraction=0.4,
          LW_tDelay_Base=0,
          LW_tDelay_CycleFraction=0.185,
          SW_EAmRef=-0.1059,
          SW_AmRef=52e-4,
          SW_Am0=5e-10,
          SW_VW=44e-6,
          SW_sigmaPRef=4629,
          SW_tauA_Base=0.085,
          SW_tauA_CycleFraction=0.4,
          SW_tDelay_Base=0,
          SW_tDelay_CycleFraction=0.185,
          RW_EAmRef=0,
          RW_AmRef=119e-4,
          RW_Am0=12e-4,
          RW_VW=43e-6,
          RW_sigmaPRef=5144,
          RW_tauA_Base=0.085,
          RW_tauA_CycleFraction=0.4,
          RW_tDelay_Base=0,
          RW_tDelay_CycleFraction=0.185,
          peri_k=10,
          peri_VRef=609e-6,
          peri_pRef=500);
        import Modelica.Constants.*;

      end Original;

      record PhysiologicalAdapted
        "Set of parameters adapted to the model structure"
        extends Original(
          SA_pRef=1.269250e+04,
          SA_ARef=5.200303e-04,
          SA_AW=1.047177e-04,
          SV_pRef=2.378004e+02,
          SV_ARef=5.164770e-04,
          SV_AW=3.530430e-05,
          PA_pRef=2.221040e+03,
          PA_ARef=5.527450e-04,
          PA_AW=5.971791e-05,
          PV_pRef=7.568972e+02,
          PV_ARef=5.486271e-04,
          PV_AW=5.756578e-05,
          SC_R=140736288,
          PC_R=16254300,
          vLAV_ARef=7.738475e-04,
          vRAV_ARef=8.142545e-04,
          vSA_ARef=5.158983e-04,
          vPA_ARef=5.428363e-04,
          vSV_ARef=5.159014e-04,
          vPV_ARef=5.428373e-04,
          RA_AmRef=5.399583e-03,
          RA_Am0=1.357092e-03,
          RA_VW=7.999816e-06,
          RA_sigmaPRef=1.358824e+04,
          LA_AmRef=6.022352e-03,
          LA_Am0=1.289749e-03,
          LA_VW=2.016152e-05,
          LA_sigmaPRef=1.471949e+04,
          LW_AmRef=8.534521e-03,
          LW_Am0=1.289746e-03,
          LW_VW=9.951744e-05,
          LW_sigmaPRef=8.666301e+03*0.64,
          LW_EAmRef=0,
          SW_AmRef=5.111006e-03,
          SW_Am0=0,
          SW_VW=4.050521e-05,
          SW_sigmaPRef=8.638455e+03*0.64,
          SW_EAmRef=-8.544202e-03,
          RW_AmRef=1.268816e-02,
          RW_Am0=1.357091e-03,
          RW_VW=5.069673e-05,
          RW_sigmaPRef=9.300374e+03*0.64,
          RW_EAmRef=0,
          peri_VRef=6.651555e-04);

      end PhysiologicalAdapted;
    end Initialization;

    package Supports "Settings of cardiac supports"
      package Abstraction "Common ancestors"
        partial record Supports
          "Definition of standard settings for cardiac supports"
          import Cardiovascular.Types.*;

          parameter Boolean _DT_IABP_isEnabled
            "Whether IABP is implanted (derived tree only)";
          parameter Time _DT_IABP_inflationTime(displayUnit="s") = 0.57
            "IABP inflation timing with respect to cardiac cycle (derived tree only)";
          parameter Time _DT_IABP_deflationTime(displayUnit="s") = 0.28
            "IABP deflation timing with respect to cardiac cycle (derived tree only)";

          parameter Boolean ECMO_isEnabled "Whether ECMO is connected";
          parameter VolumeFlowRate ECMO_qMeanRef=1.6666666666667e-06
            "Reference mean flow through ECMO";
          parameter Cardiovascular.Types.PulseShape ECMO_pulseShapeRef=
              PulseShape.pulseless "Shape of ECMO pulse or constant flow";
          parameter Time ECMO_cycleDuration(displayUnit="s") = 0.85
            "Cycle duration for ECMO pulses";
          parameter Time ECMO_pulseDuration(displayUnit="s") = 0.85/4
            "Duration of reference ECMO pulse";
          parameter Time ECMO_pulseStartTime(displayUnit="s") = 0
            "Starting time of reference ECMO pulse with respect to cardiac cycle";
          parameter Cardiovascular.Types.CannulaPlacement ECMO_cannulaPlacement=
              CannulaPlacement.ascendingAorta
            "Insertion location of ECMO cannula (arterial trees only)";
          parameter Cardiovascular.Types.Length ECMO_cannulaLength=0.15
            "Length of ECMO cannulas";
          parameter Cardiovascular.Types.Length ECMO_cannulaInnerDiameter=0.005
            "Inner diameter of ECMO cannulas";
          parameter Cardiovascular.Types.Length _DT_ECMO_cannulaOuterDiameter=0.007
            "Outer diameter of ECMO cannulas (derived tree only)";
          parameter Cardiovascular.Types.Length _DT_ECMO_cannulaDepth=0.007
            "Insertion depth of ECMO cannulas (derived tree only)";

          annotation (__Dymola_Commands);
        end Supports;
      end Abstraction;

      record No "No supports are applied"
        extends Supports.Abstraction.Supports(ECMO_isEnabled=false,
            _DT_IABP_isEnabled=false);

      end No;

      record IABP "IABP enabled"
        extends Supports.No(_DT_IABP_isEnabled=true);

      end IABP;

      record ECMO_Nonpulsatile "ECMO enabled in non-pulsatile mode"
        extends Supports.No(ECMO_isEnabled=true, ECMO_pulseShapeRef=
              PulseShape.pulseless);
        import Cardiovascular.Types.*;

      end ECMO_Nonpulsatile;

      record ECMO_Pulsatile "ECMO enabled in pulsatile mode"
        extends Supports.No(ECMO_isEnabled=true, ECMO_pulseShapeRef=
              PulseShape.parabolic);
        import Cardiovascular.Types.*;

      end ECMO_Pulsatile;
    end Supports;

    package ModelConstants "Adjustable model constants"
      package Abstraction "Common ancestors"
        partial record ModelConstants
          "Declaration of model constants (should be relatively fixed)"
          import Cardiovascular.Types.*;

          parameter Time bloodVolumeAdaptationRate
            "Speed of adjusting blood volume when reference volume changes";
          parameter Real CRest "Contractility when myofiber is at rest";
          parameter Real ecmoPumpPressureAdaptationRate
            "Speed of adjusting ECMO pump pressure to reference value";
          parameter Cardiovascular.Types.Length Lsc0
            "Length of contractile sarcomere element with zero passive stress";
          parameter Cardiovascular.Types.Length LseIso
            "Reference length of isometrically stressed elastic sarcomere element";
          parameter Cardiovascular.Types.Length LsMaxAdapt
            "Maximal sarcomere length for adaptation";
          parameter Cardiovascular.Types.Length LsMinAdapt
            "Minimal sarcomere length for adaptation";
          parameter Cardiovascular.Types.Length LsP0
            "Sarcomere length with zero passive stress";
          parameter Cardiovascular.Types.Length LsRef
            "Reference sarcomere length";
          parameter Cardiovascular.Types.Length atriumDLsP
            "Passive stress coefficient for atria";
          parameter Pressure atriumSigmaARef
            "Reference active myofiber stress in atria";
          parameter Pressure atriumSigmaPAdapt
            "Reference passive myofiber stress in atria for adaptation";
          parameter Real atriumTauS
            "Contractility time coefficient for atria";
          parameter Velocity atriumVMax
            "Maximal sarcomere velocity in atria";
          parameter Cardiovascular.Types.Length ventricleDLsP
            "Passive stress coefficient for ventricles";
          parameter Pressure ventricleSigmaARef
            "Reference active myofiber stress in ventricles";
          parameter Pressure ventricleSigmaPAdapt
            "Reference passive myofiber stress in ventricles for adaptation";
          parameter Real ventricleTauS
            "Contractility time coefficient for ventricles";
          parameter Velocity ventricleVMax
            "Maximal sarcomere velocity in ventricles";
          parameter Velocity vImpact
            "Reference velocity of blood due to movement impacts";

          parameter Fraction _DT_aorticArchStenosisRatio=0
            "Severity of stenosis in aortic arch (derived tree only)";
          parameter Fraction _DT_arterialStiffnessScale=1
            "Scaling coefficient for arterial stiffness (derived tree only)";
          parameter Fraction bloodVolumeRefScale=1
            "Scaling coefficient for blood volume";
          parameter Fraction systemicResistanceScale=1
            "Scaling coefficient for systemic resistance";
          parameter Fraction LW_contractilityScale=1
            "Scaling coefficient for contractility of left ventricle wall";
          parameter Fraction SW_contractilityScale=1
            "Scaling coefficient for contractility of sepal wall";
          parameter Fraction RW_contractilityScale=1
            "Scaling coefficient for contractility of right ventricle wall";
          parameter Fraction LA_contractilityScale=1
            "Scaling coefficient for contractility of left atrium";
          parameter Fraction RA_contractilityScale=1
            "Scaling coefficient for contractility of right atrium";

        end ModelConstants;
      end Abstraction;

      record Standard "Standard set of model constants"
        extends Abstraction.ModelConstants(
          vImpact=3,
          LsMaxAdapt=2.2e-6,
          LsMinAdapt=1.75e-6,
          LsP0=1.8e-6,
          CRest=0.02,
          Lsc0=1.51e-6,
          LsRef=2.0e-6,
          LseIso=0.04e-6,
          ventricleVMax=7e-6,
          atriumVMax=10.5e-6,
          ventricleDLsP=0.6e-6,
          atriumDLsP=0.8e-6,
          ventricleSigmaARef=120e3,
          ventricleSigmaPAdapt=7.5e3,
          atriumSigmaARef=84e3,
          atriumSigmaPAdapt=52.5e3,
          ventricleTauS=0.25,
          atriumTauS=0.5,
          bloodVolumeAdaptationRate=1,
          ecmoPumpPressureAdaptationRate=4e9);

      end Standard;

      record LVFailure
        extends Standard(
          LW_contractilityScale=0.1,
          RW_contractilityScale=x,
          SW_contractilityScale=x);
        constant Real x = 1;
      end LVFailure;
    end ModelConstants;
  end Environment;

  package Components "Model components"

    package Auxiliary "Auxiliary components"
      package Connectors
        "Connectors used in the model, compatible with Physiolibrary"
        connector In "Inflow connector"
          extends Physiolibrary.Hydraulic.Interfaces.HydraulicPort;

          annotation (Icon(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics={
                Ellipse(
                  extent={{-80,80},{80,-80}},
                  lineColor={127,0,0},
                  fillColor={255,63,5},
                  fillPattern=FillPattern.Sphere),
                Rectangle(
                  extent={{-42,12},{34,-14}},
                  lineColor={255,255,0},
                  lineThickness=0.5,
                  fillPattern=FillPattern.Solid,
                  fillColor={255,255,0}),
                Polygon(
                  points={{8,42},{8,-42},{50,0},{8,42}},
                  lineColor={255,255,0},
                  lineThickness=0.5,
                  fillPattern=FillPattern.Sphere,
                  smooth=Smooth.None,
                  fillColor={255,255,0})}));
        end In;

        connector Through "Connector with no preferred flow direction"
          extends Physiolibrary.Hydraulic.Interfaces.HydraulicPort;

          annotation (Icon(graphics={Ellipse(
                  extent={{-80,80},{80,-80}},
                  lineColor={197,52,16},
                  fillColor={255,170,0},
                  fillPattern=FillPattern.Sphere)}));
        end Through;

        connector Out "Outflow connector"
          extends Physiolibrary.Hydraulic.Interfaces.HydraulicPort;

          annotation (Icon(graphics={
                Ellipse(
                  extent={{-80,80},{80,-80}},
                  lineColor={229,133,64},
                  fillColor={255,255,0},
                  fillPattern=FillPattern.Sphere),
                Rectangle(
                  extent={{-42,12},{32,-14}},
                  lineColor={255,0,0},
                  lineThickness=0.5,
                  fillPattern=FillPattern.Solid,
                  fillColor={255,0,0}),
                Polygon(
                  points={{8,42},{8,-42},{50,0},{8,42}},
                  lineColor={255,0,0},
                  lineThickness=0.5,
                  fillPattern=FillPattern.Sphere,
                  smooth=Smooth.None,
                  fillColor={255,0,0})}));
        end Out;

      end Connectors;

      package BlockKinds "Fundamental types of blocks"
        partial model Port "Block with flow through"
          import Physiolibrary.Types.*;

          Connectors.In cIn "Inflow" annotation (Placement(transformation(
                  extent={{-90,-10},{-70,10}})));
          Connectors.Out cOut "Outflow" annotation (Placement(
                transformation(extent={{70,-10},{90,10}})));

          Pressure dp=cIn.pressure - cOut.pressure "Pressure gradient";

          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics));
        end Port;

        model Hook "Block for intercepting flow"

          Connectors.Through c "Hooking connector" annotation (Placement(
                transformation(extent={{-10,40},{10,60}}),
                iconTransformation(extent={{-10,40},{10,60}})));

          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics), Icon(
                coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                    {100,100}}), graphics));
        end Hook;
      end BlockKinds;

      package Analyzers
        "Components for analysis of signal during a cardiac cycle"
        package Abstraction "Common ancestors"
          partial class Analyzer
            import Physiolibrary.Types.*;

            replaceable type T = Real constrainedby Real
              "Signal type - to guarantee a unit control" annotation (
                choicesAllMatching=true);

            parameter T init=0 "Initial value for output from analyzer";

            input Boolean condition=true
              "Analyzer works if condition is true";
            input Boolean control
              "When changed, the analyzer outputs and resets";
            input T signal "Signal to be analyzed";

          end Analyzer;
        end Abstraction;

        class Averager "Computes average value"
          extends Abstraction.Analyzer;
          import Physiolibrary.Types.*;

          discrete T average(start=init, fixed=true)
            "Resulting signal average of the previous phase";

        protected
          T integral(start=0) "Integral of the input signal";
          // Setting fixed=true for those two variables wouldn't compile in Dymola 2014; in Dymola 2015 FD01 it would be OK
          Time t(start=0) "Current duration of integration";
          Time unit=1
            "Auxiliary variable to resolve the modified unit type of the integral ([T]/s is unknown beforehand)";

        equation
          der(t) = if condition then 1 else 0;
          der(integral) = if condition then signal/unit else 0;
          when change(control) then
            average = (if pre(t) == 0 then 0 else pre(integral)/pre(t))*
              unit;
            reinit(integral, 0);
            reinit(t, 0);
          end when;

        end Averager;

        class Maxer "Traces maximum value in the signal"
          extends Abstraction.Analyzer;
          import Physiolibrary.Types.*;

          discrete T maximum(start=init) "Resulting real-time maximum";

        equation
          // Sampling needs to be used to avoid troubled integration of some variables (crashed)
          when {change(control),sample(0, 1e-2)} then
            maximum = if change(control) then 0 elseif condition then max(
              pre(maximum), pre(signal)) else pre(maximum);
          end when;

        end Maxer;
      end Analyzers;

      package RLC "Components with RLC characteristics"
        package Elements "Fundamental units for RLC"
          model R "Resistive port"
            extends Auxiliary.BlockKinds.Port;
            extends Physiolibrary.Icons.Resistor;
            import Physiolibrary.Types.*;

            input HydraulicResistance R "Current resistance";
            input Real nonlinearity=1
              "Special argument to allow for a non-linear term";

          equation
            cIn.q*R*nonlinearity = dp;
            0 = cIn.q + cOut.q;

          end R;

          model L "Port with inertance"
            extends Auxiliary.BlockKinds.Port;
            extends Physiolibrary.Icons.Inertance;
            import Physiolibrary.Types.*;

            input HydraulicInertance L=0 "Current inertance";

          equation
            der(cIn.q)*L = dp;
            0 = cIn.q + cOut.q;

          end L;

          model C "Compliance compartment"
            extends Auxiliary.BlockKinds.Hook;
            extends Physiolibrary.Icons.BloodElasticCompartment;
            import Physiolibrary.Types.*;

            parameter Volume V_init=0 "Starting volume";

            input HydraulicCompliance C "Current compliance";
            input Pressure pGround=0 "Grounding pressure";

            Pressure dp=c.pressure - pGround "Pressure gradient";
            Volume V(start=V_init) "Compartment volume";

          equation
            c.q = C*der(dp);
            c.q = der(V);

            annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                    extent={{-100,-100},{100,100}}), graphics));
          end C;

          model ExponentialResistance
            "Resistive port with exponential resistivity profile dp = Base*q^Exp"
            extends Auxiliary.BlockKinds.Port;
            extends Physiolibrary.Icons.Resistor;
            import Physiolibrary.Types.*;

            parameter Real Base "dp = base * Q^Exp ";
            parameter Real Exp "dp = base * Q^Exp ";
            parameter Boolean closed = false;
            parameter Real FrenchGauge = 10 "Outer diameter for computation of shear stress";
            parameter Modelica.SIunits.Thickness wallThickness = 0.8e-3 "For shear stress calculation only";
            parameter Real relativeViscosity = 1 "Transformation from water to blood";
            Modelica.SIunits.Diameter innerD = FrenchGauge / 3 * 1e-3 - 2*wallThickness;
            parameter Modelica.SIunits.Length l = 1;
            Modelica.SIunits.ShearStress shearStress = dp*innerD/l/4;
          //   Real qs=cIn.q^2;
          //   Real dps=dp^2;
          equation
            //   if noEvent(dp >= 0) and noEvent(cIn.q >= 0) then
            //     Base*cIn.q^Exp = dp;
            //     //log(dp/Base) = Exp*log(cIn.q);
            //
            //   else
            //     // just a numeric workaround for negative flows
            //     Base*(-cIn.q)^Exp = -dp;
            //     //    log(-dp/Base) = Exp*log(-cIn.q);
            //   end if;

            //   dp = if noEvent(dp >= 0) and noEvent(cIn.q >= 0) then Base*cIn.q^Exp else -
            //     Base*(-cIn.q)^Exp;
            if closed then
              cIn.q = 0;
              else
            cIn.q = if noEvent(dp >= 0) then (dp/Base/relativeViscosity)^(1/Exp) else -(-dp/
              Base/relativeViscosity)^(1/Exp);
            end if;

            0 = cIn.q + cOut.q;

            annotation (Icon(graphics={Line(
                    points={{-80,-60},{-20,-52},{38,-18},{60,60}},
                    color={28,108,200},
                    smooth=Smooth.Bezier), Text(
                    extent={{-68,-28},{54,38}},
                    lineColor={28,108,200},
                    textString="B^exp")}));
          end ExponentialResistance;
        end Elements;

        package Compounds "RLC circuits"
          model RC "Constant RC segment"
            extends BlockKinds.Port;
            import Physiolibrary.Types.*;

            parameter HydraulicResistance R "Constant resistance";
            parameter HydraulicCompliance C "Constant compliance";

            Volume V=capacitor.V "Segment volume";

            Elements.C capacitor(C=C) annotation (Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=0,
                  origin={40,-6})));
            Elements.R resistor(R=R) annotation (Placement(transformation(
                    extent={{-50,-10},{-30,10}})));

          equation
            connect(cIn, resistor.cIn) annotation (Line(
                points={{-80,0},{-48,0}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(resistor.cOut, capacitor.c) annotation (Line(
                points={{-32,0},{8,0},{8,-1},{40,-1}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(cOut, capacitor.c) annotation (Line(
                points={{80,0},{64,0},{64,-1},{40,-1}},
                color={0,0,255},
                smooth=Smooth.None));

            annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                    extent={{-100,-100},{100,100}}), graphics), Icon(
                  graphics={Text(
                    extent={{-32,26},{32,-24}},
                    lineColor={0,0,0},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid,
                    textStyle={TextStyle.Bold},
                                  textString="RC"),Text(
                    extent={{-70,86},{72,30}},
                    lineColor={0,0,0},
                    fillColor={86,199,10},
                    fillPattern=FillPattern.Solid,
                    textString="%name")}));
          end RC;

          model RLC "Constant RLC segment"
            extends BlockKinds.Port;
            import Physiolibrary.Types.*;

            parameter HydraulicResistance R "Constant resistance";
            parameter HydraulicInertance L "Constant inertance";
            parameter HydraulicCompliance C "Constant compliance";

            Volume V=capacitor.V "Segment volume";

            Elements.C capacitor(C=C) annotation (Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=0,
                  origin={40,-6})));
            Elements.L inductor(L=L) annotation (Placement(transformation(
                    extent={{-10,-10},{10,10}})));
            Elements.R resistor(R=R) annotation (Placement(transformation(
                    extent={{-50,-10},{-30,10}})));

          equation
            connect(cIn, resistor.cIn) annotation (Line(
                points={{-80,0},{-48,0}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(resistor.cOut, inductor.cIn) annotation (Line(
                points={{-32,0},{-8,0}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(inductor.cOut, capacitor.c) annotation (Line(
                points={{8,0},{28,0},{28,-1},{40,-1}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(cOut, capacitor.c) annotation (Line(
                points={{80,0},{64,0},{64,-1},{40,-1}},
                color={0,0,255},
                smooth=Smooth.None));

            annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                    extent={{-100,-100},{100,100}}), graphics), Icon(
                  graphics={Text(
                    extent={{-34,26},{30,-24}},
                    lineColor={0,0,0},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid,
                    textStyle={TextStyle.Bold},
                                  textString="RLC"),Text(
                    extent={{-70,86},{72,30}},
                    lineColor={0,0,0},
                    fillColor={86,199,10},
                    fillPattern=FillPattern.Solid,
                    textString="%name")}));
          end RLC;

          model CLR "Constant CLR segment"
            extends BlockKinds.Port;
            import Physiolibrary.Types.*;

            parameter HydraulicCompliance C "Constant compliance";
            parameter HydraulicInertance L "Constant inertance";
            parameter HydraulicResistance R "Constant resistance";

            Volume V=capacitor.V "Segment volume";

            Elements.C capacitor(C=C) annotation (Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=0,
                  origin={-40,-6})));
            Elements.L inductor(L=L) annotation (Placement(transformation(
                    extent={{-10,-10},{10,10}})));
            Elements.R resistor(R=R) annotation (Placement(transformation(
                    extent={{30,-10},{50,10}})));

          equation
            connect(inductor.cOut, resistor.cIn) annotation (Line(
                points={{8,0},{32,0}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(cOut, resistor.cOut) annotation (Line(
                points={{80,0},{48,0}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(cIn, capacitor.c) annotation (Line(
                points={{-80,0},{-56,0},{-56,-1},{-40,-1}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(inductor.cIn, capacitor.c) annotation (Line(
                points={{-8,0},{-20,0},{-20,-1},{-40,-1}},
                color={0,0,255},
                smooth=Smooth.None));

            annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                    extent={{-100,-100},{100,100}}), graphics), Icon(
                  graphics={Text(
                    extent={{-34,26},{30,-24}},
                    lineColor={0,0,0},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid,
                    textStyle={TextStyle.Bold},
                                  textString="CLR"),Text(
                    extent={{-66,86},{76,30}},
                    lineColor={0,0,0},
                    fillColor={86,199,10},
                    fillPattern=FillPattern.Solid,
                    textString="%name")}));
          end CLR;

          model CRL "Constant CRL segment"
            extends Auxiliary.BlockKinds.Port;
            import Physiolibrary.Types.*;

            parameter HydraulicCompliance C "Constant compliance";
            parameter HydraulicResistance R "Constant resistance";
            parameter HydraulicInertance L "Constant inertance";

            Volume V=capacitor.V "Segment volume";

            Elements.C capacitor(C=C) annotation (Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=0,
                  origin={-40,-6})));
            Elements.L inductor(L=L) annotation (Placement(transformation(
                    extent={{30,-10},{50,10}})));
            Elements.R resistor(R=R) annotation (Placement(transformation(
                    extent={{-10,-10},{10,10}})));

          equation
            connect(capacitor.c, cIn) annotation (Line(
                points={{-40,-1},{-60,-1},{-60,0},{-80,0}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(capacitor.c, resistor.cIn) annotation (Line(
                points={{-40,-1},{-20,-1},{-20,0},{-8,0}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(resistor.cOut, inductor.cIn) annotation (Line(
                points={{8,0},{32,0}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(cOut, inductor.cOut) annotation (Line(
                points={{80,0},{48,0}},
                color={0,0,255},
                smooth=Smooth.None));

            annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                    extent={{-100,-100},{100,100}}), graphics), Icon(
                  graphics={Text(
                    extent={{-34,26},{30,-24}},
                    lineColor={0,0,0},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid,
                    textStyle={TextStyle.Bold},
                                  textString="CRL"),Text(
                    extent={{-66,86},{76,30}},
                    lineColor={0,0,0},
                    fillColor={86,199,10},
                    fillPattern=FillPattern.Solid,
                    textString="%name")}));
          end CRL;

          model CLpRR "Constant C(L|R)R segment"
            extends CLR;
            import Physiolibrary.Types.*;

            parameter HydraulicResistance Rp "Constant parallel resistance";

            Elements.R resistorPar(R=Rp) annotation (Placement(
                  transformation(extent={{-10,10},{10,30}})));

          equation
            connect(resistorPar.cIn, inductor.cIn) annotation (Line(
                points={{-8,20},{-8,0}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(resistorPar.cOut, inductor.cOut) annotation (Line(
                points={{8,20},{8,0}},
                color={0,0,255},
                smooth=Smooth.None));

            annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                    extent={{-100,-100},{100,100}}), graphics), Icon(
                  graphics={Rectangle(
                    extent={{-48,18},{52,-18}},
                    lineColor={255,255,255},
                    fillColor={255,255,255},
                                  fillPattern=FillPattern.Solid),Text(
                    extent={{-34,26},{30,-24}},
                    lineColor={0,0,0},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid,
                    textStyle={TextStyle.Bold},
                    textString="CLpRR")}));
          end CLpRR;

          model CRLpR "Constant CR(L|R) segment"
            extends CRL;
            import Physiolibrary.Types.*;

            parameter HydraulicResistance Rp "Constant parallel resistance";

            Elements.R resistorPar(R=Rp) annotation (Placement(
                  transformation(extent={{30,14},{50,34}})));

          equation
            connect(resistorPar.cIn, inductor.cIn) annotation (Line(
                points={{32,24},{32,0}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(resistorPar.cOut, inductor.cOut) annotation (Line(
                points={{48,24},{48,0}},
                color={0,0,255},
                smooth=Smooth.None));

            annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                    extent={{-100,-100},{100,100}}), graphics), Icon(
                  graphics={Rectangle(
                    extent={{-50,18},{50,-18}},
                    lineColor={255,255,255},
                    fillColor={255,255,255},
                                  fillPattern=FillPattern.Solid),Text(
                    extent={{-34,26},{30,-24}},
                    lineColor={0,0,0},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid,
                    textStyle={TextStyle.Bold},
                    textString="CRLpR")}));
          end CRLpR;

          partial model LpRCR "Constant (L|R)CR segment"
            extends BlockKinds.Port;
            import Physiolibrary.Types.*;

            parameter HydraulicInertance L "Constant inertance";
            parameter HydraulicResistance Rp "Constant parallel resistance";
            parameter HydraulicCompliance C "Constant compliance";
            parameter HydraulicResistance R "Constant resistance";

            Volume V=capacitor.V "Segment volume";

            Elements.C capacitor(C=C) annotation (Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=0,
                  origin={0,-6})));
            Elements.L inductor(L=L) annotation (Placement(transformation(
                    extent={{-50,10},{-30,30}})));
            Elements.R resistorP(R=Rp) annotation (Placement(transformation(
                    extent={{-50,-30},{-30,-10}})));
            Elements.R resistor(R=R) annotation (Placement(transformation(
                    extent={{30,-10},{50,10}})));

          equation
            connect(inductor.cIn, cIn) annotation (Line(
                points={{-48,20},{-64,20},{-64,0},{-80,0}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(resistorP.cIn, cIn) annotation (Line(
                points={{-48,-20},{-64,-20},{-64,0},{-80,0}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(capacitor.c, inductor.cOut) annotation (Line(
                points={{0,-1},{-16,-1},{-16,20},{-32,20}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(capacitor.c, resistorP.cOut) annotation (Line(
                points={{0,-1},{-16,-1},{-16,-20},{-32,-20}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(capacitor.c, resistor.cIn) annotation (Line(
                points={{0,-1},{20,-1},{20,0},{32,0}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(cOut, resistor.cOut) annotation (Line(
                points={{80,0},{48,0}},
                color={0,0,255},
                smooth=Smooth.None));

            annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                    extent={{-100,-100},{100,100}}), graphics), Icon(
                  graphics={Text(
                    extent={{-34,26},{30,-24}},
                    lineColor={0,0,0},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid,
                    textStyle={TextStyle.Bold},
                                  textString="LpRCR"),Text(
                    extent={{-66,86},{76,30}},
                    lineColor={0,0,0},
                    fillColor={86,199,10},
                    fillPattern=FillPattern.Solid,
                    textString="%name")}));
          end LpRCR;

          model RRcC "Constant R(R-C) segment"
            extends BlockKinds.Port;
            import Physiolibrary.Types.*;

            parameter HydraulicCompliance C "Constant compliance";
            parameter HydraulicResistance Rc
              "Constant compliance resistance";
            parameter HydraulicResistance R "Constant resistance";

            Volume V=capacitor.V "Segment volume";

            Elements.C capacitor(C=C) annotation (Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=0,
                  origin={22,-34})));
            Elements.R resistor(R=R) annotation (Placement(transformation(
                    extent={{-50,-10},{-30,10}})));
            Elements.R resistorC(R=Rc) annotation (Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=-90,
                  origin={22,-8})));

          equation
            connect(cIn, resistor.cIn) annotation (Line(
                points={{-80,0},{-48,0}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(resistor.cOut, resistorC.cIn) annotation (Line(
                points={{-32,0},{22,0}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(cOut, resistorC.cIn) annotation (Line(
                points={{80,0},{22,0}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(resistorC.cOut, capacitor.c) annotation (Line(
                points={{22,-16},{22,-26},{22,-29},{22,-29}},
                color={0,0,255},
                smooth=Smooth.None));

            annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                    extent={{-100,-100},{100,100}}), graphics), Icon(
                  coordinateSystem(preserveAspectRatio=false, extent={{-100,
                      -100},{100,100}}), graphics={Text(
                    extent={{-32,26},{32,-24}},
                    lineColor={0,0,0},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid,
                    textStyle={TextStyle.Bold},
                                  textString="RRcC"),Text(
                    extent={{-66,84},{76,28}},
                    lineColor={0,0,0},
                    fillColor={86,199,10},
                    fillPattern=FillPattern.Solid,
                    textString="%name")}));
          end RRcC;

        end Compounds;

        package Tubes "Geometrical tubes with RLC characteristics"
          package Abstraction "Common ancestors"
            model Tube "Tube segment"
              extends Physiolibrary.Icons.HydraulicResistor;
              import Cardiovascular.Types.*;

              parameter Cardiovascular.Types.Length l "Length";
              parameter Cardiovascular.Types.Length r "Cross-sectional radius";

              annotation (Icon(coordinateSystem(preserveAspectRatio=false,
                      extent={{-100,-100},{100,100}})));

            end Tube;
          end Abstraction;

          model TubeR "Resistive tube"
            extends Abstraction.Tube;
            extends Elements.R(R=8*mu*l/pi/r^4);
            import Cardiovascular.Constants.*;
            import Modelica.Constants.*;

          end TubeR;

          model TubeRLC "Tube with resistance, inertance, and compliance"
            extends Abstraction.Tube;
            extends Compounds.RLC(
              R=qR*mu*l/pi/r^4,
              L=qL*rho*l/pi/r^2,
              C=qC*pi*r^3*l/E/h);
            import Cardiovascular.Constants.*;
            import Cardiovascular.Types.*;
            import Modelica.Constants.*;
            import Physiolibrary.Types.*;

            parameter Cardiovascular.Types.Length h "Wall thickness";
            parameter Pressure E "Young's elastic modulus";

            parameter Real qR=8
              "Numerical coefficient for resistance equation";
            parameter Real qL=1
              "Numerical coefficient for inertance equation";
            parameter Real qC=1.5
              "Numerical coefficient for compliance equation";

            annotation (Icon(graphics));
          end TubeRLC;

          model TubeRLC_Ferrari
            "Arterial segment as used by Ferrari et al. (2005)"
            extends TubeRLC(E=4.08*9.80665*1e4, qC=3.53);

          end TubeRLC_Ferrari;

          model TubeRLC_Derived
            "Arterial segment as used in the derived tree"
            extends TubeRLC(
              qC=3.53/arterialStiffnessScale,
              qL=8*(0.2057 - 0.0392),
              resistor(R=R + Rb + Rc));
            import Cardiovascular.Constants.*;
            import Cardiovascular.Types.*;
            import Modelica.Constants.*;
            import Physiolibrary.Types.*;

            outer parameter Cardiovascular.Types.Length cannulaOuterDiameter
              "Outer diameter of ECMO cannula";
            outer parameter Cardiovascular.Types.Length cannulaDepth
              "Insertion depth of ECMO cannula";
            outer parameter Fraction arterialStiffnessScale
              "Stifness scale coefficient";

            parameter Boolean isBranching=false
              "Whether the segment is after branching and should include branching resistance";
            parameter Boolean isCannulated=false
              "Whether a cannula is connected";

            parameter HydraulicResistance Rb=if isBranching then h/r*qRb
                 else 0 "Branching resistance";
            parameter HydraulicResistance Rc=if isCannulated then 8*mu*
                cannulaOuterDiameter/pi*(1/(((cannulaOuterDiameter*pi*r^2
                 - cannulaDepth*pi*(cannulaOuterDiameter/2)^2)/
                cannulaOuterDiameter/pi)^0.5)^4 - 1/r^4) else 0
              "Additional resistance according to volume of inserted cannula";

            constant Real qRb=100e6
              "Numerical coefficient for branching resistance equation";

            annotation (Icon(graphics));
          end TubeRLC_Derived;

          model TubeRLC_Derived_IABP
            "Arterial segment allowing for IABP connection as used in the derived tree"
            extends TubeRLC_Derived(resistor(R=(if enableIABP then R/(1 -
                    xi^4 - (1 - xi^2)^2/log(xi)) else R) + Rb + Rc),
                inductor(L=(if enableIABP then L/(1 - xi^2) else L)));
            import Cardiovascular.Constants.*;
            import Cardiovascular.Types.*;
            import Modelica.Constants.*;
            import Physiolibrary.Types.*;

            outer parameter Boolean enableIABP "Whether IABP is implanted";
            outer parameter Time tDeflation
              "Time of balloon deflation with respect to cardiac cycle duration";
            outer parameter Time tInflation
              "Time of balloon inflation with respect to cardiac cycle duration";

            outer Time cycleDuration "Duration of cardiac cycle";

            parameter Time flationDuration=80e-3
              "Duration of transition between inflation and deflation and vice versa";
            parameter Cardiovascular.Types.Length rIABPdeflated=5e-4
              "Radius of deflated balloon";
            parameter Cardiovascular.Types.Length rIABPinflated=8e-3
              "Radius of inflated balloon";
            parameter Pressure pIABPdeflated=-200*101325/760
              "Balloon pressure when deflated";
            parameter Pressure pIABPinflated=200*101325/760
              "Balloon pressure when inflated";
            parameter Boolean useIABP2=false
              "Whether the second IABP compliance should be used (applied in starting segment with IABP)";

            Boolean deflation(start=false)
              "Whether deflation is in progress";
            Boolean inflation(start=false)
              "Whether inflation is in progress";
            Pressure pIABP(start=if tInflation < tDeflation then
                  pIABPdeflated else pIABPinflated)
              "Current balloon pressure";
            Cardiovascular.Types.Length rIABP(start=if tInflation < tDeflation
                   then rIABPdeflated else rIABPinflated)
              "Current balloon radius";
            Time t "Current time with respect to cardiac cycle";
            Real xi=rIABP/r
              "Fraction of balloon radius and arterial radius";

            Elements.C capacitorIABP(C=0.1*C, pGround=pIABP) if enableIABP
              annotation (Placement(transformation(extent={{24,-46},{44,-26}})));
            Elements.C capacitorIABP2(C=0.1*C, pGround=pIABP) if useIABP2
               and enableIABP annotation (Placement(transformation(extent={
                      {-50,-46},{-30,-26}})));

          equation
            der(t) = 1;
            when t >= cycleDuration then
              reinit(t, t - cycleDuration);
            end when;

            if enableIABP then
              inflation = t >= tInflation and t <= tInflation +
                flationDuration or t + cycleDuration >= tInflation and t +
                cycleDuration <= tInflation + flationDuration;
              deflation = t >= tDeflation and t <= tDeflation +
                flationDuration or t + cycleDuration >= tDeflation and t +
                cycleDuration <= tDeflation + flationDuration;
              if inflation then
                der(rIABP) = (rIABPinflated - rIABPdeflated)/
                  flationDuration;
                der(pIABP) = (pIABPinflated - pIABPdeflated)/
                  flationDuration;
              elseif deflation then
                der(rIABP) = (rIABPdeflated - rIABPinflated)/
                  flationDuration;
                der(pIABP) = (pIABPdeflated - pIABPinflated)/
                  flationDuration;
              else
                der(rIABP) = 0;
                der(pIABP) = 0;
              end if;
            else
              inflation = false;
              deflation = false;
              rIABP = 1/inf;
              pIABP = 0;
            end if;

            connect(inductor.cOut, capacitorIABP.c) annotation (Line(
                points={{8,0},{18,0},{18,-31},{34,-31}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(capacitorIABP2.c, resistor.cIn) annotation (Line(
                points={{-40,-31},{-40,-14},{-48,-14},{-48,0}},
                color={0,0,255},
                smooth=Smooth.None));

            annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                    extent={{-100,-100},{100,100}}), graphics), Icon(
                  coordinateSystem(preserveAspectRatio=false, extent={{-100,
                      -100},{100,100}}), graphics={Text(
                    extent={{-62,-34},{62,-76}},
                    lineColor={127,0,127},
                    fillColor={86,199,10},
                    fillPattern=FillPattern.Solid,
                    textString="+IABP")}));
          end TubeRLC_Derived_IABP;
        end Tubes;
      end RLC;
    end Auxiliary;

    package Main "Main components of cardiovascular circuits"
      package Heart "Heart and its subparts"
        package Abstraction "Common ancestors"
          partial model HeartWall
            "Heart wall with sarcomere mechanics based on source code for CircAdapt by Arts et al. (2012)"
            import Cardiovascular.Model.Complex.Environment.*;
            import Cardiovascular.Types.*;
            import Modelica.Constants.*;
            import Physiolibrary.Types.*;

            outer Environment.ComplexEnvironment settings
              "Everything is out there...";

          //   discrete input Cardiovascular.Types.Area Am0(start=Am0_init,
          //       fixed=true) "Adaptable mid-wall area of dead space";
          //   discrete input Cardiovascular.Types.Area AmRef(start=AmRef_init,
          //       fixed=true) "Adaptable mid-wall area of cavity";
          //   discrete input Pressure sigmaPRef(start = sigmaPRef_init, fixed = true)
          //     "Adaptable reference passive myofiber stress";
          //   discrete input Volume VW(start = VW_init, fixed = true)
          //     "Adaptable wall volume";
          // DISABLING THE ADAPTATION
            Cardiovascular.Types.Area Am0=Am0_init;
            Cardiovascular.Types.Area AmRef=AmRef_init;
            Pressure sigmaPRef=sigmaPRef_init;
            Volume VW=VW_init;

            input Real tauA "Activation time coefficient";
            input Time tDelay
              "Delay in contraction with respect to start of cardiac cycle";

            // constant parameters
            parameter Cardiovascular.Types.Length LsP0=settings.constants.LsP0
              "Sarcomere length with zero passive stress";
            parameter Cardiovascular.Types.Length Lsc0=settings.constants.Lsc0
              "Length of contractile sarcomere element with zero passive stress";
            parameter Cardiovascular.Types.Length LseIso=settings.constants.LseIso
              "Reference length of isometrically stressed elastic sarcomere element";
            parameter Cardiovascular.Types.Length LsRef=settings.constants.LsRef
              "Reference sarcomere length";

            // top-level parameters
            parameter Cardiovascular.Types.Area Am0_init
              "Starting value of mid-wall area of dead space";
            parameter Cardiovascular.Types.Area AmRef_init
              "Starting value of mid-wall surface area";
            parameter Fraction contractilityScale=1
              "Scaling coefficient of contractility";
            parameter Real CRest=settings.constants.CRest
              "Contractility at fiber rest";

            parameter Pressure sigmaPRef_init
              "Starting value of reference passive myofiber stress";
            parameter Volume VW_init "Starting value of wall volume";

            // parameters to distinguish Atria and Ventricles during inheritance
            parameter Cardiovascular.Types.Length dLsP
              "Passive stress coefficient";
            parameter Pressure sigmaARef "Reference active myofiber stress";
            parameter Real tauS "Time scaling coefficient";
            parameter Velocity vMax
              "Reference maximal sarcomere contraction velocity";

            Real epsilon=0.5*log(max(1e-9, Am - Am0)/AmRef) - 1/12*z^2 -
                0.019*z^4 "Natural myofiber strain";
            Cardiovascular.Types.Length Ls=LsRef*exp(epsilon)
              "Sarcomere length";
            Cardiovascular.Types.Length LscNorm=max(0.0001, (Lsc - Lsc0)*1e6)
              "Normalized length of contractile sarcomere element";
            Cardiovascular.Types.Length Lse=Ls - Lsc
              "Length of elastic sarcomere element";
            Real LseNorm=max(-0.02, Lse/LseIso)
              "Normalized length of elastic sarcomere element";
            Pressure pT=2*Tm*Cm "Transmural pressure";
            Pressure sigma=max(0.2*sigmaP, sigmaP) + sigmaA
              "Total myofiber stress";
            Pressure sigmaA=sigmaARef*LscNorm*((C + CRest)*LseNorm - CRest)
              "Active myofiber stress";
            Pressure sigmaP=sigmaPRef*(0.12*(cosh(5*smooth(1, noEvent(if Ls
                 > LsP0 then LsP0/dLsP*log(Ls/LsP0) else 0.0))) - 1) + (log(
                Ls/LsRef) + 0.1)) "Passive myofiber stress";
            Real tauD=tauS*0.33*tauA
              "Time coefficient for contractility decay";
            Real tauR=tauS*0.55*tauA
              "Time coefficient for contractility rise";
            Real Tm(unit="kg/s2") = VW*sigma/2/Am*(1 + 0.27*z^2)
              "Total wall tension";
            Real xD=(t - tDelay - tauA*(0.65 + 0.7*LscNorm))/tauD
              "Auxiliary coefficient for modeling contractility decay";
            Real xR=min(8, max(0, (t - tDelay)/tauR))
              "Auxiliary coefficient for modeling contractility rise";
            Real z=3*Cm*VW/2/(Am - Am0)
              "Auxiliary coefficient for computing natural myofiber strain";

            // differentiated variables
            Cardiovascular.Types.Length Lsc
              "Length of contractile sarcomere element";
            Real C(start=0, fixed=true) "Current contractility";
            Time t(start=0, fixed=true) "Time from start of cardiac cycle";

            // abstract variables
            Cardiovascular.Types.Area Am(start=AmRef_init, fixed=true)
              "Current mid-wall area";
            Volume Vm "Current Mid-wall volume";
            Real Cm(unit="m-1") "Mid-wall curvature";
          equation
            der(Lsc) = max(LseNorm - 1, tanh(10*C + max(0, 1e-4*sigmaP^2))*
              (LseNorm - 1))*vMax;
            der(C) = contractilityScale*(if t - tDelay < 0 then 0 else 1/
              tauR*tanh(4*LscNorm^2)*0.02*xR^3*(8 - xR)^2*exp(-xR) - 1/tauD
              *C*(0.5 + 0.5*sin((if xD >= 0 then 1 else -1)*min(pi/2, abs(
              xD)))));
            der(t) = 1;
            when t - tDelay >= settings.condition.cycleDuration then
              reinit(t, t - settings.condition.cycleDuration);
            end when;

          end HeartWall;
        end Abstraction;

        model Heart "Heart model including coronaries"
          extends Cardiovascular.Icons.Heart_detailed;
          import Cardiovascular.Model.Complex.Components.Auxiliary.Analyzers.*;
          import Cardiovascular.Model.Complex.Components.Auxiliary.Connectors.*;
          import Cardiovascular.Model.Complex.Components.Main.Vessels.*;
          import Cardiovascular.Model.Complex.Environment.*;
          import Physiolibrary.Types.*;

          outer Environment.ComplexEnvironment settings
            "Everything is out there...";
          inner Pressure pP=pPRef*(VP/VPRef)^kP "Pericardial pressure";

        //   discrete input Volume VPRef(start = VPRef_init, fixed = true)
        //     "Adaptable reference pericardial volume";
        // DISABLING THE ADAPTATION
          Volume VPRef=VPRef_init;

          parameter Real kP
            "Pericardial stiffness non-linearity coefficient";
          parameter Pressure pPRef "Pericardiial reference pressure";
          parameter Volume VPRef_init
            "Starting value of pericardial reference volume";

          Volume V=RA.V + LA.V + ventricles.VLV + ventricles.VRV + Coro.V
            "Current blood volume";
          Volume VP=RA.V + LA.V + ventricles.VLV + ventricles.VRV +
              ventricles.LW.VW + ventricles.SW.VW + ventricles.RW.VW + RA.VW
               + LA.VW "Current pericardial volume";

          Ventricles ventricles(pP=pP) annotation (Placement(transformation(
                  extent={{-32,-110},{28,-50}})));
          AtrialWall LA(
            AmRef_init=settings.initialization.LA_AmRef,
            sigmaPRef_init=settings.initialization.LA_sigmaPRef,
            Am0_init=settings.initialization.LA_Am0,
            tauA=settings.initialization.LA_tauA_Base + settings.initialization.LA_tauA_CycleFraction
                *settings.condition.cycleDuration,
            tDelay=settings.initialization.LA_tDelay_Base + settings.initialization.LA_tDelay_CycleFraction
                *settings.condition.cycleDuration,
            VW_init=settings.initialization.LA_VW,
            pP=0.5*pP,
            contractilityScale=settings.constants.LA_contractilityScale)
            annotation (Placement(transformation(extent={{58,-40},{16,-2}})));
          AtrialWall RA(
            AmRef_init=settings.initialization.RA_AmRef,
            sigmaPRef_init=settings.initialization.RA_sigmaPRef,
            Am0_init=settings.initialization.RA_Am0,
            tauA=settings.initialization.RA_tauA_Base + settings.initialization.RA_tauA_CycleFraction
                *settings.condition.cycleDuration,
            tDelay=settings.initialization.RA_tDelay_Base + settings.initialization.RA_tDelay_CycleFraction
                *settings.condition.cycleDuration,
            VW_init=settings.initialization.RA_VW,
            pP=pP,
            contractilityScale=settings.constants.RA_contractilityScale)
            annotation (Placement(transformation(extent={{-68,-58},{-22,-12}})));
          CoronaryVessels Coro(pM=ventricles.pM) annotation (Placement(
                transformation(extent={{28,-42},{-34,20}})));
          Valve vLAV(
            Ko=settings.initialization.vLAV_Ko,
            Kc=settings.initialization.vLAV_Kc,
            Mrg=settings.initialization.vLAV_Mrg,
            Mst=settings.initialization.vLAV_Mst,
            ARef_init=settings.initialization.vLAV_ARef,
            l=settings.initialization.vLAV_l,
            dpO=settings.initialization.vLAV_dpO,
            dpC=settings.initialization.vLAV_dpC) annotation (Placement(
                transformation(
                extent={{-9.5963,-8.85676},{9.5963,8.85676}},
                rotation=230,
                origin={29.3837,-52.9558})));
          Valve vRAV(
            Ko=settings.initialization.vRAV_Ko,
            Kc=settings.initialization.vRAV_Kc,
            Mrg=settings.initialization.vRAV_Mrg,
            Mst=settings.initialization.vRAV_Mst,
            ARef_init=settings.initialization.vRAV_ARef,
            l=settings.initialization.vRAV_l,
            dpO=settings.initialization.vRAV_dpO,
            dpC=settings.initialization.vRAV_dpC) annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                rotation=-55,
                origin={-32,-56})));
          Valve vSA(
            Ko=settings.initialization.vSA_Ko,
            Kc=settings.initialization.vSA_Kc,
            Mrg=settings.initialization.vSA_Mrg,
            Mst=settings.initialization.vSA_Mst,
            ARef_init=settings.initialization.vSA_ARef,
            l=settings.initialization.vSA_l,
            dpO=settings.initialization.vSA_dpO,
            dpC=settings.initialization.vSA_dpC) annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                rotation=89,
                origin={10,-40})));
          Valve vPA(
            Ko=settings.initialization.vPA_Ko,
            Kc=settings.initialization.vPA_Kc,
            Mrg=settings.initialization.vPA_Mrg,
            Mst=settings.initialization.vPA_Mst,
            ARef_init=settings.initialization.vPA_ARef,
            l=settings.initialization.vPA_l,
            dpO=settings.initialization.vPA_dpO,
            dpC=settings.initialization.vPA_dpC) annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                rotation=89,
                origin={-10,-40})));
          Valve vSV(
            Ko=settings.initialization.vSV_Ko,
            Kc=settings.initialization.vSV_Kc,
            Mrg=settings.initialization.vSV_Mrg,
            Mst=settings.initialization.vSV_Mst,
            ARef_init=settings.initialization.vSV_ARef,
            l=settings.initialization.vSV_l,
            dpO=settings.initialization.vSV_dpO,
            dpC=settings.initialization.vSV_dpC) annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                rotation=-91,
                origin={-44,0})));
          Valve vPV(
            Ko=settings.initialization.vPV_Ko,
            Kc=settings.initialization.vPV_Kc,
            Mrg=settings.initialization.vPV_Mrg,
            Mst=settings.initialization.vPV_Mst,
            ARef_init=settings.initialization.vPV_ARef,
            l=settings.initialization.vPV_l,
            dpO=settings.initialization.vPV_dpO,
            dpC=settings.initialization.vPV_dpC) annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                rotation=-91,
                origin={34,10})));
          In cVSV "Right atrial inlet - To be connected to systemic veins"
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=-90,
                origin={-42,24}), iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=-60,
                origin={-42,24})));
          In cVPV "Left atrial inlet - To be connected to pulmonary veins"
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=-90,
                origin={32,36}), iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=-75,
                origin={32,36})));
          Out cVSA "Aortic valve - To be connected to systemic arteries"
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=110,
                origin={-24,40}), iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=110,
                origin={-24,40})));
          Out cVPA
            "Pulmonary valve - To be connected to pulmonary arteries"
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=80,
                origin={4,44}), iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=80,
                origin={4,44})));

        equation

          connect(cVSV, vSV.cIn) annotation (Line(
              points={{-42,24},{-44,24},{-44,7.99878},{-43.8604,7.99878}},
              color={127,5,58},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(vSV.cOut, RA.c) annotation (Line(
              points={{-44.1396,-7.99878},{-44,-7.99878},{-44,-23.5},{-45,-23.5}},
              color={127,5,58},
              smooth=Smooth.Bezier,
              thickness=1));

          connect(RA.c, vRAV.cIn) annotation (Line(
              points={{-45,-23.5},{-44,-23.5},{-44,-48},{-42,-48},{-42,-49.4468},
                  {-36.5886,-49.4468}},
              color={127,5,58},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(cVPV, vPV.cIn) annotation (Line(
              points={{32,36},{34,36},{34,17.9988},{34.1396,17.9988}},
              color={255,0,0},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(vPV.cOut, LA.c) annotation (Line(
              points={{33.8604,2.00122},{36,2.00122},{36,-11.5},{37,-11.5}},
              color={255,0,0},
              smooth=Smooth.Bezier,
              thickness=1));

          connect(vLAV.cIn, LA.c) annotation (Line(
              points={{34.3184,-47.0748},{36,-47.0748},{36,-11.5},{37,-11.5}},
              color={255,0,0},
              smooth=Smooth.Bezier,
              thickness=1));

          connect(vLAV.cOut, ventricles.cLV) annotation (Line(
              points={{24.449,-58.8368},{30,-58.8368},{24,-58.8368},{24,-68},
                  {12,-68},{12,-67.4},{8.8,-67.4}},
              color={255,0,0},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(ventricles.cLV, vSA.cIn) annotation (Line(
              points={{8.8,-67.4},{8,-67.4},{8,-47.9988},{9.86038,-47.9988}},
              color={255,0,0},
              smooth=Smooth.Bezier,
              thickness=1));

          connect(vSA.cOut, cVSA) annotation (Line(
              points={{10.1396,-32.0012},{8,-32.0012},{8,-20},{-20,-20},{-20,
                  38},{-24,38},{-24,40}},
              color={255,0,0},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(ventricles.cRV, vRAV.cOut) annotation (Line(
              points={{-11.6,-68},{-26,-68},{-26,-62},{-27.4114,-62},{-27.4114,
                  -62.5532}},
              color={127,5,58},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(ventricles.cRV, vPA.cIn) annotation (Line(
              points={{-11.6,-68},{-11.6,-66},{-10,-66},{-10,-62},{-10.1396,
                  -62},{-10.1396,-47.9988}},
              color={127,5,58},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(vPA.cOut, cVPA) annotation (Line(
              points={{-9.86038,-32.0012},{-10,-32.0012},{-10,-24},{4,-24},
                  {4,44}},
              color={127,5,58},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(vSA.cOut, Coro.cIn) annotation (Line(
              points={{10.1396,-32.0012},{10,-32.0012},{10,-32},{10,-24},{
                  22,-24},{22,-10},{22,-12},{21.8,-12},{21.8,-11}},
              color={255,0,0},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(RA.c, Coro.cOut) annotation (Line(
              points={{-45,-23.5},{-40,-23.5},{-40,-12},{-28,-12},{-28,-10},
                  {-28,-12},{-27.8,-12},{-27.8,-11}},
              color={127,5,58},
              smooth=Smooth.Bezier,
              thickness=1));

          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics), Icon(
                coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                    {100,100}})));
        end Heart;

        model Valve "Heart valves with finite-time state transition"
          extends Auxiliary.BlockKinds.Port;
          extends Cardiovascular.Icons.Valve;
          import Cardiovascular.Constants.*;
          import Cardiovascular.Types.*;
          import Physiolibrary.Types.*;

          // discrete input Cardiovascular.Types.Area ARef(start=ARef_init,
          //       fixed=true) "Adaptable cross-sectional area";
        // DISABLING THE ADAPTATION
          Cardiovascular.Types.Area ARef=ARef_init;

          parameter Cardiovascular.Types.Area ARef_init
            "Starting value of reference cross-sectional area";
          parameter Position l "Length of valve segment";
          parameter Pressure dpO=0 "Opening pressure";
          parameter Pressure dpC=0 "Closing pressure";
          parameter Real Ko(unit="m2/(N.s)") "Opening rate coefficient";
          parameter Real Kc(unit="m2/(N.s)") "Closing rate coefficient";
          parameter Fraction Mrg=0 "Ratio of valve regurgitation";
          parameter Fraction Mst=0 "Valve stenosis ratio";

          Cardiovascular.Types.Area A=(AMax - AMin)*s + AMin
            "Current cross-sectional area";
          Cardiovascular.Types.Area AMin=Mrg*ARef + 1e-10
            "Cross-sectional area when closed, with miniature hole to prevent zero division";
          Cardiovascular.Types.Area AMax=(1 - Mst)*ARef
            "Cross-sectional area when open";

          Real s(start=1, fixed=true)
            "Opening state (1 = open .. 0 = closed)";
          Real R(unit="kg/m7") "Bernoulli resistance";
          HydraulicInertance L "Inertance";
        equation
          cIn.q = -cOut.q;

          if noEvent(A > 0) then
            dp = R*cIn.q*abs(cIn.q) + L*der(cIn.q);
            R = rho/2/A^2;
            L = rho*l/A;
          else
            cIn.q = 0;
            R = Modelica.Constants.inf;
            L = Modelica.Constants.inf;
          end if;

          if dp > dpO then
            der(s) = (1 - s)*Ko*(dp - dpO);
          elseif dp < dpC then
            der(s) = s*Kc*(dp - dpC);
          else
            der(s) = 0;
          end if;

          annotation (Icon(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}})));
        end Valve;

        model AtrialWall "Atrial wall and cavity"
          extends Cardiovascular.Icons.Atrium;
          extends Hook;
          extends Abstraction.HeartWall(
            dLsP=settings.constants.atriumDLsP,
            vMax=settings.constants.atriumVMax,
            tauS=settings.constants.atriumTauS,
            sigmaARef=settings.constants.atriumSigmaARef);
          import Cardiovascular.Model.Complex.Components.Auxiliary.BlockKinds.*;
          import Modelica.Constants.*;
          import Physiolibrary.Types.*;

          input Pressure pP "Pericardial pressure";

          Pressure p=pT + pP "Current atria pressure";
          Volume V "Current atria volume";

        equation
          // connector connection - 1+
          c.q = der(V) - (if V < 10e-6 then 700*(10e-6 - V) else 0);
          // Protection against near-zero volumes
          c.pressure = p;

          // implementation of inherited variables
          Vm = V + 0.5*VW;
          Cm = (4*pi/(3*Vm))^(1/3);
          Am = 4*pi/Cm^2;
          annotation (Documentation(info="<html>
<p>from triseg nodel</p>
</html>"), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                    {100,100}})));
        end AtrialWall;

        model VentricularWall "Ventricular free or sepal wall"
          extends Abstraction.HeartWall(
            dLsP=settings.constants.ventricleDLsP,
            vMax=settings.constants.ventricleVMax,
            tauS=settings.constants.ventricleTauS,
            sigmaARef=settings.constants.ventricleSigmaARef);
          extends Physiolibrary.Icons.HeartVentricle;
          import Cardiovascular.Types.*;

        //   discrete input Real EAmRef(start = EAmRef_init, fixed = true)
        //     "Adaptable correctional coefficient for sepal wall geometry";
        // DISABLING THE ADAPTATION
          Real EAmRef=EAmRef_init;

          parameter Real EAmRef_init=0
            "Starting value of the correctional coefficient";

          input Cardiovascular.Types.Length xm
            "Wall extension along the x-axis";
          input Cardiovascular.Types.Length ym(start=0.033)
            "Wall extension along the y-axis";

          Real sinAlpha=2*xm*ym/(xm^2 + ym^2)
            "Sinus of angle of spherical surface";
          Real cosAlpha=(ym^2 - xm^2)/(xm^2 + ym^2)
            "Cosinus of angle of spherical surface";
          Real Tx(unit="kg/s2") = Tm*sinAlpha "Axial wall tension";
          Real Ty(unit="kg/s2") = Tm*cosAlpha "Radial wall tension";

        equation
          // implementation of inherited variables
          Vm = Modelica.Constants.pi/6*xm*(xm^2 + 3*ym^2);
          Am = Modelica.Constants.pi*(xm^2 + ym^2);
          Cm = 2*xm/(xm^2 + ym^2);

        end VentricularWall;

        model Ventricles "Model of interacting ventricles"
          extends Cardiovascular.Icons.Ventricle;
          import Cardiovascular.Model.Complex.Components.Auxiliary.Connectors.*;
          import Cardiovascular.Model.Complex.Environment.*;
          import Cardiovascular.Types.*;
          import Physiolibrary.Types.*;

          outer Environment.ComplexEnvironment settings
            "Everything is out there...";

          input Pressure pP "Pericardial pressure";

          Volume VLV "Volume of left ventricle";
          Volume VRV "Volume of right ventricle";
          Pressure pLV=LW.pT + pP "Pressure in left ventricle";
          Pressure pRV=RW.pT + pP "Pressure in right ventricle";
          Pressure pM=sigmaRM + pLV*(rO - rM)/(rO - rI)
            "Intramyocardial pressure for left ventricle";

        protected
          Cardiovascular.Types.Length rO=(3*(VLV + (LW.VW + SW.VW)*1)/4/
              Modelica.Constants.pi)^(1/3) "Radial position at outer surface";
          Cardiovascular.Types.Length rI=(3*(VLV + (LW.VW + SW.VW)*0)/4/
              Modelica.Constants.pi)^(1/3) "Radial position at inner surface";
          Cardiovascular.Types.Length rM=(3*(VLV + (LW.VW + SW.VW)/3)/4/
              Modelica.Constants.pi)^(1/3)
            "Radial possition at representative position (1 / 3) inside the wall";
          Real lambdaR=(((VLV + (LW.VW + SW.VW)/3)/(60e-6 + (LW.VW + SW.VW)
              /3))^(1/3))^(-2) "Radial fiber stretch ratio";
          Pressure sigmaRM=if lambdaR < 1 then 0 else 0.2e3*(exp(9*(lambdaR
               - 1)) - 1) "Radial passive wall stress";
          Real e
            "Error in sum of radial wall tensions for their adjustment";

        public
          Through cRV "Connector to right ventricle" annotation (Placement(
                transformation(extent={{-42,30},{-22,50}}),
                iconTransformation(extent={{-42,30},{-22,50}})));
          Through cLV "Connector to left ventricle" annotation (Placement(
                transformation(extent={{26,32},{46,52}}),
                iconTransformation(extent={{26,32},{46,52}})));

          VentricularWall LW(
            AmRef_init=settings.initialization.LW_AmRef,
            sigmaPRef_init=settings.initialization.LW_sigmaPRef,
            Am0_init=settings.initialization.LW_Am0,
            tauA=settings.initialization.LW_tauA_Base + settings.initialization.LW_tauA_CycleFraction
                *settings.condition.cycleDuration,
            tDelay=settings.initialization.LW_tDelay_Base + settings.initialization.LW_tDelay_CycleFraction
                *settings.condition.cycleDuration,
            EAmRef_init=settings.initialization.LW_EAmRef,
            VW_init=settings.initialization.LW_VW,
            contractilityScale=settings.constants.LW_contractilityScale)
            annotation (Placement(transforMation(extent={{-48,26},{-28,46}})));
          VentricularWall SW(
            AmRef_init=settings.initialization.SW_AmRef,
            sigmaPRef_init=settings.initialization.SW_sigmaPRef,
            Am0_init=settings.initialization.SW_Am0,
            tauA=settings.initialization.SW_tauA_Base + settings.initialization.SW_tauA_CycleFraction
                *settings.condition.cycleDuration,
            tDelay=settings.initialization.SW_tDelay_Base + settings.initialization.SW_tDelay_CycleFraction
                *settings.condition.cycleDuration,
            EAmRef_init=settings.initialization.SW_EAmRef,
            VW_init=settings.initialization.SW_VW,
            contractilityScale=settings.constants.SW_contractilityScale)
            annotation (Placement(transforMation(extent={{-18,4},{2,24}})));
          VentricularWall RW(
            AmRef_init=settings.initialization.RW_AmRef,
            sigmaPRef_init=settings.initialization.RW_sigmaPRef,
            Am0_init=settings.initialization.RW_Am0,
            tauA=settings.initialization.RW_tauA_Base + settings.initialization.RW_tauA_CycleFraction
                *settings.condition.cycleDuration,
            tDelay=settings.initialization.RW_tDelay_Base + settings.initialization.RW_tDelay_CycleFraction
                *settings.condition.cycleDuration,
            EAmRef_init=settings.initialization.RW_EAmRef,
            VW_init=settings.initialization.RW_VW,
            contractilityScale=settings.constants.RW_contractilityScale)
            annotation (Placement(transforMation(extent={{10,-20},{30,0}})));

        equation
          // missing definitions for following inputs :
          // Am0 (ihnerited from HeartWall)
          // AmRef (ihnerited from HeartWall)
          // EAmRef (ihnerited from HeartWall)
          // VW (ihnerited from HeartWall)
          // sigmaPRef (from VentricularWall)

          LW.Tx = RW.Tx + SW.Tx;
          LW.Ty + RW.Ty + SW.Ty = e;
          // This workaround needed because direct enforcement of equality of radial tensions led to numerical crashes in some cases
          der(LW.ym) = -e*1e6;
          // part of the workaround
          SW.ym = RW.ym;
          SW.ym = LW.ym;

          // ventricles volume
          LW.Vm = +VLV + 0.5*LW.VW + 0.5*SW.VW - SW.Vm;
          RW.Vm = +VRV + 0.5*RW.VW + 0.5*SW.VW + SW.Vm;

          // connectors connection
          cLV.pressure = pLV;
          cRV.pressure = pRV;
          cLV.q = der(VLV);
          cRV.q = der(VRV);

          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics), Icon(
                coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                    {100,100}})));
        end Ventricles;

        model HeartLVCannulated
          extends Heart;
          Auxiliary.Connectors.Out LVcannula
            "Pulmonary valve - To be connected to pulmonary arteries"
            annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=80,
                origin={90,-68}), iconTransformation(
                extent={{-10,-10},{10,10}},
                rotation=80,
                origin={100,2})));
        equation
          connect(ventricles.cLV, LVcannula) annotation (Line(points={{8.8,
                  -67.4},{47.4,-67.4},{47.4,-68},{90,-68}}, color={197,52,
                  16}));
          annotation (Icon(graphics={Polygon(
                              points={{32,-8},{40,2},{98,2},{96,-2},{42,-2},
                    {32,-8}}, lineColor={0,0,255},
                  lineThickness=1,
                  fillColor={0,0,255},
                  fillPattern=FillPattern.Solid)}), Diagram(
                coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                    {100,100}})));
        end HeartLVCannulated;
      end Heart;

      package Vessels "Human vessels"
        package Abstraction "Common ancestors"
          partial model Vessels "General block for vessels"
            extends Auxiliary.BlockKinds.Port;
            import Physiolibrary.Types.RealIO.*;

            PressureOutput pInner "Output pressure for cappilary control"
              annotation (Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=-90,
                  origin={0,-80}), iconTransformation(
                  extent={{-10,-10},{10,10}},
                  rotation=-90,
                  origin={0,-10})));

            annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                    extent={{-100,-100},{100,100}}), graphics), Icon(
                  coordinateSystem(preserveAspectRatio=false, extent={{-100,
                      -100},{100,100}}), graphics));
          end Vessels;

          partial model AdaptableVessels
            "Vessels compatible with adaptation protocol based on source code for CircAdapt by Arts et al. (2012)"
            extends Abstraction.Vessels;
            import Cardiovascular.Model.Complex.Components.Auxiliary.RLC.*;
            import Cardiovascular.Types.*;
            import Physiolibrary.Types.*;
            import Physiolibrary.Hydraulic.Sensors.*;

            inner parameter Real k "Stiffness non-linearity coefficient";
            inner parameter Cardiovascular.Types.Length l "Length of vessels";
            inner parameter Cardiovascular.Types.Area AW_init
              "Starting value for wall cross-sectional area";
            inner parameter Cardiovascular.Types.Area ARef_init
              "Starting value of reference inner cross-sectional area";
            inner parameter Pressure pRef_init
              "Starting value of reference pressure";

            Volume V=core.V "Current volume";

            Elements.R RWave(R=core.RWave) annotation (Placement(
                  transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=-90,
                  origin={-10,-8})));
            AdaptableVesselsCore core annotation (Placement(transformation(
                    extent={{-20,-46},{0,-26}})));
            PressureMeasure pressureMeasure annotation (Placement(
                  transformation(extent={{-4,-34},{16,-14}})));

          equation
            connect(RWave.cOut, core.c) annotation (Line(
                points={{-10,-16},{-10,-31}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(RWave.cIn, cOut) annotation (Line(
                points={{-10,0},{80,0}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(RWave.cIn, cIn) annotation (Line(
                points={{-10,0},{-80,0}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(core.c, pressureMeasure.q_in)   annotation (Line(
                points={{-10,-31},{2,-31},{2,-30}},
                color={0,0,255},
                smooth=Smooth.None));
            connect(pressureMeasure.pressure, pInner) annotation (Line(
                points={{12,-28},{22,-28},{22,-66},{0,-66},{0,-80},{0,-80}},
                color={0,0,127},
                smooth=Smooth.None));

            annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                    extent={{-100,-100},{100,100}}), graphics), Icon(
                  coordinateSystem(preserveAspectRatio=false, extent={{-100,
                      -100},{100,100}}), graphics={Text(
                    extent={{-40,20},{40,80}},
                    lineColor={0,0,0},
                    textString="A",
                    fontName="Bauhaus 93",
                    textStyle={TextStyle.Bold})}));
          end AdaptableVessels;

          model Capillaries "Port for capillaries"
            extends Auxiliary.RLC.Elements.R(dp=pIn - pOut, R=R_R);
            import Physiolibrary.Types.RealIO.*;
            import Physiolibrary.Types.*;

            PressureInput pIn annotation (Placement(transformation(extent={
                      {-66,-90},{-26,-50}}), iconTransformation(
                  extent={{15,-15},{-15,15}},
                  rotation=-90,
                  origin={-39,-57})));
            PressureInput pOut annotation (Placement(transformation(extent=
                      {{52,-92},{92,-52}}), iconTransformation(
                  extent={{-15,-15},{15,15}},
                  rotation=90,
                  origin={39,-57})));
            HydraulicResistance R_R;
          equation
            der(R_R) = 0;
            // R is adaptable via reinit()

            annotation (Icon(coordinateSystem(preserveAspectRatio=false,
                    extent={{-100,-100},{100,100}}), graphics={Rectangle(
                    extent={{-70,30},{70,-30}},
                    lineColor={255,255,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid)}), Diagram(
                  coordinateSystem(preserveAspectRatio=false, extent={{-100,
                      -100},{100,100}})));
          end Capillaries;
        end Abstraction;

        model AdaptableVesselsCore "Compliance core of adaptable vessels"
          extends Hook;
          extends Physiolibrary.Icons.ElasticBalloon;
          import Cardiovascular.Model.Complex.Components.Auxiliary.BlockKinds.*;
          import Cardiovascular.Constants.*;
          import Cardiovascular.Types.*;
          import Cardiovascular.Types.IO.*;
          import Physiolibrary.Types.*;

          outer parameter Real k "Stiffness non-linearity coefficient";
          outer parameter Cardiovascular.Types.Length l "Length of vessels";
          outer parameter Cardiovascular.Types.Area AW_init
            "Starting value for wall cross-sectional area";
          outer parameter Cardiovascular.Types.Area ARef_init
            "Starting value of reference inner cross-sectional area";
          outer parameter Pressure pRef_init
            "Starting value of reference pressure";

          // discrete input Cardiovascular.Types.Area AW(start=AW_init, fixed=true)
          //   "Adaptable wall cross-sectional area";
          // discrete input Cardiovascular.Types.Area ARef(start=ARef_init, fixed=true)
          //   "Adaptable reference inner cross-sectional area";
          // discrete input Pressure pRef(start = pRef_init, fixed = true)
          //   "Adaptable reference pressure";
          // DISABLING THE ADAPTATION

          Cardiovascular.Types.Area AW=AW_init;
          Cardiovascular.Types.Area ARef=ARef_init;
          Pressure pRef=pRef_init;

          Cardiovascular.Types.Area A "Inner cross-sectional area";
          Volume VW "Wall volume";
          Volume VRef "Reference volume";
          Volume V(start=l*ARef_init, fixed=true) "Current volume";

          Pressure p "Wave-smoothed inner pressure";

          HydraulicResistanceOutput RWave annotation (Placement(
                transformation(
                extent={{-10,-10},{10,10}},
                rotation=-90,
                origin={0,-70})));

        equation
          VRef = ARef*l;
          V = A*l;
          VW = AW*l;

          RWave = (rho*(k - 3)*max(1.0, p)/3)^0.5/(A + AW/3);

          // For an unknown reason, this won't compile for the Abdolrazaghi tree:
          //   p = pRef * ((VW + 3 * V) / (VW + 3 * VRef)) ^ ((k - 3) / 3);
        //   p = pre(pRef) * ((pre(AW) * l + 3 * V) / (pre(AW) * l + 3 * pre(ARef) * l)) ^ ((k - 3) / 3);

          // DISABLING THE ADAPTATION
          p = pRef*((VW + 3*V)/(VW + 3*VRef))^((k - 3)/3);

          c.pressure = p;
          c.q = der(V);

          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics));
        end AdaptableVesselsCore;

        model AdaptableArteries
          extends Cardiovascular.Icons.Arteries;
          extends Abstraction.AdaptableVessels;
          annotation (Icon(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}})));

        end AdaptableArteries;

        model AdaptableVeins
          extends Cardiovascular.Icons.Vessels;
          extends Abstraction.AdaptableVessels;
          annotation (Icon(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}})));

        end AdaptableVeins;

        model CoronaryVessels "Flow port for coronary vessels"
          extends Cardiovascular.Icons.Vessels;
          extends Auxiliary.BlockKinds.Port;
          import Cardiovascular.Model.Complex.Components.Auxiliary.RLC.Elements.*;
          import Physiolibrary.Types.Volume;

          input Real pM "Intramyocardial pressure";

          Volume V=Ca.V + Cm.V + Cv.V "Current volume";

          R Rv(R=200000000) annotation (Placement(transformation(extent={{
                    38,-10},{58,10}})));
          R Rm2(R=900000000) annotation (Placement(transformation(extent={{
                    6,-10},{26,10}})));
          R Rm1(R=900000000) annotation (Placement(transformation(extent={{
                    -26,-10},{-6,10}})));
          R Ra(R=700000000) annotation (Placement(transformation(extent={{-58,
                    -10},{-38,10}})));
          C Ca(V_init=6e-06, C(displayUnit="m3/Pa") = 3e-11) annotation (
              Placement(transformation(extent={{-40,-40},{-20,-20}})));
          C Cv(V_init=10e-6, C=7e-10) annotation (Placement(transformation(
                  extent={{20,-40},{40,-20}})));
          C Cm(
            V_init=7e-6,
            pGround=pM,
            C=1.4e-09) annotation (Placement(transformation(extent={{-10,-40},
                    {10,-20}})));

        equation
          connect(cIn, Ra.cIn) annotation (Line(points={{-80,0},{-56,0}},
                smooth=Smooth.None));
          connect(Ra.cOut, Rm1.cIn) annotation (Line(points={{-40,0},{-24,0}},
                smooth=Smooth.None));
          connect(Rm1.cOut, Rm2.cIn)
            annotation (Line(points={{-8,0},{8,0}}, smooth=Smooth.None));
          connect(Rm2.cOut, Rv.cIn)
            annotation (Line(points={{24,0},{40,0}}, smooth=Smooth.None));
          connect(cOut, Rv.cOut)
            annotation (Line(points={{80,0},{56,0}}, smooth=Smooth.None));
          connect(Rm1.cIn, Ca.c) annotation (Line(points={{-24,0},{-32,0},{
                  -32,-25},{-30,-25}}, smooth=Smooth.None));
          connect(Rm2.cOut, Cv.c) annotation (Line(points={{24,0},{24,-25},
                  {30,-25}}, smooth=Smooth.None));
          connect(Rm1.cOut, Cm.c) annotation (Line(points={{-8,0},{-8,-25},
                  {0,-25}}, smooth=Smooth.None));

          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics));
        end CoronaryVessels;

        model ConsumingCapillaries
          "Capillaries visualized as consuming oxygen"
          extends Physiolibrary.Icons.PerfusionOD;
          extends Abstraction.Capillaries;

        end ConsumingCapillaries;

        model OxygenatingCapillaries
          "Capillaries visualized as blood oxygenating"
          extends Physiolibrary.Icons.PerfusionDO;
          extends Abstraction.Capillaries;

        end OxygenatingCapillaries;
      end Vessels;

      package SystemicArteries "Various realizations of systemic arteries"
        package Abstraction "Common ancestors"
          partial model SystemicArteries
            "Common ancestor for all types of systemic arteries"
            extends Vessels.Abstraction.Vessels;
            import Cardiovascular.Model.Complex.Components.Auxiliary.Connectors.*;

            parameter Boolean isAdaptable
              "Whether the model supports adaptation";

            In cCannula "Location for connecting ECMO cannula" annotation (
                Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=60,
                  origin={-60,-12})));

            annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                    extent={{-100,-100},{100,100}}), graphics));
          end SystemicArteries;

          partial model SystemicArteries_Adapter
            "Adapter for non-adaptable versions of systemic arteries"
            extends Cardiovascular.Icons.Arteries;
            extends SystemicArteries(isAdaptable=false);
            import Cardiovascular.Types.*;
            import Physiolibrary.Types.*;

            // DISABLING THE ADAPTATION
          //   inner parameter Real k = 10
          //     "Fake stifnesss non-linearity parameter";
          //   inner parameter Cardiovascular.Types.Length l=1
          //     "Fake total arterial length";
          //   inner parameter Cardiovascular.Types.Area AW_init=1
          //     "Fake starting value of wall cross-sectional area";
          //   inner parameter Cardiovascular.Types.Area ARef_init=1
          //     "Fake starting value of reference inner cross-sectional area";
          //   inner parameter Pressure pRef_init = 1
          //     "Fake starting value of reference pressure";
          //
          //   Vessels.AdaptableVesselsCore core "Fake compliance core";

          end SystemicArteries_Adapter;
        end Abstraction;

        model Original_CircAdapt
          "Original systemic arteries from CircAdapt by Arts et al. (2004 - 2013)"
          extends Abstraction.SystemicArteries(isAdaptable=true);
          extends Vessels.AdaptableArteries(
            pRef_init=settings.initialization.SA_pRef,
            ARef_init=settings.initialization.SA_ARef,
            AW_init=settings.initialization.SA_AW,
            l=settings.initialization.SA_l,
            k=settings.initialization.SA_k);
          import Cardiovascular.Model.Complex.Environment.*;
          import Physiolibrary.Types.*;

          outer Environment.ComplexEnvironment settings
            "Everything is out there";

          Volume V_filling(start=0);

            Real q_filling;

          parameter Fraction speed_factor=10;

          parameter Volume V_init=300e-6;

          Physiolibrary.Hydraulic.Sources.UnlimitedPump volumeControl_(
              useSolutionFlowInput=true);

        equation
          der(V_filling) = q_filling;
          q_filling/speed_factor = V_init - V_filling;
          // - der(V_filling);
            volumeControl_.solutionFlow = q_filling;
          connect(volumeControl_.q_out, cIn);
          // Homely component -> disabling vizualization, even for connection

          connect(cCannula, cIn) annotation (Line(
              points={{-60,-12},{-40,-12},{-40,0},{-80,0}},
              color={0,0,255},
              smooth=Smooth.None));

          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics), Icon(
                coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                    {100,100}}), graphics={Text(
                  extent={{-52,52},{28,16}},
                  lineColor={0,128,0},
                  lineThickness=1,
                  fillColor={255,0,0},
                  fillPattern=FillPattern.Solid,
                  textStyle={TextStyle.Bold},
                  textString="Original (Arts)")}));
        end Original_CircAdapt;

        model Windkessel_Physiolibrary
          "Windkessel model of systemic arteries from Physiolibrary v2.3.1-alpha by Marek Matejak (2015)"
          extends Abstraction.SystemicArteries_Adapter;

          extends Auxiliary.RLC.Compounds.LpRCR(
            C=1.0500862061839e-08,
            L(displayUnit="mmHg.s2/ml") = 666611.937075,
            R(displayUnit="(mmHg.s)/ml") = 123456530.74629,
            Rp(displayUnit="(mmHg.s)/ml") = 666611.937075);
          import Physiolibrary.Types.*;
          Volume V_filling(start=0);

            Real q_filling;

          parameter Fraction speed_factor=10;

          parameter Volume V_init=300e-6;

          Physiolibrary.Hydraulic.Sources.UnlimitedPump volumeControl_(
              useSolutionFlowInput=true);

        equation
          der(V_filling) = q_filling;
          q_filling/speed_factor = V_init - V_filling;
          // - der(V_filling);
            volumeControl_.solutionFlow = q_filling;
          connect(volumeControl_.q_out, cIn);
          // Homely component -> disabling vizualization, even for connection

          pInner = capacitor.c.pressure;

          connect(cIn, cCannula) annotation (Line(
              points={{-80,0},{-40,0},{-40,-12},{-60,-12}},
              color={0,0,255},
              smooth=Smooth.None));

          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics), Icon(graphics=
                 {Text(       extent={{-70,64},{52,4}},
                  lineColor={0,128,0},
                  lineThickness=1,
                  fillColor={255,0,0},
                  fillPattern=FillPattern.Solid,
                  textStyle={TextStyle.Bold},
                  textString="Windkessel (Physiolibrary)")}));
        end Windkessel_Physiolibrary;

        model Windkessel_Stergiopulos
          "Windkessel model of systemic arteries by Stergiopulos et al. (1999)"
          extends
            Model.Complex.Components.Main.SystemicArteries.Abstraction.SystemicArteries_Adapter;
          extends Model.Complex.Components.Auxiliary.RLC.Compounds.LpRCR(
            C=1.0275843589085e-08,
            L(displayUnit="mmHg.s2/ml") = 933256.711905,
            R(displayUnit="(mmHg.s)/ml") = 139988506.78575,
            Rp(displayUnit="(mmHg.s)/ml") = 7599376.082655);

        equation
          pInner = capacitor.c.pressure;

          connect(cIn, cCannula) annotation (Line(
              points={{-80,0},{-40,0},{-40,-12},{-60,-12}},
              color={0,0,255},
              smooth=Smooth.None));

          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics), Icon(graphics=
                 {Text(       extent={{-68,64},{46,8}},
                  lineColor={0,128,0},
                  lineThickness=1,
                  fillColor={255,0,0},
                  fillPattern=FillPattern.Solid,
                  textStyle={TextStyle.Bold},
                  textString="Windkessel (Stergiopulos)")}));
        end Windkessel_Stergiopulos;

        model Aorta_Ferrari "Model of aorta by Ferrari et al. (2005)"
          extends SystemicArteries.Abstraction.SystemicArteries_Adapter;
          import
            Cardiovascular.Model.Complex.Components.Auxiliary.RLC.Compounds.*;
          import Cardiovascular.Model.Complex.Components.Auxiliary.RLC.Elements.*;
          import Cardiovascular.Model.Complex.Components.Auxiliary.RLC.Tubes.*;
          import Cardiovascular.Types.*;
          import Physiolibrary.Types.Volume;

          outer Cardiovascular.Model.Complex.Environment.ComplexEnvironment settings
            "Everything is out there...";

          Volume V=ascendingAorta.V + aorticArch1.V + aorticArch2.V +
              thoracicAorta1.V + thoracicAorta2.V + thoracicAorta3.V +
              abdominalAorta1.V + abdominalAorta2.V + arms.V + leftBrain.V
               + rightBrain.V + hepaticCirculation.V + rightKidney.V +
              leftKidneyAndUpperMesenteric.V + legsAndLowerMesenteric.V
            "Current volume";

          TubeRLC_Ferrari ascendingAorta(
            l=0.04,
            r=0.01455,
            h=0.00163) annotation (Placement(transformation(extent={{-70,36},
                    {-50,56}})));
          TubeRLC_Ferrari aorticArch1(
            l=0.02,
            r=0.0112,
            h=0.00132) annotation (Placement(transformation(extent={{-44,56},
                    {-24,76}})));
          TubeRLC_Ferrari aorticArch2(
            l=0.039,
            r=0.0107,
            h=0.00127)
            annotation (Placement(transformation(extent={{4,52},{24,72}})));
          TubeRLC_Ferrari thoracicAorta1(
            l=0.052,
            r=0.00999,
            h=0.0012) annotation (Placement(transformation(extent={{14,24},
                    {34,44}})));
          TubeRLC_Ferrari thoracicAorta2(
            l=0.052,
            r=0.006675,
            h=0.0009) annotation (Placement(transformation(extent={{22,-8},
                    {42,12}})));
          TubeRLC_Ferrari thoracicAorta3(
            l=0.052,
            r=0.006525,
            h=0.00087) annotation (Placement(transformation(extent={{30,-36},
                    {50,-16}})));
          TubeRLC_Ferrari abdominalAorta1(
            l=0.053,
            r=0.0061,
            h=0.00084) annotation (Placement(transformation(extent={{38,-64},
                    {58,-44}})));
          TubeRLC_Ferrari abdominalAorta2(
            l=0.106,
            r=0.00564,
            h=0.0008) annotation (Placement(transformation(extent={{44,-88},
                    {64,-68}})));
          RRcC arms(
            R=18200e5/4,
            Rc=770e5/4,
            C=9.685e-10) annotation (Placement(transformation(extent={{-28,
                    88},{-8,108}})));
          RRcC leftBrain(
            R=72000e5/4,
            Rc=1000e5/4,
            C=5.188e-10) annotation (Placement(transformation(extent={{-6,
                    78},{14,98}})));
          RRcC rightBrain(
            R=10600e5/4,
            Rc=380e5/4,
            C=1.3089e-10) annotation (Placement(transformation(extent={{16,
                    74},{36,94}})));
          R intercostal1(R=190000e5/4) annotation (Placement(transformation(
                  extent={{30,44},{50,64}})));
          R intercostal2(R=190000e5/4) annotation (Placement(transformation(
                  extent={{42,24},{62,44}})));
          R intercostal3(R=190000e5/4)
            annotation (Placement(transformation(extent={{46,2},{66,22}})));
          R intercostal4(R=190000e5/4) annotation (Placement(transformation(
                  extent={{48,-22},{68,-2}})));
          RC hepaticCirculation(R=11000e5/4, C=1.79e-10) annotation (
              Placement(transformation(extent={{56,-44},{76,-24}})));
          RC rightKidney(R=11000e5/4, C=3.29e-11) annotation (Placement(
                transformation(extent={{64,-68},{84,-48}})));
          RC leftKidneyAndUpperMesenteric(R=5200e5/4, C=2.11e-10)
            annotation (Placement(transformation(extent={{74,-90},{94,-70}})));
          RRcC legsAndLowerMesenteric(
            R=7780e5/4,
            Rc=415e5/4,
            C=1.25e-11) annotation (Placement(transformation(extent={{68,-112},
                    {88,-92}})));

        equation
          pInner = aorticArch2.cIn.pressure;

          if settings.supports.ECMO_isEnabled then
            if settings.supports.ECMO_cannulaPlacement == CannulaPlacement.ascendingAorta then
              connect(cCannula, ascendingAorta.cIn);
            elseif settings.supports.ECMO_cannulaPlacement ==
                CannulaPlacement.aorticArch1 then
              connect(cCannula, aorticArch1.cIn);
            elseif settings.supports.ECMO_cannulaPlacement ==
                CannulaPlacement.aorticArch2 then
              connect(cCannula, aorticArch2.cIn);
            elseif settings.supports.ECMO_cannulaPlacement ==
                CannulaPlacement.thoracicAorta1 then
              connect(cCannula, thoracicAorta1.cIn);
            elseif settings.supports.ECMO_cannulaPlacement ==
                CannulaPlacement.thoracicAorta2 then
              connect(cCannula, thoracicAorta2.cIn);
            else
              connect(cCannula, cIn);
            end if;
          else
            connect(cCannula, cIn);
          end if;

          connect(cIn, ascendingAorta.cIn) annotation (Line(
              points={{-80,0},{-74,0},{-74,46},{-68,46}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(ascendingAorta.cOut, aorticArch1.cIn) annotation (Line(
              points={{-52,46},{-48,46},{-48,66},{-42,66}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(aorticArch1.cOut, aorticArch2.cIn) annotation (Line(
              points={{-26,66},{-4,66},{-4,62},{6,62}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(aorticArch2.cOut, thoracicAorta1.cIn) annotation (Line(
              points={{22,62},{20,62},{20,34},{16,34}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(thoracicAorta1.cOut, thoracicAorta2.cIn) annotation (Line(
              points={{32,34},{28,34},{28,2},{24,2}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(thoracicAorta2.cOut, thoracicAorta3.cIn) annotation (Line(
              points={{40,2},{36,2},{36,-26},{32,-26}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(thoracicAorta3.cOut, abdominalAorta1.cIn) annotation (
              Line(
              points={{48,-26},{44,-26},{44,-54},{40,-54}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(abdominalAorta1.cOut, abdominalAorta2.cIn) annotation (
              Line(
              points={{56,-54},{52,-54},{52,-78},{46,-78}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(intercostal1.cIn, aorticArch2.cIn) annotation (Line(
              points={{32,54},{20,54},{20,62},{6,62}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(thoracicAorta1.cIn, intercostal2.cIn) annotation (Line(
              points={{16,34},{44,34}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(thoracicAorta2.cIn, intercostal3.cIn) annotation (Line(
              points={{24,2},{36,2},{36,12},{48,12}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(intercostal4.cIn, thoracicAorta3.cIn) annotation (Line(
              points={{50,-12},{42,-12},{42,-26},{32,-26}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(aorticArch1.cOut, arms.cIn) annotation (Line(
              points={{-26,66},{-18,66},{-18,98},{-26,98}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(aorticArch1.cOut, leftBrain.cIn) annotation (Line(
              points={{-26,66},{-14,66},{-14,88},{-4,88}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(aorticArch1.cOut, rightBrain.cIn) annotation (Line(
              points={{-26,66},{-10,66},{-10,84},{18,84}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(abdominalAorta1.cIn, hepaticCirculation.cIn) annotation (
              Line(
              points={{40,-54},{48,-54},{48,-34},{58,-34}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(abdominalAorta2.cIn, rightKidney.cIn) annotation (Line(
              points={{46,-78},{56,-78},{56,-58},{66,-58}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(abdominalAorta2.cIn, leftKidneyAndUpperMesenteric.cIn)
            annotation (Line(
              points={{46,-78},{60,-78},{60,-80},{76,-80}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(abdominalAorta2.cOut, legsAndLowerMesenteric.cIn)
            annotation (Line(
              points={{62,-78},{66,-78},{66,-102},{70,-102}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(cOut, intercostal4.cOut) annotation (Line(
              points={{80,0},{74,0},{74,-12},{66,-12}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(hepaticCirculation.cOut, cOut) annotation (Line(
              points={{74,-34},{74,0},{80,0}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(rightKidney.cOut, cOut) annotation (Line(
              points={{82,-58},{82,0},{80,0}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(leftKidneyAndUpperMesenteric.cOut, cOut) annotation (Line(
              points={{92,-80},{86,-80},{86,0},{80,0}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(legsAndLowerMesenteric.cOut, cOut) annotation (Line(
              points={{86,-102},{80,-102},{80,0}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(intercostal3.cOut, cOut) annotation (Line(
              points={{64,12},{68,12},{68,0},{80,0}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(intercostal2.cOut, cOut) annotation (Line(
              points={{60,34},{68,34},{68,0},{80,0}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(intercostal1.cOut, cOut) annotation (Line(
              points={{48,54},{62,54},{62,0},{80,0}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(rightBrain.cOut, cOut) annotation (Line(
              points={{34,84},{50,84},{50,0},{80,0}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(leftBrain.cOut, cOut) annotation (Line(
              points={{12,88},{46,88},{46,0},{80,0}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(arms.cOut, cOut) annotation (Line(
              points={{-10,98},{42,98},{42,0},{80,0}},
              color={0,0,255},
              smooth=Smooth.None));

          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics), Icon(graphics=
                 {Text(       extent={{-56,56},{28,10}},
                  lineColor={0,128,0},
                  lineThickness=1,
                  fillColor={255,0,0},
                  fillPattern=FillPattern.Solid,
                  textStyle={TextStyle.Bold},
                  textString="Aorta (Ferrari)")}));
        end Aorta_Ferrari;

        model Tree_Abdolrazaghi
          "Model of systemic arterial tree by Abdolrazaghi et al. (2010)"
          extends Abstraction.SystemicArteries_Adapter;
          import
            Cardiovascular.Model.Complex.Components.Auxiliary.RLC.Compounds.*;
          import Cardiovascular.Types.*;
          import Physiolibrary.Types.Volume;

          outer Cardiovascular.Model.Complex.Environment.ComplexEnvironment settings
            "Everything is out there...";

          Volume V=ascendingAorta.V + aorticArch1.V + aorticArch2.V +
              thoracicAorta1.V + thoracicAorta2.V + abdominalAorta1.V +
              abdominalAorta2And3.V + abdominalAorta4.V + abdominalAorta5.V
               + hepatic.V + gastric.V + splenetic.V + leftRenal.V +
              rightRenal.V + rightCommonCarotid.V + rightInteriorCarotid.V
               + rightExteriorCarotid.V + leftCommonCarotid.V +
              leftInteriorCarotid.V + leftExteriorCarotid.V +
              leftSubclavian.V + rightSubclavian.V + leftCommonIlliac.V +
              leftExternalIlliac.V + leftFemoral.V + rightCommonIlliac.V +
              rightExternalIlliac.V + rightFemoral.V + superiorMesenteric.V
               + inferiorMesenteric.V + arterioles.V "Current volume";

          CRL arterioles(
            C=1.4001e-08,
            R=72000000,
            L=1000000) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=180,
                origin={-58,-80})));
          CLR rightFemoral(
            C=1.8126e-10,
            L=30545610,
            R=87740000) annotation (Placement(transformation(extent={{-16,-100},
                    {-36,-80}})));
          CLR leftFemoral(
            C=1.8126e-10,
            L=30545610,
            R=87740000) annotation (Placement(transformation(extent={{-16,-80},
                    {-36,-60}})));
          CLR rightExternalIlliac(
            C=1.0483e-10,
            L=6504400,
            R=12230000) annotation (Placement(transformation(extent={{2,-100},
                    {-18,-80}})));
          CLR leftExternalIlliac(
            C=1.0483e-10,
            L=6504400,
            R=12245000) annotation (Placement(transformation(extent={{2,-80},
                    {-18,-60}})));
          CRL rightCommonIlliac(
            C=5.6726e-11,
            R=2867000,
            L=1980970) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=180,
                origin={10,-90})));
          CRL leftCommonIlliac(
            C=5.6726e-11,
            R=2867000,
            L=1980970) annotation (Placement(transformation(
                extent={{-10,-10},{10,10}},
                rotation=180,
                origin={10,-70})));
          CLpRR abdominalAorta5(
            C=2.5472e-11,
            L=164820,
            R=121960,
            Rp=519650) annotation (Placement(transformation(extent={{44,-90},
                    {24,-70}})));
          CLpRR abdominalAorta4(
            C=3.2471e-10,
            L=1404350,
            R=835260,
            Rp=3558940) annotation (Placement(transformation(
                extent={{10,-10},{-10,10}},
                rotation=90,
                origin={90,-50})));
          CLpRR abdominalAorta2And3(
            C=6.3585e-11,
            L=247600,
            R=137610,
            Rp=586340) annotation (Placement(transformation(
                extent={{10,-10},{-10,10}},
                rotation=90,
                origin={90,-26})));
          CLpRR abdominalAorta1(
            C=1.5739e-10,
            L=634810,
            R=341340,
            Rp=1454400) annotation (Placement(transformation(
                extent={{10,-10},{-10,10}},
                rotation=90,
                origin={90,-2})));
          CRLpR ascendingAorta(
            C=9.1788e-10,
            R=7540,
            L=82500,
            Rp=32550) annotation (Placement(transformation(extent={{0,80},{
                    20,100}})));
          CLpRR thoracicAorta1(
            C=5.5664e-10,
            L=231750,
            R=46370,
            Rp=197570) annotation (Placement(transformation(extent={{58,80},
                    {78,100}})));
          CLpRR thoracicAorta2(
            C=3.7662e-10,
            L=1017300,
            R=446730,
            Rp=1903460) annotation (Placement(transformation(extent={{78,80},
                    {98,100}})));
          CLR inferiorMesenteric(
            C=5.6082e-12,
            L=9033880,
            R=1662000000) annotation (Placement(transformation(extent={{44,
                    -64},{24,-44}})));
          CRL superiorMesenteric(
            C=8.2877e-11,
            R=192000000,
            L=1442180) annotation (Placement(transformation(extent={{44,-44},
                    {24,-24}})));
          CRL leftRenal(
            C=1.2496e-11,
            R=126000000,
            L=2189510) annotation (Placement(transformation(extent={{68,-12},
                    {48,8}})));
          CRL rightRenal(
            C=1.2496e-11,
            R=126000000,
            L=2189510) annotation (Placement(transformation(extent={{68,-32},
                    {48,-12}})));
          CLpRR splenetic(
            C=2.857e-11,
            L=3853180,
            R=254000000,
            Rp=1117000000) annotation (Placement(transformation(extent={{80,
                    14},{60,34}})));
          CLpRR gastric(
            C=1.0835e-11,
            L=10135800,
            R=254000000,
            Rp=1117000000) annotation (Placement(transformation(extent={{80,
                    34},{60,54}})));
          CLpRR hepatic(
            C=1.688e-11,
            L=6033700,
            R=254000000,
            Rp=1117000000) annotation (Placement(transformation(extent={{80,
                    54},{60,74}})));
          CLR leftSubclavian(
            C=4.8542e-10,
            L=12018410,
            R=14118000) annotation (Placement(transformation(extent={{-16,-54},
                    {-36,-34}})));
          CLR leftCommonCarotid(
            C=1.9692e-10,
            L=7027560,
            R=9890000) annotation (Placement(transformation(extent={{-10,-30},
                    {-30,-10}})));
          CRL leftInteriorCarotid(
            C=2.5538e-11,
            R=159800000,
            L=25984280) annotation (Placement(transformation(extent={{-32,-40},
                    {-52,-20}})));
          CLR leftExteriorCarotid(
            C=2.7517e-11,
            L=26131920,
            R=160720000) annotation (Placement(transformation(extent={{-32,
                    -20},{-52,0}})));
          CLR rightSubclavian(
            C=4.8904e-10,
            L=11958990,
            R=5349000) annotation (Placement(transformation(extent={{-14,4},
                    {-34,24}})));
          CLR rightCommonCarotid(
            C=1.6757e-10,
            L=5980180,
            R=3153000) annotation (Placement(transformation(extent={{-6,30},
                    {-26,50}})));
          CLR rightExteriorCarotid(
            C=2.7517e-11,
            L=26131920,
            R=160800000) annotation (Placement(transformation(extent={{-26,
                    20},{-46,40}})));
          CLR rightInteriorCarotid(
            C=2.5538e-11,
            L=25984280,
            R=159800000) annotation (Placement(transformation(extent={{-26,
                    38},{-46,58}})));
          CLpRR aorticArch2(
            C=4.8919e-10,
            L=151820,
            R=26530,
            Rp=113050) annotation (Placement(transformation(extent={{40,80},
                    {60,100}})));
          CRLpR aorticArch1(
            C=2.6259e-10,
            R=11330,
            L=71060,
            Rp=48290) annotation (Placement(transformation(extent={{20,80},
                    {40,100}})));

        equation
          pInner = aorticArch2.cIn.pressure;

          if settings.supports.ECMO_isEnabled then
            if settings.supports.ECMO_cannulaPlacement == CannulaPlacement.ascendingAorta then
              connect(cCannula, ascendingAorta.cIn);
            elseif settings.supports.ECMO_cannulaPlacement ==
                CannulaPlacement.aorticArch1 then
              connect(cCannula, aorticArch1.cIn);
            elseif settings.supports.ECMO_cannulaPlacement ==
                CannulaPlacement.aorticArch2 then
              connect(cCannula, aorticArch2.cIn);
            elseif settings.supports.ECMO_cannulaPlacement ==
                CannulaPlacement.thoracicAorta1 then
              connect(cCannula, thoracicAorta1.cIn);
            elseif settings.supports.ECMO_cannulaPlacement ==
                CannulaPlacement.thoracicAorta2 then
              connect(cCannula, thoracicAorta2.cIn);
            else
              connect(cCannula, cIn);
            end if;
          else
            connect(cCannula, cIn);
          end if;

          connect(arterioles.cIn, rightFemoral.cOut) annotation (Line(
              points={{-50,-80},{-42,-80},{-42,-90},{-34,-90}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(arterioles.cIn, leftFemoral.cOut) annotation (Line(
              points={{-50,-80},{-42,-80},{-42,-70},{-34,-70}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(rightFemoral.cIn, rightExternalIlliac.cOut) annotation (
              Line(
              points={{-18,-90},{-16,-90}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(leftFemoral.cIn, leftExternalIlliac.cOut) annotation (
              Line(
              points={{-18,-70},{-16,-70}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(rightExternalIlliac.cIn, rightCommonIlliac.cOut)
            annotation (Line(
              points={{0,-90},{2,-90}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(leftExternalIlliac.cIn, leftCommonIlliac.cOut)
            annotation (Line(
              points={{0,-70},{2,-70}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(leftCommonIlliac.cIn, abdominalAorta5.cOut) annotation (
              Line(
              points={{18,-70},{22,-70},{22,-80},{26,-80}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(rightCommonIlliac.cIn, abdominalAorta5.cOut) annotation (
              Line(
              points={{18,-90},{22,-90},{22,-80},{26,-80}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(abdominalAorta5.cIn, abdominalAorta4.cOut) annotation (
              Line(
              points={{42,-80},{66,-80},{66,-58},{90,-58}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(abdominalAorta4.cIn, abdominalAorta2And3.cOut)
            annotation (Line(
              points={{90,-42},{90,-34}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(abdominalAorta2And3.cIn, abdominalAorta1.cOut)
            annotation (Line(
              points={{90,-18},{90,-10}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(thoracicAorta1.cOut, thoracicAorta2.cIn) annotation (Line(
              points={{76,90},{80,90}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(thoracicAorta2.cOut, abdominalAorta1.cIn) annotation (
              Line(
              points={{96,90},{94,90},{94,6},{90,6}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(abdominalAorta4.cOut, inferiorMesenteric.cIn) annotation (
             Line(
              points={{90,-58},{66,-58},{66,-54},{42,-54}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(abdominalAorta2And3.cOut, superiorMesenteric.cIn)
            annotation (Line(
              points={{90,-34},{42,-34}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(abdominalAorta1.cOut, leftRenal.cIn) annotation (Line(
              points={{90,-10},{78,-10},{78,-2},{66,-2}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(abdominalAorta1.cOut, rightRenal.cIn) annotation (Line(
              points={{90,-10},{78,-10},{78,-22},{66,-22}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(arterioles.cIn, inferiorMesenteric.cOut) annotation (Line(
              points={{-50,-80},{-12,-80},{-12,-54},{26,-54}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(arterioles.cIn, superiorMesenteric.cOut) annotation (Line(
              points={{-50,-80},{-12,-80},{-12,-34},{26,-34}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(arterioles.cIn, rightRenal.cOut) annotation (Line(
              points={{-50,-80},{0,-80},{0,-22},{50,-22}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(arterioles.cIn, leftRenal.cOut) annotation (Line(
              points={{-50,-80},{0,-80},{0,-2},{50,-2}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(thoracicAorta2.cOut, hepatic.cIn) annotation (Line(
              points={{96,90},{88,90},{88,64},{78,64}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(thoracicAorta2.cOut, gastric.cIn) annotation (Line(
              points={{96,90},{88,90},{88,44},{78,44}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(thoracicAorta2.cOut, splenetic.cIn) annotation (Line(
              points={{96,90},{88,90},{88,24},{78,24}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(arterioles.cIn, splenetic.cOut) annotation (Line(
              points={{-50,-80},{8,-80},{8,24},{62,24}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(arterioles.cIn, gastric.cOut) annotation (Line(
              points={{-50,-80},{6,-80},{6,44},{62,44}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(arterioles.cIn, hepatic.cOut) annotation (Line(
              points={{-50,-80},{6,-80},{6,64},{62,64}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(leftCommonCarotid.cOut, leftInteriorCarotid.cIn)
            annotation (Line(
              points={{-28,-20},{-30,-20},{-30,-30},{-34,-30}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(leftCommonCarotid.cOut, leftExteriorCarotid.cIn)
            annotation (Line(
              points={{-28,-20},{-32,-20},{-32,-10},{-34,-10}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(arterioles.cIn, leftSubclavian.cOut) annotation (Line(
              points={{-50,-80},{-42,-80},{-42,-44},{-34,-44}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(arterioles.cIn, leftInteriorCarotid.cOut) annotation (
              Line(
              points={{-50,-80},{-50,-30}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(arterioles.cIn, leftExteriorCarotid.cOut) annotation (
              Line(
              points={{-50,-80},{-50,-10}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(rightCommonCarotid.cOut, rightExteriorCarotid.cIn)
            annotation (Line(
              points={{-24,40},{-26,40},{-26,30},{-28,30}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(rightCommonCarotid.cOut, rightInteriorCarotid.cIn)
            annotation (Line(
              points={{-24,40},{-26,40},{-26,48},{-28,48}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(arterioles.cIn, rightSubclavian.cOut) annotation (Line(
              points={{-50,-80},{-42,-80},{-42,14},{-32,14}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(arterioles.cIn, rightExteriorCarotid.cOut) annotation (
              Line(
              points={{-50,-80},{-48,-80},{-48,30},{-44,30}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(arterioles.cIn, rightInteriorCarotid.cOut) annotation (
              Line(
              points={{-50,-80},{-48,-80},{-48,48},{-44,48}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(thoracicAorta1.cIn, aorticArch2.cOut) annotation (Line(
              points={{60,90},{58,90}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(arterioles.cOut, cOut) annotation (Line(
              points={{-66,-80},{6,-80},{6,0},{80,0}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(ascendingAorta.cIn, cIn) annotation (Line(
              points={{2,90},{-30,90},{-30,0},{-80,0}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(ascendingAorta.cOut, aorticArch1.cIn) annotation (Line(
              points={{18,90},{22,90}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(aorticArch2.cIn, aorticArch1.cOut) annotation (Line(
              points={{42,90},{38,90}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(aorticArch1.cOut, leftCommonCarotid.cIn) annotation (Line(
              points={{38,90},{14,90},{14,-20},{-12,-20}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(aorticArch1.cOut, leftSubclavian.cIn) annotation (Line(
              points={{38,90},{10,90},{10,-44},{-18,-44}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(ascendingAorta.cOut, rightSubclavian.cIn) annotation (
              Line(
              points={{18,90},{2,90},{2,14},{-16,14}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(ascendingAorta.cOut, rightCommonCarotid.cIn) annotation (
              Line(
              points={{18,90},{6,90},{6,40},{-8,40}},
              color={0,0,255},
              smooth=Smooth.None));

          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics), Icon(graphics=
                 {Text(       extent={{-60,50},{36,12}},
                  lineColor={0,128,0},
                  lineThickness=1,
                  fillColor={255,0,0},
                  fillPattern=FillPattern.Solid,
                  textStyle={TextStyle.Bold},
                  textString="Tree (Abdolrazaghi)")}));
        end Tree_Abdolrazaghi;

        model ComplexTree_Derived "Derived arterial tree"
          extends SystemicArteries.Abstraction.SystemicArteries_Adapter;
          import Cardiovascular.Model.Complex.Components.Auxiliary.RLC.Tubes.*;
          import Cardiovascular.Types.*;
          import Physiolibrary.Types.*;

          outer Cardiovascular.Model.Complex.Environment.ComplexEnvironment settings
            "Everything is out there...";

          inner parameter Fraction arterialStiffnessScale=settings.condition.
              _DT_arterialStiffnessScale
            "Scaling coefficient for arterial stiffness";
          inner parameter Cardiovascular.Types.Length cannulaOuterDiameter=settings.supports.
              _DT_ECMO_cannulaOuterDiameter "Outer diameter of ECMO cannula";
          inner parameter Cardiovascular.Types.Length cannulaDepth=settings.supports.
              _DT_ECMO_cannulaDepth "Insertion depth of ECMO cannula";
          inner parameter Boolean enableIABP=settings.supports.
              _DT_IABP_isEnabled "Whether IABP is implanted";
          inner parameter Time tDeflation=settings.supports.
              _DT_IABP_deflationTime
            "Time of IABP deflation with respect to start of the cardiac cycle";
          inner parameter Time tInflation=settings.supports.
              _DT_IABP_inflationTime
            "Time of IABP inflation with respect to start of the cardiac cycle";

          inner Time cycleDuration=settings.condition.cycleDuration
            "Duration of cardiac cycle";

          parameter Fraction aorticArchStenosisRatio=settings.condition.
              _DT_aorticArchStenosisRatio
            "Ratio of stenotic narrowing in aortic arch segments";
          parameter Cardiovascular.Types.CannulaPlacement cannulaPlacement=settings.supports.ECMO_cannulaPlacement
            "Location of inserted ECMO cannula";
          parameter Boolean enableECMO=settings.supports.ECMO_isEnabled
            "Whether ECMO is connected";

          Volume V=ascendingAorta.V + aorticArch1.V + leftSubclavian1.V +
              leftCommonCarotid1.V + aorticArch2.V + brachiocephalic.V +
              leftInternalMammary.V + leftSubclavian2.V + leftVertebral.V
               + leftCommonCarotid2.V + thoracicAorta1.V +
              rightCommonCarotid1.V + rightVertebral.V + rightSubclavian.V
               + righInternalMammary.V + leftCostocervical.V +
              leftAxilliary1.V + leftSuprascapular.V + leftThyrocervical.V
               + leftCommonCarotid3.V + thoracicAorta2.V +
              rightCommonCarotid2.V + rightThyrocervical.V +
              rightSuprascapular.V + rightAxilliary1.V + rightCostocervical.V
               + leftThoracoacrominal.V + leftAxilliary2.V +
              leftCircumflexScapular.V + leftSubscapular.V +
              leftInternalCarotid1.V + leftExternalCarotid.V +
              leftSuperiorThyroid.V + thoracicAorta3.V +
              rightSuperiorThyroid.V + rightExternalCarotid.V +
              rightInternalCarotid1.V + rightSubscapular.V +
              rightCircumflexScapular.V + rightAxilliary2.V +
              rightThoracoacrominal.V + leftBrachial1.V + leftLingual.V +
              leftInternalCarotid2.V + leftFacial.V + leftMiddleCerebral.V
               + leftCerebral.V + leftOpthalmic.V + coeliac.V +
              abdominalAorta1.V + rightOpthalmic.V + rightCerebral.V +
              rightMiddleCerebral.V + rightFacial.V + rightInternalCarotid2.V
               + rightLingual.V + rightBrachial1.V + leftProfundaBrachi.V
               + leftBrachial2.V + leftInternalCarotid3.V + gastric1.V +
              splenic.V + hepatic.V + renal.V + abdominalAorta2.V +
              superiorMesenteric.V + gastric2.V + rightInternalCarotid3.V
               + rightBrachial2.V + rightProfundaBrachi.V + leftBrachial3.V
               + leftSuperiorUlnarCollateral.V + leftSuperficialTemporal.V
               + leftMaxilliary.V + abdominalAorta3.V + rightMaxilliary.V
               + rightSuperficialTemporal.V + rightSuperiorUlnarCollateral.V
               + rightBrachial3.V + leftInferiorUlnarCollateral.V +
              leftBrachial4.V + leftCommonIlliac.V + inferiorMesenteric.V
               + rightCommonIlliac.V + rightBrachial4.V +
              rightInferiorUlnarCollateral.V + leftUlnar1.V + leftRadial1.V
               + leftExternalIlliac1.V + leftInternalIlliac.V +
              rightInternalIlliac.V + rightExternalIlliac1.V + rightRadial1.V
               + rightUlnar1.V + leftUlnar2.V + leftInterossea.V +
              leftRadial2.V + leftExternalIlliac2.V + rightExternalIlliac2.V
               + rightRadial2.V + rightInterossea.V + rightUlnar2.V +
              leftUlnar3.V + leftFemoral1.V + leftProfundis.V +
              rightProfundis.V + rightFemoral1.V + rightUlnar3.V +
              leftFemoral2.V + rightFemoral2.V + leftPopliteal1.V +
              rightPopliteal1.V + leftPopliteal2.V + rightPopliteal2.V +
              leftAnteriorTibial1.V + leftPosteriorTibial1.V +
              rightPosteriorTibial1.V + rightAnteriorTibial1.V +
              leftAnteriorTibial2.V + leftPeroneal1.V +
              leftPosteriorTibial2.V + rightPosteriorTibial2.V +
              rightPeroneal1.V + rightAnteriorTibial2.V +
              leftAnteriorTibial3.V + leftPeroneal2.V + rightPeroneal2.V +
              rightAnteriorTibial3.V "Current volume";

          Volume V_filling(start=0);

            Real q_filling;

          parameter Fraction speed_factor=5;

          parameter Volume V_init=270e-6;

          Physiolibrary.Hydraulic.Sources.UnlimitedPump volumeControl_(
              useSolutionFlowInput=true);

          TubeRLC_Derived ascendingAorta(
            isCannulated=enableECMO and cannulaPlacement ==
                CannulaPlacement.ascendingAorta,
            l=0.04,
            r=0.0145,
            h=0.00163,
            E=4e5) annotation (Placement(transformation(extent={{-64,52},{-68,
                    56}})));

          TubeRLC_Derived aorticArch1(
            isCannulated=enableECMO and cannulaPlacement ==
                CannulaPlacement.aorticArch1,
            l=2e-2,
            r=1.12e-2*(1 - aorticArchStenosisRatio),
            h=0.132e-2 + 1.12e-2*aorticArchStenosisRatio,
            E=4e5) annotation (Placement(transformation(extent={{-62,54},{-66,
                    58}})));

          TubeRLC_Derived leftSubclavian1(
            isBranching=true,
            l=3.4e-2,
            r=0.42e-2,
            h=0.067e-2,
            E=4e5) annotation (Placement(transformation(extent={{-52,60},{-56,
                    64}})));

          TubeRLC_Derived leftCommonCarotid1(
            isBranching=true,
            l=8.9e-2,
            r=0.37e-2,
            h=0.063e-2,
            E=4e5) annotation (Placement(transformation(extent={{-52,66},{-48,
                    70}})));

          TubeRLC_Derived aorticArch2(
            isCannulated=enableECMO and cannulaPlacement ==
                CannulaPlacement.aorticArch2,
            isBranching=true,
            l=3.9e-2,
            r=1.07e-2*(1 - aorticArchStenosisRatio),
            h=0.127e-2 + 1.07e-2*aorticArchStenosisRatio,
            E=4e5) annotation (Placement(transformation(
                extent={{-2,-2},{2,2}},
                rotation=90,
                origin={-58,56})));

          TubeRLC_Derived brachiocephalic(
            isBranching=true,
            l=3.4e-2,
            r=0.62e-2,
            h=0.086e-2,
            E=4e5) annotation (Placement(transformation(extent={{-64,60},{-60,
                    64}})));

          TubeRLC_Derived leftInternalMammary(
            l=15e-2,
            isBranching=true,
            r=0.1e-2,
            h=0.03e-2,
            E=8e5) annotation (Placement(transformation(extent={{-48,58},{-44,
                    62}})));
          TubeRLC_Derived leftSubclavian2(
            isBranching=true,
            l=6.8e-2,
            r=0.4e-2,
            h=0.066e-2,
            E=4e5) annotation (Placement(transformation(extent={{-42,62},{-46,
                    66}})));

          TubeRLC_Derived leftVertebral(
            l=14.8e-2,
            isBranching=true,
            r=0.19e-2,
            h=0.045e-2,
            E=8e5) annotation (Placement(transformation(extent={{-48,56},{-44,
                    60}})));
          TubeRLC_Derived leftCommonCarotid2(
            l=8.9e-2,
            r=0.37e-2,
            h=0.063e-2,
            E=4e5) annotation (Placement(transformation(extent={{-52,68},{-48,
                    72}})));

          TubeRLC_Derived_IABP thoracicAorta1(
            isCannulated=enableECMO and cannulaPlacement ==
                CannulaPlacement.thoracicAorta1,
            useIABP2=true,
            l=5.2e-2,
            r=1e-2,
            h=0.12e-2,
            E=4e5) annotation (Placement(transformation(extent={{-60,50},{-56,
                    54}})));

          TubeRLC_Derived rightCommonCarotid1(
            isBranching=true,
            l=8.9e-2,
            r=0.37e-2,
            h=0.063e-2,
            E=4e5) annotation (Placement(transformation(extent={{-68,68},{-64,
                    72}})));

          TubeRLC_Derived rightVertebral(
            l=14.8e-2,
            isBranching=true,
            r=0.19e-2,
            h=0.045e-2,
            E=8e5) annotation (Placement(transformation(extent={{-80,58},{-76,
                    62}})));
          TubeRLC_Derived rightSubclavian(
            isBranching=true,
            l=6.8e-2,
            r=0.4e-2,
            h=0.066e-2,
            E=4e5) annotation (Placement(transformation(extent={{-82,56},{-78,
                    60}})));

          TubeRLC_Derived righInternalMammary(
            l=15e-2,
            isBranching=true,
            r=0.1e-2,
            h=0.03e-2,
            E=8e5) annotation (Placement(transformation(extent={{-80,54},{-76,
                    58}})));
          TubeRLC_Derived leftCostocervical(
            l=5e-2,
            isBranching=true,
            r=0.1e-2,
            h=0.03e-2,
            E=8e5) annotation (Placement(transformation(extent={{-42,64},{-38,
                    68}})));
          TubeRLC_Derived leftAxilliary1(
            isBranching=true,
            l=6.1e-2,
            r=0.36e-2,
            h=0.062e-2,
            E=4e5) annotation (Placement(transformation(extent={{-32,62},{-36,
                    66}})));

          TubeRLC_Derived leftSuprascapular(
            l=10e-2,
            isBranching=true,
            r=0.2e-2,
            h=0.052e-2,
            E=8e5) annotation (Placement(transformation(extent={{-42,66},{-38,
                    70}})));
          TubeRLC_Derived leftThyrocervical(
            l=5e-2,
            isBranching=true,
            r=0.1e-2,
            h=0.03e-2,
            E=8e5) annotation (Placement(transformation(extent={{-42,68},{-38,
                    72}})));
          TubeRLC_Derived leftCommonCarotid3(
            l=3.1e-2,
            r=0.37e-2,
            h=0.063e-2,
            E=4e5) annotation (Placement(transformation(extent={{-52,70},{-48,
                    74}})));

          TubeRLC_Derived_IABP thoracicAorta2(
            isCannulated=enableECMO and cannulaPlacement ==
                CannulaPlacement.thoracicAorta2,
            l=5.2e-2,
            r=0.95e-2,
            h=0.116e-2,
            E=4e5) annotation (Placement(transformation(extent={{-60,48},{-56,
                    52}})));

          TubeRLC_Derived rightCommonCarotid2(
            l=8.9e-2,
            r=0.37e-2,
            h=0.063e-2,
            E=4e5) annotation (Placement(transformation(extent={{-68,70},{-64,
                    74}})));

          TubeRLC_Derived rightThyrocervical(
            l=5e-2,
            isBranching=true,
            r=0.1e-2,
            h=0.03e-2,
            E=8e5) annotation (Placement(transformation(extent={{-86,60},{-82,
                    64}})));
          TubeRLC_Derived rightSuprascapular(
            l=10e-2,
            isBranching=true,
            r=0.2e-2,
            h=0.052e-2,
            E=8e5) annotation (Placement(transformation(extent={{-86,62},{-82,
                    66}})));
          TubeRLC_Derived rightAxilliary1(
            isBranching=true,
            l=6.1e-2,
            r=0.36e-2,
            h=0.062e-2,
            E=4e5) annotation (Placement(transformation(extent={{-88,56},{-84,
                    60}})));

          TubeRLC_Derived rightCostocervical(
            l=5e-2,
            isBranching=true,
            r=0.1e-2,
            h=0.03e-2,
            E=8e5) annotation (Placement(transformation(extent={{-86,58},{-82,
                    62}})));
          TubeRLC_Derived leftThoracoacrominal(
            l=3e-2,
            isBranching=true,
            r=0.15e-2,
            h=0.035e-2,
            E=16e5) annotation (Placement(transformation(extent={{-38,58},{
                    -34,62}})));
          TubeRLC_Derived leftAxilliary2(
            isBranching=true,
            l=5.6e-2,
            r=0.31e-2,
            h=0.057e-2,
            E=4e5) annotation (Placement(transformation(extent={{-36,54},{-32,
                    58}})));

          TubeRLC_Derived leftCircumflexScapular(
            l=5e-2,
            isBranching=true,
            r=0.1e-2,
            h=0.03e-2,
            E=16e5) annotation (Placement(transformation(extent={{-38,56},{
                    -34,60}})));
          TubeRLC_Derived leftSubscapular(
            l=8e-2,
            isBranching=true,
            r=0.15e-2,
            h=0.035e-2,
            E=16e5) annotation (Placement(transformation(extent={{-38,60},{
                    -34,64}})));
          TubeRLC_Derived leftInternalCarotid1(
            isBranching=true,
            l=5.9e-2,
            r=0.18e-2,
            h=0.045e-2,
            E=8e5) annotation (Placement(transformation(extent={{-52,76},{-48,
                    80}})));

          TubeRLC_Derived leftExternalCarotid(
            isBranching=true,
            l=11.8e-2,
            r=0.15e-2,
            h=0.042e-2,
            E=8e5) annotation (Placement(transformation(extent={{-54,74},{-50,
                    78}})));

          TubeRLC_Derived leftSuperiorThyroid(
            l=4e-2,
            isBranching=true,
            r=0.07e-2,
            h=0.02e-2,
            E=8e5) annotation (Placement(transformation(extent={{-54,72},{-50,
                    76}})));
          TubeRLC_Derived_IABP thoracicAorta3(
            l=5.2e-2,
            r=0.95e-2,
            h=0.116e-2,
            E=4e5) annotation (Placement(transformation(
                extent={{-2,-2},{2,2}},
                rotation=90,
                origin={-58,46})));

          TubeRLC_Derived rightSuperiorThyroid(
            l=4e-2,
            isBranching=true,
            r=0.07e-2,
            h=0.02e-2,
            E=8e5) annotation (Placement(transformation(extent={{-70,72},{-66,
                    76}})));
          TubeRLC_Derived rightExternalCarotid(
            isBranching=true,
            l=11.8e-2,
            r=0.15e-2,
            h=0.042e-2,
            E=8e5) annotation (Placement(transformation(extent={{-70,74},{-66,
                    78}})));

          TubeRLC_Derived rightInternalCarotid1(
            isBranching=true,
            l=5.9e-2,
            r=0.18e-2,
            h=0.045e-2,
            E=8e5) annotation (Placement(transformation(extent={{-68,76},{-64,
                    80}})));

          TubeRLC_Derived rightSubscapular(
            l=8e-2,
            isBranching=true,
            r=0.15e-2,
            h=0.035e-2,
            E=16e5) annotation (Placement(transformation(extent={{-94,58},{
                    -90,62}})));
          TubeRLC_Derived rightCircumflexScapular(
            l=5e-2,
            isBranching=true,
            r=0.1e-2,
            h=0.03e-2,
            E=16e5) annotation (Placement(transformation(extent={{-94,56},{
                    -90,60}})));
          TubeRLC_Derived rightAxilliary2(
            isBranching=true,
            l=5.6e-2,
            r=0.31e-2,
            h=0.057e-2,
            E=4e5) annotation (Placement(transformation(extent={{-92,52},{-88,
                    56}})));

          TubeRLC_Derived rightThoracoacrominal(
            l=3e-2,
            isBranching=true,
            r=0.15e-2,
            h=0.035e-2,
            E=16e5) annotation (Placement(transformation(extent={{-94,54},{
                    -90,58}})));
          TubeRLC_Derived leftBrachial1(
            l=6.3e-2,
            r=0.28e-2,
            h=0.055e-2,
            E=4e5) annotation (Placement(transformation(extent={{-36,52},{-32,
                    56}})));

          TubeRLC_Derived leftLingual(
            l=3e-2,
            isBranching=true,
            r=0.1e-2,
            h=0.03e-2,
            E=8e5) annotation (Placement(transformation(extent={{-54,78},{-50,
                    82}})));
          TubeRLC_Derived leftInternalCarotid2(
            isBranching=true,
            l=5.9e-2,
            r=0.13e-2,
            h=0.039e-2,
            E=8e5) annotation (Placement(transformation(extent={{-52,82},{-48,
                    86}})));

          TubeRLC_Derived leftFacial(
            l=4e-2,
            isBranching=true,
            r=0.1e-2,
            h=0.03e-2,
            E=16e5) annotation (Placement(transformation(extent={{-54,80},{
                    -50,84}})));
          TubeRLC_Derived leftMiddleCerebral(
            l=3e-2,
            isBranching=true,
            r=0.06e-2,
            h=0.02e-2,
            E=16e5) annotation (Placement(transformation(extent={{-60,72},{
                    -56,76}})));
          TubeRLC_Derived leftCerebral(
            l=5.9e-2,
            isBranching=true,
            r=0.08e-2,
            h=0.026e-2,
            E=16e5) annotation (Placement(transformation(extent={{-60,74},{
                    -56,78}})));
          TubeRLC_Derived leftOpthalmic(
            l=3e-2,
            isBranching=true,
            r=0.07e-2,
            h=0.02e-2,
            E=16e5) annotation (Placement(transformation(extent={{-60,76},{
                    -56,80}})));
          TubeRLC_Derived coeliac(
            isBranching=true,
            l=1e-2,
            r=0.39e-2,
            h=0.064e-2,
            E=4e5) annotation (Placement(transformation(extent={{-64,44},{-60,
                    48}})));

          TubeRLC_Derived_IABP abdominalAorta1(
            isBranching=true,
            l=5.3e-2,
            r=0.87e-2,
            h=0.108e-2,
            E=4e5) annotation (Placement(transformation(
                extent={{-2,-2},{2,2}},
                rotation=90,
                origin={-58,40})));

          TubeRLC_Derived rightOpthalmic(
            l=3e-2,
            isBranching=true,
            r=0.07e-2,
            h=0.02e-2,
            E=16e5) annotation (Placement(transformation(extent={{-76,72},{
                    -72,76}})));
          TubeRLC_Derived rightCerebral(
            l=5.9e-2,
            isBranching=true,
            r=0.08e-2,
            h=0.026e-2,
            E=16e5) annotation (Placement(transformation(extent={{-76,74},{
                    -72,78}})));
          TubeRLC_Derived rightMiddleCerebral(
            l=3e-2,
            isBranching=true,
            r=0.06e-2,
            h=0.02e-2,
            E=16e5) annotation (Placement(transformation(extent={{-76,76},{
                    -72,80}})));
          TubeRLC_Derived rightFacial(
            l=4e-2,
            r=0.1e-2,
            h=0.03e-2,
            E=16e5) annotation (Placement(transformation(extent={{-70,78},{
                    -66,82}})));
          TubeRLC_Derived rightInternalCarotid2(
            isBranching=true,
            l=5.9e-2,
            r=0.13e-2,
            h=0.039e-2,
            E=8e5) annotation (Placement(transformation(extent={{-68,82},{-64,
                    86}})));

          TubeRLC_Derived rightLingual(
            l=3e-2,
            isBranching=true,
            r=0.1e-2,
            h=0.03e-2,
            E=8e5) annotation (Placement(transformation(extent={{-70,80},{-66,
                    84}})));
          TubeRLC_Derived rightBrachial1(
            isBranching=true,
            l=6.3e-2,
            r=0.28e-2,
            h=0.055e-2,
            E=4e5) annotation (Placement(transformation(extent={{-94,50},{-90,
                    54}})));

          TubeRLC_Derived leftProfundaBrachi(
            l=15e-2,
            isBranching=true,
            r=0.15e-2,
            h=0.035e-2,
            E=8e5) annotation (Placement(transformation(extent={{-38,50},{-34,
                    54}})));
          TubeRLC_Derived leftBrachial2(
            isBranching=true,
            l=6.3e-2,
            r=0.26e-2,
            h=0.053e-2,
            E=4e5) annotation (Placement(transformation(extent={{-36,48},{-32,
                    52}})));

          TubeRLC_Derived leftInternalCarotid3(
            l=5.9e-2,
            r=0.08e-2,
            h=0.026e-2,
            E=16e5) annotation (Placement(transformation(extent={{-52,84},{
                    -48,88}})));

          TubeRLC_Derived gastric1(
            l=7.1e-2,
            isBranching=true,
            r=0.18e-2,
            h=0.045e-2,
            E=4e5) annotation (Placement(transformation(extent={{-68,46},{-64,
                    50}})));
          TubeRLC_Derived splenic(
            l=6.3e-2,
            isBranching=true,
            r=0.28e-2,
            h=0.054e-2,
            E=4e5) annotation (Placement(transformation(extent={{-68,44},{-64,
                    48}})));
          TubeRLC_Derived hepatic(
            l=6.6e-2,
            isBranching=true,
            r=0.22e-2,
            h=0.049e-2,
            E=4e5) annotation (Placement(transformation(extent={{-68,42},{-64,
                    46}})));
          TubeRLC_Derived renal(
            l=3.2e-2,
            isBranching=true,
            r=0.26e-2,
            h=0.053e-2,
            E=4e5) annotation (Placement(transformation(extent={{-64,40},{-60,
                    44}})));
          TubeRLC_Derived abdominalAorta2(
            isBranching=true,
            l=5.3e-2,
            r=0.57e-2,
            h=0.08e-2,
            E=4e5) annotation (Placement(transformation(
                extent={{-2,-2},{2,2}},
                rotation=90,
                origin={-58,36})));

          TubeRLC_Derived superiorMesenteric(
            l=5.9e-2,
            isBranching=true,
            r=0.43e-2,
            h=0.069e-2,
            E=4e5) annotation (Placement(transformation(extent={{-64,36},{-60,
                    40}})));
          TubeRLC_Derived gastric2(
            l=3.2e-2,
            isBranching=true,
            r=0.26e-2,
            h=0.053e-2,
            E=4e5) annotation (Placement(transformation(extent={{-64,38},{-60,
                    42}})));
          TubeRLC_Derived rightInternalCarotid3(
            l=5.9e-2,
            r=0.08e-2,
            h=0.026e-2,
            E=16e5) annotation (Placement(transformation(extent={{-68,84},{
                    -64,88}})));

          TubeRLC_Derived rightBrachial2(
            isBranching=true,
            l=6.3e-2,
            r=0.26e-2,
            h=0.053e-2,
            E=4e5) annotation (Placement(transformation(extent={{-94,46},{-90,
                    50}})));

          TubeRLC_Derived rightProfundaBrachi(
            l=15e-2,
            isBranching=true,
            r=0.15e-2,
            h=0.035e-2,
            E=8e5) annotation (Placement(transformation(extent={{-96,48},{-92,
                    52}})));
          TubeRLC_Derived leftBrachial3(
            isBranching=true,
            l=6.3e-2,
            r=0.25e-2,
            h=0.052e-2,
            E=4e5) annotation (Placement(transformation(extent={{-36,44},{-32,
                    48}})));

          TubeRLC_Derived leftSuperiorUlnarCollateral(
            l=5e-2,
            isBranching=true,
            r=0.07e-2,
            h=0.02e-2,
            E=16e5) annotation (Placement(transformation(extent={{-38,46},{
                    -34,50}})));
          TubeRLC_Derived leftSuperficialTemporal(
            l=4e-2,
            isBranching=true,
            r=0.06e-2,
            h=0.02e-2,
            E=16e5) annotation (Placement(transformation(extent={{-52,88},{
                    -48,92}})));
          TubeRLC_Derived leftMaxilliary(
            l=5e-2,
            isBranching=true,
            r=0.07e-2,
            h=0.02e-2,
            E=16e5) annotation (Placement(transformation(extent={{-54,86},{
                    -50,90}})));
          TubeRLC_Derived abdominalAorta3(
            l=5.3e-2,
            r=0.57e-2,
            h=0.08e-2,
            E=4e5) annotation (Placement(transformation(
                extent={{-2,-2},{2,2}},
                rotation=90,
                origin={-58,32})));

          TubeRLC_Derived rightMaxilliary(
            l=5e-2,
            isBranching=true,
            r=0.07e-2,
            h=0.02e-2,
            E=16e5) annotation (Placement(transformation(extent={{-70,86},{
                    -66,90}})));
          TubeRLC_Derived rightSuperficialTemporal(
            l=4e-2,
            isBranching=true,
            r=0.06e-2,
            h=0.02e-2,
            E=16e5) annotation (Placement(transformation(extent={{-68,88},{
                    -64,92}})));
          TubeRLC_Derived rightSuperiorUlnarCollateral(
            l=5e-2,
            isBranching=true,
            r=0.07e-2,
            h=0.02e-2,
            E=16e5) annotation (Placement(transformation(extent={{-96,44},{
                    -92,48}})));
          TubeRLC_Derived rightBrachial3(
            isBranching=true,
            l=6.3e-2,
            r=0.25e-2,
            h=0.052e-2,
            E=4e5) annotation (Placement(transformation(extent={{-94,42},{-90,
                    46}})));

          TubeRLC_Derived leftInferiorUlnarCollateral(
            l=5e-2,
            isBranching=true,
            r=0.06e-2,
            h=0.02e-2,
            E=16e5) annotation (Placement(transformation(extent={{-38,42},{
                    -34,46}})));
          TubeRLC_Derived leftBrachial4(
            isBranching=true,
            l=4.6e-2,
            r=0.24e-2,
            h=0.05e-2,
            E=4e5) annotation (Placement(transformation(extent={{-36,40},{-32,
                    44}})));

          TubeRLC_Derived leftCommonIlliac(
            isBranching=true,
            l=5.8e-2,
            r=0.52e-2,
            h=0.076e-2,
            E=4e5) annotation (Placement(transformation(extent={{-54,26},{-50,
                    30}})));

          TubeRLC_Derived inferiorMesenteric(
            l=5e-2,
            isBranching=true,
            r=0.16e-2,
            h=0.043e-2,
            E=4e5) annotation (Placement(transformation(extent={{-60,26},{-56,
                    30}})));
          TubeRLC_Derived rightCommonIlliac(
            isBranching=true,
            l=5.8e-2,
            r=0.52e-2,
            h=0.076e-2,
            E=4e5) annotation (Placement(transformation(extent={{-64,26},{-60,
                    30}})));

          TubeRLC_Derived rightBrachial4(
            isBranching=true,
            l=4.6e-2,
            r=0.24e-2,
            h=0.05e-2,
            E=4e5) annotation (Placement(transformation(extent={{-94,38},{-90,
                    42}})));

          TubeRLC_Derived rightInferiorUlnarCollateral(
            l=5e-2,
            isBranching=true,
            r=0.06e-2,
            h=0.02e-2,
            E=16e5) annotation (Placement(transformation(extent={{-96,40},{
                    -92,44}})));
          TubeRLC_Derived leftUlnar1(
            isBranching=true,
            l=6.7e-2,
            r=0.21e-2,
            h=0.049e-2,
            E=8e5) annotation (Placement(transformation(extent={{-34,38},{-30,
                    42}})));

          TubeRLC_Derived leftRadial1(
            isBranching=true,
            l=11.7e-2,
            r=0.16e-2,
            h=0.043e-2,
            E=8e5) annotation (Placement(transformation(extent={{-40,38},{-36,
                    42}})));

          TubeRLC_Derived leftExternalIlliac1(
            isBranching=true,
            l=8.3e-2,
            r=0.29e-2,
            h=0.055e-2,
            E=4e5) annotation (Placement(transformation(extent={{-54,22},{-50,
                    26}})));

          TubeRLC_Derived leftInternalIlliac(
            l=5e-2,
            isBranching=true,
            r=0.2e-2,
            h=0.04e-2,
            E=16e5) annotation (Placement(transformation(extent={{-56,24},{
                    -52,28}})));
          TubeRLC_Derived rightInternalIlliac(
            l=5e-2,
            isBranching=true,
            r=0.2e-2,
            h=0.04e-2,
            E=16e5) annotation (Placement(transformation(extent={{-66,24},{
                    -62,28}})));
          TubeRLC_Derived rightExternalIlliac1(
            isBranching=true,
            l=8.3e-2,
            r=0.29e-2,
            h=0.055e-2,
            E=4e5) annotation (Placement(transformation(extent={{-64,22},{-60,
                    26}})));

          TubeRLC_Derived rightRadial1(
            isBranching=true,
            l=11.7e-2,
            r=0.16e-2,
            h=0.043e-2,
            E=8e5) annotation (Placement(transformation(extent={{-96,36},{-92,
                    40}})));

          TubeRLC_Derived rightUlnar1(
            isBranching=true,
            l=6.7e-2,
            r=0.21e-2,
            h=0.049e-2,
            E=8e5) annotation (Placement(transformation(extent={{-92,34},{-88,
                    38}})));
          TubeRLC_Derived leftUlnar2(
            isBranching=true,
            l=8.5e-2,
            r=0.19e-2,
            h=0.046e-2,
            E=8e5) annotation (Placement(transformation(extent={{-34,34},{-30,
                    38}})));

          TubeRLC_Derived leftInterossea(
            l=7.9e-2,
            isBranching=true,
            r=0.09e-2,
            h=0.028e-2,
            E=16e5) annotation (Placement(transformation(extent={{-36,36},{
                    -32,40}})));
          TubeRLC_Derived leftRadial2(
            l=11.7e-2,
            r=0.16e-2,
            h=0.043e-2,
            E=8e5) annotation (Placement(transformation(extent={{-42,36},{-38,
                    40}})));
          TubeRLC_Derived leftExternalIlliac2(
            l=6.1e-2,
            r=0.27e-2,
            h=0.053e-2,
            E=4e5) annotation (Placement(transformation(extent={{-54,20},{-50,
                    24}})));

          TubeRLC_Derived rightExternalIlliac2(
            l=6.1e-2,
            r=0.27e-2,
            h=0.053e-2,
            E=4e5) annotation (Placement(transformation(extent={{-64,20},{-60,
                    24}})));

          TubeRLC_Derived rightRadial2(
            l=11.7e-2,
            r=0.16e-2,
            h=0.043e-2,
            E=8e5) annotation (Placement(transformation(extent={{-98,34},{-94,
                    38}})));
          TubeRLC_Derived rightInterossea(
            l=7.9e-2,
            isBranching=true,
            r=0.09e-2,
            h=0.028e-2,
            E=16e5) annotation (Placement(transformation(extent={{-94,32},{
                    -90,36}})));
          TubeRLC_Derived rightUlnar2(
            l=8.5e-2,
            isBranching=true,
            r=0.19e-2,
            h=0.046e-2,
            E=8e5) annotation (Placement(transformation(extent={{-92,30},{-88,
                    34}})));

          TubeRLC_Derived leftUlnar3(
            l=8.5e-2,
            r=0.19e-2,
            h=0.046e-2,
            E=8e5) annotation (Placement(transformation(extent={{-34,32},{-30,
                    36}})));
          TubeRLC_Derived leftFemoral1(
            isBranching=true,
            l=12.7e-2,
            r=0.24e-2,
            h=0.05e-2,
            E=8e5) annotation (Placement(transformation(extent={{-54,16},{-50,
                    20}})));

          TubeRLC_Derived leftProfundis(
            l=12.6e-2,
            isBranching=true,
            r=0.23e-2,
            h=0.049e-2,
            E=16e5) annotation (Placement(transformation(extent={{-56,18},{
                    -52,22}})));
          TubeRLC_Derived rightProfundis(
            l=12.6e-2,
            isBranching=true,
            r=0.23e-2,
            h=0.049e-2,
            E=16e5) annotation (Placement(transformation(extent={{-66,18},{
                    -62,22}})));
          TubeRLC_Derived rightFemoral1(
            isBranching=true,
            l=12.7e-2,
            r=0.24e-2,
            h=0.05e-2,
            E=8e5) annotation (Placement(transformation(extent={{-64,16},{-60,
                    20}})));

          TubeRLC_Derived rightUlnar3(
            l=8.5e-2,
            r=0.19e-2,
            h=0.046e-2,
            E=8e5) annotation (Placement(transformation(extent={{-92,28},{-88,
                    32}})));
          TubeRLC_Derived leftFemoral2(
            l=12.7e-2,
            r=0.24e-2,
            h=0.05e-2,
            E=8e5) annotation (Placement(transformation(extent={{-54,14},{-50,
                    18}})));

          TubeRLC_Derived rightFemoral2(
            l=12.7e-2,
            r=0.24e-2,
            h=0.05e-2,
            E=8e5) annotation (Placement(transformation(extent={{-64,14},{-60,
                    18}})));

          TubeRLC_Derived leftPopliteal1(
            l=9.4e-2,
            r=0.2e-2,
            h=0.047e-2,
            E=8e5) annotation (Placement(transformation(extent={{-54,12},{-50,
                    16}})));

          TubeRLC_Derived rightPopliteal1(
            l=9.4e-2,
            r=0.2e-2,
            h=0.047e-2,
            E=8e5) annotation (Placement(transformation(extent={{-64,12},{-60,
                    16}})));

          TubeRLC_Derived leftPopliteal2(
            l=9.4e-2,
            r=0.2e-2,
            h=0.05e-2,
            E=4e5) annotation (Placement(transformation(
                extent={{-2,-2},{2,2}},
                rotation=90,
                origin={-52,10})));

          TubeRLC_Derived rightPopliteal2(
            l=9.4e-2,
            r=0.2e-2,
            h=0.05e-2,
            E=4e5) annotation (Placement(transformation(
                extent={{-2,-2},{2,2}},
                rotation=90,
                origin={-62,10})));

          TubeRLC_Derived leftAnteriorTibial1(
            isBranching=true,
            l=2.5e-2,
            r=0.13e-2,
            h=0.039e-2,
            E=16e5) annotation (Placement(transformation(extent={{-52,2},{-48,
                    6}})));

          TubeRLC_Derived leftPosteriorTibial1(
            isBranching=true,
            l=16.1e-2,
            r=0.18e-2,
            h=0.045e-2,
            E=16e5) annotation (Placement(transformation(extent={{-58,6},{-54,
                    10}})));

          TubeRLC_Derived rightPosteriorTibial1(
            isBranching=true,
            l=16.1e-2,
            r=0.18e-2,
            h=0.045e-2,
            E=16e5) annotation (Placement(transformation(extent={{-64,-2},{
                    -60,2}})));

          TubeRLC_Derived rightAnteriorTibial1(
            isBranching=true,
            l=2.5e-2,
            r=0.13e-2,
            h=0.039e-2,
            E=16e5) annotation (Placement(transformation(extent={{-68,4},{-64,
                    8}})));

          TubeRLC_Derived leftAnteriorTibial2(
            isBranching=true,
            l=15e-2,
            r=0.1e-2,
            h=0.02e-2,
            E=16e5) annotation (Placement(transformation(extent={{-52,-4},{
                    -48,0}})));

          TubeRLC_Derived leftPeroneal1(
            isBranching=true,
            l=15.9e-2,
            r=0.13e-2,
            h=0.039e-2,
            E=16e5) annotation (Placement(transformation(extent={{-56,-2},{
                    -52,2}})));

          TubeRLC_Derived leftPosteriorTibial2(
            l=16.1e-2,
            r=0.18e-2,
            h=0.045e-2,
            E=16e5) annotation (Placement(transformation(extent={{-60,2},{-56,
                    6}})));
          TubeRLC_Derived rightPosteriorTibial2(
            l=16.1e-2,
            r=0.18e-2,
            h=0.045e-2,
            E=16e5) annotation (Placement(transformation(extent={{-68,-4},{
                    -64,0}})));
          TubeRLC_Derived rightPeroneal1(
            isBranching=true,
            l=15.9e-2,
            r=0.13e-2,
            h=0.039e-2,
            E=16e5) annotation (Placement(transformation(extent={{-70,-2},{
                    -66,2}})));

          TubeRLC_Derived rightAnteriorTibial2(
            isBranching=true,
            l=15e-2,
            r=0.1e-2,
            h=0.02e-2,
            E=16e5) annotation (Placement(transformation(extent={{-72,2},{-68,
                    6}})));

          TubeRLC_Derived leftAnteriorTibial3(
            l=15e-2,
            r=0.1e-2,
            h=0.02e-2,
            E=16e5) annotation (Placement(transformation(extent={{-52,-8},{
                    -48,-4}})));
          TubeRLC_Derived leftPeroneal2(
            l=15.9e-2,
            r=0.13e-2,
            h=0.019e-2,
            E=16e5) annotation (Placement(transformation(extent={{-58,-8},{
                    -54,-4}})));
          TubeRLC_Derived rightPeroneal2(
            l=15.9e-2,
            r=0.13e-2,
            h=0.019e-2,
            E=16e5) annotation (Placement(transformation(extent={{-74,-6},{
                    -70,-2}})));
          TubeRLC_Derived rightAnteriorTibial3(
            l=15e-2,
            r=0.1e-2,
            h=0.02e-2,
            E=16e5) annotation (Placement(transformation(extent={{-76,-2},{
                    -72,2}})));
        // initial equation
        //   thoracicAorta3.V = 180e-3;

        equation
          der(V_filling) = q_filling;
          q_filling/speed_factor = V_init - V_filling;
          // - der(V_filling);
            volumeControl_.solutionFlow = q_filling;
          connect(volumeControl_.q_out, cIn);
          // Homely component -> disabling vizualization, even for connection

          pInner = aorticArch2.cIn.pressure;

          if settings.supports.ECMO_isEnabled then
            if settings.supports.ECMO_cannulaPlacement == CannulaPlacement.ascendingAorta then
              connect(cCannula, ascendingAorta.cIn);
            elseif settings.supports.ECMO_cannulaPlacement ==
                CannulaPlacement.aorticArch1 then
              connect(cCannula, aorticArch1.cIn);
            elseif settings.supports.ECMO_cannulaPlacement ==
                CannulaPlacement.aorticArch2 then
              connect(cCannula, aorticArch2.cIn);
            elseif settings.supports.ECMO_cannulaPlacement ==
                CannulaPlacement.thoracicAorta1 then
              connect(cCannula, thoracicAorta1.cIn);
            elseif settings.supports.ECMO_cannulaPlacement ==
                CannulaPlacement.thoracicAorta2 then
              connect(cCannula, thoracicAorta2.cIn);
            else
              connect(cCannula, cIn);
            end if;
          else
            connect(cCannula, cIn);
          end if;

          connect(rightAnteriorTibial2.cOut, rightAnteriorTibial3.cIn)
            annotation (Line(
              points={{-68.4,4},{-75.6,4},{-75.6,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightPeroneal1.cOut, rightPeroneal2.cIn) annotation (Line(
              points={{-66.4,0},{-73.6,0},{-73.6,-4}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftPeroneal1.cOut, leftPeroneal2.cIn) annotation (Line(
              points={{-52.4,0},{-54,0},{-54,-6},{-57.6,-6}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftAnteriorTibial2.cOut, leftAnteriorTibial3.cIn)
            annotation (Line(
              points={{-48.4,-2},{-50,-2},{-50,-6},{-51.6,-6}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightAnteriorTibial1.cOut, rightAnteriorTibial2.cIn)
            annotation (Line(
              points={{-64.4,6},{-71.6,6},{-71.6,4}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightAnteriorTibial1.cOut, rightPeroneal1.cIn)
            annotation (Line(
              points={{-64.4,6},{-69.6,6},{-69.6,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightPosteriorTibial1.cOut, rightPosteriorTibial2.cIn)
            annotation (Line(
              points={{-60.4,0},{-67.6,0},{-67.6,-2}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftPosteriorTibial1.cOut, leftPosteriorTibial2.cIn)
            annotation (Line(
              points={{-54.4,8},{-59.6,8},{-59.6,4}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftAnteriorTibial1.cOut, leftPeroneal1.cIn) annotation (
              Line(
              points={{-48.4,4},{-55.6,4},{-55.6,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftAnteriorTibial1.cOut, leftAnteriorTibial2.cIn)
            annotation (Line(
              points={{-48.4,4},{-50,4},{-50,-2},{-51.6,-2}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightPopliteal2.cOut, rightAnteriorTibial1.cIn)
            annotation (Line(
              points={{-62,11.6},{-67.6,11.6},{-67.6,6}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightPopliteal2.cOut, rightPosteriorTibial1.cIn)
            annotation (Line(
              points={{-62,11.6},{-62,0},{-63.6,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftPopliteal2.cOut, leftPosteriorTibial1.cIn)
            annotation (Line(
              points={{-52,11.6},{-54,11.6},{-54,8},{-57.6,8}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftPopliteal2.cOut, leftAnteriorTibial1.cIn) annotation (
             Line(
              points={{-52,11.6},{-50,11.6},{-50,4},{-51.6,4}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightPopliteal1.cOut, rightPopliteal2.cIn) annotation (
              Line(
              points={{-60.4,14},{-62,14},{-62,8.4}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftPopliteal1.cOut, leftPopliteal2.cIn) annotation (Line(
              points={{-50.4,14},{-52,14},{-52,8.4}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightFemoral2.cOut, rightPopliteal1.cIn) annotation (Line(
              points={{-60.4,16},{-62,16},{-62,14},{-63.6,14}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftFemoral2.cOut, leftPopliteal1.cIn) annotation (Line(
              points={{-50.4,16},{-52,16},{-52,14},{-53.6,14}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightFemoral1.cOut, rightFemoral2.cIn) annotation (Line(
              points={{-60.4,18},{-62,18},{-62,16},{-63.6,16}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftFemoral1.cOut, leftFemoral2.cIn) annotation (Line(
              points={{-50.4,18},{-52,18},{-52,16},{-53.6,16}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightUlnar2.cOut, rightUlnar3.cIn) annotation (Line(
              points={{-88.4,32},{-90,32},{-90,30},{-91.6,30}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightExternalIlliac2.cOut, rightFemoral1.cIn) annotation (
             Line(
              points={{-60.4,22},{-62,22},{-62,18},{-63.6,18}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightExternalIlliac2.cOut, rightProfundis.cIn)
            annotation (Line(
              points={{-60.4,22},{-65.6,22},{-65.6,20}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftExternalIlliac2.cOut, leftProfundis.cIn) annotation (
              Line(
              points={{-50.4,22},{-55.6,22},{-55.6,20}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftExternalIlliac2.cOut, leftFemoral1.cIn) annotation (
              Line(
              points={{-50.4,22},{-52,22},{-52,18},{-53.6,18}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftUlnar2.cOut, leftUlnar3.cIn) annotation (Line(
              points={{-30.4,36},{-32,36},{-32,34},{-33.6,34}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightRadial1.cOut, rightRadial2.cIn) annotation (Line(
              points={{-92.4,38},{-97.6,38},{-97.6,36}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightExternalIlliac1.cOut, rightExternalIlliac2.cIn)
            annotation (Line(
              points={{-60.4,24},{-62,24},{-62,22},{-63.6,22}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftExternalIlliac1.cOut, leftExternalIlliac2.cIn)
            annotation (Line(
              points={{-50.4,24},{-52,24},{-52,22},{-53.6,22}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightUlnar1.cOut, rightInterossea.cIn) annotation (Line(
              points={{-88.4,36},{-93.6,36},{-93.6,34}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightUlnar1.cOut, rightUlnar2.cIn) annotation (Line(
              points={{-88.4,36},{-90,36},{-90,32},{-91.6,32}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftUlnar1.cOut, leftInterossea.cIn) annotation (Line(
              points={{-30.4,40},{-35.6,40},{-35.6,38}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftUlnar1.cOut, leftUlnar2.cIn) annotation (Line(
              points={{-30.4,40},{-32,40},{-32,36},{-33.6,36}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftRadial1.cOut, leftRadial2.cIn) annotation (Line(
              points={{-36.4,40},{-41.6,40},{-41.6,38}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightBrachial4.cOut, rightRadial1.cIn) annotation (Line(
              points={{-90.4,40},{-95.6,40},{-95.6,38}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightBrachial4.cOut, rightUlnar1.cIn) annotation (Line(
              points={{-90.4,40},{-90,40},{-90,36},{-91.6,36}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightCommonIlliac.cOut, rightInternalIlliac.cIn)
            annotation (Line(
              points={{-60.4,28},{-65.6,28},{-65.6,26}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightCommonIlliac.cOut, rightExternalIlliac1.cIn)
            annotation (Line(
              points={{-60.4,28},{-62,28},{-62,24},{-63.6,24}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftCommonIlliac.cOut, leftInternalIlliac.cIn)
            annotation (Line(
              points={{-50.4,28},{-55.6,28},{-55.6,26}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftCommonIlliac.cOut, leftExternalIlliac1.cIn)
            annotation (Line(
              points={{-50.4,28},{-52,28},{-52,24},{-53.6,24}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftBrachial4.cOut, leftRadial1.cIn) annotation (Line(
              points={{-32.4,42},{-39.6,42},{-39.6,40}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftBrachial4.cOut, leftUlnar1.cIn) annotation (Line(
              points={{-32.4,42},{-32,42},{-32,40},{-33.6,40}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightBrachial3.cOut, rightInferiorUlnarCollateral.cIn)
            annotation (Line(
              points={{-90.4,44},{-95.6,44},{-95.6,42}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightBrachial4.cIn, rightBrachial3.cOut) annotation (Line(
              points={{-93.6,40},{-92,40},{-92,44},{-90.4,44}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightCommonIlliac.cIn, abdominalAorta3.cOut) annotation (
              Line(
              points={{-63.6,28},{-60,28},{-60,33.6},{-58,33.6}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(inferiorMesenteric.cIn, abdominalAorta3.cOut) annotation (
             Line(
              points={{-59.6,28},{-58,28},{-58,33.6}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftCommonIlliac.cIn, abdominalAorta3.cOut) annotation (
              Line(points={{-53.6,28},{-54,28},{-54,30},{-58,30},{-58,33.6}},
                smooth=Smooth.None));
          connect(leftBrachial4.cIn, leftBrachial3.cOut) annotation (Line(
              points={{-35.6,42},{-34,42},{-34,46},{-32.4,46}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftBrachial3.cOut, leftInferiorUlnarCollateral.cIn)
            annotation (Line(
              points={{-32.4,46},{-37.6,46},{-37.6,44}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightSuperiorUlnarCollateral.cIn, rightBrachial2.cOut)
            annotation (Line(
              points={{-95.6,46},{-90.4,46},{-90.4,48}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightBrachial2.cOut, rightBrachial3.cIn) annotation (Line(
              points={{-90.4,48},{-92,48},{-92,44},{-93.6,44}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightInternalCarotid3.cOut, rightMaxilliary.cIn)
            annotation (Line(
              points={{-64.4,86},{-69.6,86},{-69.6,88}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightInternalCarotid3.cOut, rightSuperficialTemporal.cIn)
            annotation (Line(
              points={{-64.4,86},{-66,86},{-66,90},{-67.6,90}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(abdominalAorta2.cOut, abdominalAorta3.cIn) annotation (
              Line(
              points={{-58,37.6},{-58,30.4}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftInternalCarotid3.cOut, leftMaxilliary.cIn)
            annotation (Line(
              points={{-48.4,86},{-53.6,86},{-53.6,88}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftInternalCarotid3.cOut, leftSuperficialTemporal.cIn)
            annotation (Line(
              points={{-48.4,86},{-50,86},{-50,90},{-51.6,90}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftBrachial2.cOut, leftSuperiorUlnarCollateral.cIn)
            annotation (Line(
              points={{-32.4,50},{-37.6,50},{-37.6,48}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftBrachial2.cOut, leftBrachial3.cIn) annotation (Line(
              points={{-32.4,50},{-34,50},{-34,46},{-35.6,46}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightInternalCarotid3.cIn, rightInternalCarotid2.cOut)
            annotation (Line(
              points={{-67.6,86},{-66,86},{-66,84},{-64.4,84}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightBrachial1.cOut, rightProfundaBrachi.cIn) annotation (
             Line(
              points={{-90.4,52},{-95.6,52},{-95.6,50}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightBrachial1.cOut, rightBrachial2.cIn) annotation (Line(
              points={{-90.4,52},{-92,52},{-92,48},{-93.6,48}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(abdominalAorta1.cOut, abdominalAorta2.cIn) annotation (
              Line(
              points={{-58,41.6},{-58,34.4}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(abdominalAorta1.cOut, superiorMesenteric.cIn) annotation (
             Line(
              points={{-58,41.6},{-63.6,41.6},{-63.6,38}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(abdominalAorta1.cOut, gastric2.cIn) annotation (Line(
              points={{-58,41.6},{-63.6,41.6},{-63.6,40}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(abdominalAorta1.cOut, renal.cIn) annotation (Line(
              points={{-58,41.6},{-63.6,41.6},{-63.6,42}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(coeliac.cOut, splenic.cIn) annotation (Line(
              points={{-60.4,46},{-67.6,46}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(coeliac.cOut, gastric1.cIn) annotation (Line(
              points={{-60.4,46},{-67.6,46},{-67.6,48}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(coeliac.cOut, hepatic.cIn) annotation (Line(
              points={{-60.4,46},{-67.6,46},{-67.6,44}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftInternalCarotid2.cOut, leftInternalCarotid3.cIn)
            annotation (Line(
              points={{-48.4,84},{-50,84},{-50,86},{-51.6,86}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftBrachial1.cOut, leftProfundaBrachi.cIn) annotation (
              Line(
              points={{-32.4,54},{-37.6,54},{-37.6,52}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftBrachial1.cOut, leftBrachial2.cIn) annotation (Line(
              points={{-32.4,54},{-34,54},{-34,50},{-35.6,50}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightAxilliary2.cOut, rightBrachial1.cIn) annotation (
              Line(
              points={{-88.4,54},{-93.6,54},{-93.6,52}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightInternalCarotid1.cOut, rightFacial.cIn) annotation (
              Line(
              points={{-64.4,78},{-69.6,78},{-69.6,80}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightInternalCarotid1.cOut, rightLingual.cIn) annotation (
             Line(
              points={{-64.4,78},{-69.6,78},{-69.6,82}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightInternalCarotid1.cOut, rightInternalCarotid2.cIn)
            annotation (Line(
              points={{-64.4,78},{-66,78},{-66,84},{-67.6,84}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightCerebral.cIn, rightExternalCarotid.cOut) annotation (
             Line(
              points={{-75.6,76},{-66.4,76}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightExternalCarotid.cOut, rightOpthalmic.cIn)
            annotation (Line(
              points={{-66.4,76},{-70,76},{-70,74},{-75.6,74}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightExternalCarotid.cOut, rightMiddleCerebral.cIn)
            annotation (Line(
              points={{-66.4,76},{-70,76},{-70,78},{-75.6,78}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(thoracicAorta3.cOut, abdominalAorta1.cIn) annotation (
              Line(
              points={{-58,47.6},{-58,38.4}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(thoracicAorta3.cOut, coeliac.cIn) annotation (Line(
              points={{-58,47.6},{-63.6,47.6},{-63.6,46}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftInternalCarotid1.cOut, leftLingual.cIn) annotation (
              Line(
              points={{-48.4,78},{-53.6,78},{-53.6,80}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftInternalCarotid1.cOut, leftFacial.cIn) annotation (
              Line(
              points={{-48.4,78},{-53.6,78},{-53.6,82}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftInternalCarotid1.cOut, leftInternalCarotid2.cIn)
            annotation (Line(
              points={{-48.4,78},{-50,78},{-50,84},{-51.6,84}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftCerebral.cIn, leftExternalCarotid.cOut) annotation (
              Line(
              points={{-59.6,76},{-50.4,76}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftExternalCarotid.cOut, leftMiddleCerebral.cIn)
            annotation (Line(
              points={{-50.4,76},{-54,76},{-54,74},{-59.6,74}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftExternalCarotid.cOut, leftOpthalmic.cIn) annotation (
              Line(
              points={{-50.4,76},{-54,76},{-54,78},{-59.6,78}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftAxilliary2.cOut, leftBrachial1.cIn) annotation (Line(
              points={{-32.4,56},{-34,56},{-34,54},{-35.6,54}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightAxilliary1.cOut, rightCircumflexScapular.cIn)
            annotation (Line(
              points={{-84.4,58},{-93.6,58}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightAxilliary1.cOut, rightThoracoacrominal.cIn)
            annotation (Line(
              points={{-84.4,58},{-88,58},{-88,56},{-93.6,56}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightAxilliary1.cOut, rightSubscapular.cIn) annotation (
              Line(
              points={{-84.4,58},{-88,58},{-88,60},{-93.6,60}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightAxilliary1.cOut, rightAxilliary2.cIn) annotation (
              Line(
              points={{-84.4,58},{-91.6,58},{-91.6,54}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightCommonCarotid2.cOut, rightSuperiorThyroid.cIn)
            annotation (Line(
              points={{-64.4,72},{-69.6,72},{-69.6,74}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightCommonCarotid2.cOut, rightExternalCarotid.cIn)
            annotation (Line(
              points={{-64.4,72},{-69.6,72},{-69.6,76}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightCommonCarotid2.cOut, rightInternalCarotid1.cIn)
            annotation (Line(
              points={{-64.4,72},{-66,72},{-66,78},{-67.6,78}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(thoracicAorta2.cOut, thoracicAorta3.cIn) annotation (Line(
              points={{-56.4,50},{-58,50},{-58,44.4}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftCommonCarotid3.cOut, leftSuperiorThyroid.cIn)
            annotation (Line(
              points={{-48.4,72},{-53.6,72},{-53.6,74}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftCommonCarotid3.cOut, leftExternalCarotid.cIn)
            annotation (Line(
              points={{-48.4,72},{-53.6,72},{-53.6,76}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftCommonCarotid3.cOut, leftInternalCarotid1.cIn)
            annotation (Line(
              points={{-48.4,72},{-50,72},{-50,78},{-51.6,78}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftAxilliary1.cOut, leftSubscapular.cIn) annotation (
              Line(
              points={{-35.6,64},{-35.6,62},{-37.6,62}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftAxilliary1.cOut, leftThoracoacrominal.cIn)
            annotation (Line(
              points={{-35.6,64},{-37.6,64},{-37.6,60}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftAxilliary1.cOut, leftCircumflexScapular.cIn)
            annotation (Line(
              points={{-35.6,64},{-37.6,64},{-37.6,58}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftAxilliary1.cOut, leftAxilliary2.cIn) annotation (Line(
              points={{-35.6,64},{-35.6,64},{-35.6,56}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightSubclavian.cOut, rightAxilliary1.cIn) annotation (
              Line(
              points={{-78.4,58},{-87.6,58}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightSubclavian.cOut, rightCostocervical.cIn) annotation (
             Line(
              points={{-78.4,58},{-85.6,58},{-85.6,60}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightSubclavian.cOut, rightThyrocervical.cIn) annotation (
             Line(
              points={{-78.4,58},{-85.6,58},{-85.6,62}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightSubclavian.cOut, rightSuprascapular.cIn) annotation (
             Line(
              points={{-78.4,58},{-85.6,58},{-85.6,64}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightCommonCarotid2.cIn, rightCommonCarotid1.cOut)
            annotation (Line(
              points={{-67.6,72},{-66,72},{-66,70},{-64.4,70}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(thoracicAorta1.cOut, thoracicAorta2.cIn) annotation (Line(
              points={{-56.4,52},{-58,52},{-58,50},{-59.6,50}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftCommonCarotid2.cOut, leftCommonCarotid3.cIn)
            annotation (Line(
              points={{-48.4,70},{-50,70},{-50,72},{-51.6,72}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftSubclavian2.cOut, leftAxilliary1.cIn) annotation (
              Line(
              points={{-45.6,64},{-32.4,64}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftSubclavian2.cOut, leftCostocervical.cIn) annotation (
              Line(
              points={{-45.6,64},{-41.6,64},{-41.6,66}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftSubclavian2.cOut, leftSuprascapular.cIn) annotation (
              Line(
              points={{-45.6,64},{-41.6,64},{-41.6,68}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftSubclavian2.cOut, leftThyrocervical.cIn) annotation (
              Line(
              points={{-45.6,64},{-41.6,64},{-41.6,70}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(aorticArch2.cOut, thoracicAorta1.cIn) annotation (Line(
              points={{-58,57.6},{-58,52},{-59.6,52}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftCommonCarotid1.cOut, leftCommonCarotid2.cIn)
            annotation (Line(
              points={{-48.4,68},{-50,68},{-50,70},{-51.6,70}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftSubclavian1.cOut, leftSubclavian2.cIn) annotation (
              Line(
              points={{-55.6,62},{-50,62},{-50,64},{-42.4,64}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftSubclavian1.cOut, leftInternalMammary.cIn)
            annotation (Line(
              points={{-55.6,62},{-48,62},{-48,60},{-47.6,60}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftSubclavian1.cOut, leftVertebral.cIn) annotation (Line(
              points={{-55.6,62},{-48,62},{-48,58},{-47.6,58}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(brachiocephalic.cOut, rightVertebral.cIn) annotation (
              Line(
              points={{-60.4,62},{-70,62},{-70,60},{-79.6,60}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(brachiocephalic.cOut, rightSubclavian.cIn) annotation (
              Line(
              points={{-60.4,62},{-70,62},{-70,58},{-81.6,58}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(brachiocephalic.cOut, righInternalMammary.cIn)
            annotation (Line(
              points={{-60.4,62},{-70,62},{-70,56},{-79.6,56}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(brachiocephalic.cOut, rightCommonCarotid1.cIn)
            annotation (Line(
              points={{-60.4,62},{-67.6,62},{-67.6,70}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(ascendingAorta.cIn, cIn) annotation (Line(
              points={{-64.4,54},{-72,54},{-72,0},{-80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(aorticArch1.cIn, ascendingAorta.cOut) annotation (Line(
              points={{-62.4,56},{-67.6,56},{-67.6,54}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(aorticArch1.cOut, brachiocephalic.cIn) annotation (Line(
              points={{-65.6,56},{-62,56},{-62,62},{-63.6,62}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(aorticArch1.cOut, leftCommonCarotid1.cIn) annotation (
              Line(
              points={{-65.6,56},{-56,56},{-56,68},{-51.6,68}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(aorticArch1.cOut, aorticArch2.cIn) annotation (Line(
              points={{-65.6,56},{-60,56},{-60,54.4},{-58,54.4}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(aorticArch1.cOut, leftSubclavian1.cIn) annotation (Line(
              points={{-65.6,56},{-60,56},{-60,62},{-52.4,62}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightAnteriorTibial3.cOut, cOut) annotation (Line(
              points={{-72.4,0},{-82,0},{-82,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightPeroneal2.cOut, cOut) annotation (Line(
              points={{-70.4,-4},{-78,-4},{-78,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightPosteriorTibial2.cOut, cOut) annotation (Line(
              points={{-64.4,-2},{-78,-2},{-78,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightProfundis.cOut, cOut) annotation (Line(
              points={{-62.4,20},{-74,20},{-74,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightInternalIlliac.cOut, cOut) annotation (Line(
              points={{-62.4,26},{-74,26},{-74,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftPeroneal2.cOut, cOut) annotation (Line(
              points={{-54.4,-6},{-74,-6},{-74,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftAnteriorTibial3.cOut, cOut) annotation (Line(
              points={{-48.4,-6},{-70,-6},{-70,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftPosteriorTibial2.cOut, cOut) annotation (Line(points=
                  {{-56.4,4},{-72,4},{-72,0},{80,0}}, smooth=Smooth.None));
          connect(leftProfundis.cOut, cOut) annotation (Line(
              points={{-52.4,20},{-70,20},{-70,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftInternalIlliac.cOut, cOut) annotation (Line(
              points={{-52.4,26},{-70,26},{-70,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(inferiorMesenteric.cOut, cOut) annotation (Line(
              points={{-56.4,28},{-72,28},{-72,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(superiorMesenteric.cOut, cOut) annotation (Line(
              points={{-60.4,38},{-74,38},{-74,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(gastric2.cOut, cOut) annotation (Line(
              points={{-60.4,40},{-74,40},{-74,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(renal.cOut, cOut) annotation (Line(
              points={{-60.4,42},{-74,42},{-74,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(hepatic.cOut, cOut) annotation (Line(
              points={{-64.4,44},{-76,44},{-76,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(splenic.cOut, cOut) annotation (Line(
              points={{-64.4,46},{-74,46},{-74,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(gastric1.cOut, cOut) annotation (Line(
              points={{-64.4,48},{-76,48},{-76,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightUlnar3.cOut, cOut) annotation (Line(
              points={{-88.4,30},{-90,30},{-90,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightInterossea.cOut, cOut) annotation (Line(
              points={{-90.4,34},{80,34},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightRadial2.cOut, cOut) annotation (Line(
              points={{-94.4,36},{-96,36},{-96,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightInferiorUlnarCollateral.cOut, cOut) annotation (Line(
              points={{-92.4,42},{80,42},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightSuperiorUlnarCollateral.cOut, cOut) annotation (Line(
              points={{-92.4,46},{80,46},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightProfundaBrachi.cOut, cOut) annotation (Line(
              points={{-92.4,50},{80,50},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightThoracoacrominal.cOut, cOut) annotation (Line(
              points={{-90.4,56},{80,56},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightCircumflexScapular.cOut, cOut) annotation (Line(
              points={{-90.4,58},{80,58},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightSubscapular.cOut, cOut) annotation (Line(
              points={{-90.4,60},{80,60},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightCostocervical.cOut, cOut) annotation (Line(
              points={{-82.4,60},{-86,60},{-86,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightThyrocervical.cOut, cOut) annotation (Line(points={{
                  -82.4,62},{-86,62},{-86,0},{80,0}}, smooth=Smooth.None));
          connect(rightSuprascapular.cOut, cOut) annotation (Line(
              points={{-82.4,64},{-86,64},{-86,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftUlnar3.cOut, cOut) annotation (Line(
              points={{-30.4,34},{-56,34},{-56,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftInterossea.cOut, cOut) annotation (Line(
              points={{-32.4,38},{-58,38},{-58,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftRadial2.cOut, cOut) annotation (Line(
              points={{-38.4,38},{-60,38},{-60,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftInferiorUlnarCollateral.cOut, cOut) annotation (Line(
              points={{-34.4,44},{-60,44},{-60,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftSuperiorUlnarCollateral.cOut, cOut) annotation (Line(
              points={{-34.4,48},{-60,48},{-60,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftProfundaBrachi.cOut, cOut) annotation (Line(
              points={{-34.4,52},{-60,52},{-60,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftCircumflexScapular.cOut, cOut) annotation (Line(
              points={{-34.4,58},{-58,58},{-58,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftThoracoacrominal.cOut, cOut) annotation (Line(
              points={{-34.4,60},{-60,60},{-60,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftSubscapular.cOut, cOut) annotation (Line(
              points={{-34.4,62},{-60,62},{-60,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftCostocervical.cOut, cOut) annotation (Line(
              points={{-38.4,66},{-62,66},{-62,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftSuprascapular.cOut, cOut) annotation (Line(
              points={{-38.4,68},{-60,68},{-60,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftThyrocervical.cOut, cOut) annotation (Line(
              points={{-38.4,70},{-62,70},{-62,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(righInternalMammary.cOut, cOut) annotation (Line(points={
                  {-76.4,56},{-82,56},{-82,6},{-86,6},{-86,0},{80,0}},
                smooth=Smooth.None));
          connect(rightVertebral.cOut, cOut) annotation (Line(
              points={{-76.4,60},{-82,60},{-82,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftVertebral.cOut, cOut) annotation (Line(points={{-44.4,
                  58},{-64,58},{-64,12},{-82,12},{-82,6},{-86,6},{-86,0},{
                  80,0}}, smooth=Smooth.None));
          connect(leftInternalMammary.cOut, cOut) annotation (Line(points={
                  {-44.4,60},{-64,60},{-64,10},{-82,10},{-82,6},{-86,6},{-86,
                  0},{80,0}}, smooth=Smooth.None));
          connect(rightSuperiorThyroid.cOut, cOut) annotation (Line(
              points={{-66.4,74},{-78,74},{-78,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightOpthalmic.cOut, cOut) annotation (Line(
              points={{-72.4,74},{-82,74},{-82,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightCerebral.cOut, cOut) annotation (Line(
              points={{-72.4,76},{-82,76},{-82,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightMiddleCerebral.cOut, cOut) annotation (Line(
              points={{-72.4,78},{-82,78},{-82,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightFacial.cOut, cOut) annotation (Line(
              points={{-66.4,80},{-78,80},{-78,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightLingual.cOut, cOut) annotation (Line(
              points={{-66.4,82},{-78,82},{-78,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightMaxilliary.cOut, cOut) annotation (Line(
              points={{-66.4,88},{-78,88},{-78,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(rightSuperficialTemporal.cOut, cOut) annotation (Line(
              points={{-64.4,90},{-78,90},{-78,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftSuperiorThyroid.cOut, cOut) annotation (Line(
              points={{-50.4,74},{-70,74},{-70,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftCerebral.cOut, cOut) annotation (Line(
              points={{-56.4,76},{-74,76},{-74,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftMiddleCerebral.cOut, cOut) annotation (Line(
              points={{-56.4,74},{-74,74},{-74,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftOpthalmic.cOut, cOut) annotation (Line(
              points={{-56.4,78},{-74,78},{-74,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftLingual.cOut, cOut) annotation (Line(
              points={{-50.4,80},{-70,80},{-70,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftFacial.cOut, cOut) annotation (Line(
              points={{-50.4,82},{-70,82},{-70,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftMaxilliary.cOut, cOut) annotation (Line(
              points={{-50.4,88},{-70,88},{-70,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(leftSuperficialTemporal.cOut, cOut) annotation (Line(
              points={{-48.4,90},{-70,90},{-70,0},{80,0}},
              color={0,0,0},
              smooth=Smooth.None));

          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics), Icon(graphics=
                 {Text(       extent={{-62,44},{46,24}},
                  lineColor={0,128,0},
                  lineThickness=1,
                  fillColor={255,0,0},
                  fillPattern=FillPattern.Solid,
                  textStyle={TextStyle.Bold},
                  textString="Derived Tree")}));
        end ComplexTree_Derived;
      end SystemicArteries;

      package ECMO "ECMO device and its components"
        model ECMO "ECMO circuit including cannulas"
          extends Cardiovascular.Icons.ECMO;
          extends Auxiliary.BlockKinds.Port;
          import Cardiovascular.Model.Complex.Components.Auxiliary.RLC.Tubes.*;
          import Cardiovascular.Model.Complex.Environment.*;
          import Cardiovascular.Types.*;
          import Physiolibrary.Hydraulic.Components.IdealValve;
          import Physiolibrary.Types.*;

          outer Environment.ComplexEnvironment settings
            "Everything is out there";

          parameter Boolean isEnabled=true "Whether ECMO is enabled";
          parameter Cardiovascular.Types.PulseShape pulseShapeRef=PulseShape.pulseless
            "Reference pulse shape (or non-pulsatile)";
          parameter VolumeFlowRate qMeanRef=1 "Reference mean flow";
          parameter Time pulseStartTime=settings.supports.ECMO_pulseStartTime
            "Time delay behind the start of cardiac cycle";

          input Time pulseDuration=cycleDuration
            "Duration of pulse if using pulsatile ECMO";
          input Time cycleDuration "Duration of cardiac cycle";

          VolumeFlowRate qRef "Reference flow wave";
          Time t(start=-pulseStartTime)
            "Time with respect to the cardiac cycle, offset included";

        protected
          parameter Boolean _isEnabled=isEnabled and qMeanRef > 0
            "Whether the ECMO is really enabled - setting mean flow to zero while having ECMO connected is not desired as in reality";

          VolumeFlowRate qPeak "Peak flow in the parabolic pulse";
          Time tPeak=pulseDuration/2 "Time of peak of the parabolic pulse";
          Real scale "Parabola scaling coefficient";

        public
          Pump ecmoPump(qRef=qRef) if _isEnabled annotation (Placement(
                transformation(extent={{-44,-16},{-8,16}})));
          Oxygenator ecmoOxygenator(
            fiberCount=80000,
            fiberLength=0.15,
            fiberDiameter(displayUnit="mm") = 0.0002,
            fiberThickness(displayUnit="mm") = 5e-05) if _isEnabled
            annotation (Placement(transformation(extent={{6,-20},{50,22}})));
          TubeR inflowTube(l=0.5, r=0.005) if _isEnabled annotation (
              Placement(transformation(
                extent={{-20.0263,-9.02613},{20.0263,9.02613}},
                rotation=-60,
                origin={-47.83,22.8302})));
          TubeR middleTube(l=0.2, r=0.005) if _isEnabled annotation (
              Placement(transformation(extent={{-10,-10},{42,12}})));
          TubeR outflowTube(l=0.5, r=0.005) if _isEnabled annotation (
              Placement(transformation(
                extent={{-12.6602,-11.7321},{12.6602,11.7321}},
                rotation=60,
                origin={56.1699,28.8301})));
          IdealValve vInflow(_Goff=0, Pknee=0) if _isEnabled annotation (
              Placement(transformation(
                extent={{-6.59806,-8.23202},{6.59806,8.23202}},
                rotation=60,
                origin={-73.8301,21.8301})));
          IdealValve vOutflow(_Goff=0, Pknee=0) if _isEnabled annotation (
              Placement(transformation(
                extent={{-5.63393,-8.09807},{5.63393,8.09807}},
                rotation=-60,
                origin={78.1699,18.8301})));
          TubeR venousCannula(l=settings.supports.ECMO_cannulaLength, r=
                settings.supports.ECMO_cannulaInnerDiameter/2) if
            _isEnabled annotation (Placement(transformation(
                extent={{-6.23204,-6.86599},{6.23204,6.86599}},
                rotation=60,
                origin={-65.1699,35.1699})));
          TubeR arterialCannula(l=settings.supports.ECMO_cannulaLength, r=
                settings.supports.ECMO_cannulaInnerDiameter/2) if
            _isEnabled annotation (Placement(transformation(
                extent={{-6.99997,-8.4641},{6.99997,8.4641}},
                rotation=-60,
                origin={68.8301,30.1699})));

        equation
          if pulseShapeRef == PulseShape.pulseless then
            qRef = qMeanRef;
          elseif pulseShapeRef == PulseShape.square then
            qRef = if t >= 0 and t <= pulseDuration then qMeanRef*
              cycleDuration/pulseDuration else 0;
          elseif pulseShapeRef == PulseShape.parabolic then
            qRef = max(0, qPeak - ((t - tPeak)^2*scale));
          else
            qRef = 0;
          end if;

          scale*tPeak^2 = qPeak;
          2*(qPeak*tPeak - scale*tPeak^3/3)/cycleDuration = qMeanRef;

          if not _isEnabled then
            cIn.q = -cOut.q;
            cIn.q = 0;
          end if;

          der(t) = 1;
          when t >= cycleDuration then
            reinit(t, t - cycleDuration);
          end when;

          connect(cOut, vOutflow.q_out) annotation (Line(
              points={{80,0},{68,0},{68,6},{68,10},{80,10},{80,14},{80,
                  13.951},{80.9869,13.951}},
              color={255,0,0},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(cIn, vInflow.q_in) annotation (Line(
              points={{-80,0},{-66,0},{-66,10},{-77.1291,10},{-77.1291,
                  16.116}},
              color={127,5,60},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(inflowTube.cOut, ecmoPump.cIn) annotation (Line(
              points={{-39.8195,8.95557},{-46,8.95557},{-46,20},{-46,0},{-40.4,
                  0}},
              color={127,5,60},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(middleTube.cIn, ecmoPump.cOut) annotation (Line(
              points={{-4.8,1},{-10,1},{-10,0},{-11.6,0}},
              color={127,5,60},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(middleTube.cOut, ecmoOxygenator.cIn) annotation (Line(
              points={{36.8,1},{36.8,1},{10.4,1}},
              color={127,5,60},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(ecmoOxygenator.cOut, outflowTube.cIn) annotation (Line(
              points={{45.6,1},{45.6,2},{46,2},{46,2},{46,2},{52,2},{52,
                  20.0589},{51.1058,20.0589}},
              color={255,0,0},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(vInflow.q_out, venousCannula.cIn) annotation (Line(
              points={{-70.5311,27.5442},{-67.6627,27.5442},{-67.6627,
                  30.8522}},
              color={127,5,60},
              thickness=1,
              smooth=Smooth.Bezier));
          connect(inflowTube.cIn, venousCannula.cOut) annotation (Line(
              points={{-55.8405,36.7048},{-55.8405,39.4876},{-62.6771,
                  39.4876}},
              color={127,5,60},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(outflowTube.cOut, arterialCannula.cIn) annotation (Line(
              points={{61.234,37.6013},{66,37.6013},{66,34},{66.0301,34},{
                  66.0301,35.0196}},
              color={255,0,0},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(vOutflow.q_in, arterialCannula.cOut) annotation (Line(
              points={{75.3529,23.7092},{72,23.7092},{72,25.3202},{71.6301,
                  25.3202}},
              color={255,0,0},
              thickness=1,
              smooth=Smooth.Bezier));

          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics), Icon(
                coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                    {100,100}})));
        end ECMO;

        model Pump
          "ECMO pump with pressure control according to flow feedback and reference flow"
          extends Cardiovascular.Icons.Screw;
          extends Auxiliary.BlockKinds.Port;
          import Cardiovascular.Model.Complex.Environment.*;
          import Physiolibrary.Types.*;

          outer Environment.ComplexEnvironment settings
            "Everything is out there";

          input VolumeFlowRate qRef "Reference flow wave";
          Real B=qRef;
          Pressure p "Pressure exerted by the pump";
          parameter VolumeFlowRate qRef2;
        equation
          cIn.q = -cOut.q;
          dp = -p;
          der(p) = (qRef2 - cIn.q)*settings.constants.ecmoPumpPressureAdaptationRate;

          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}}), graphics), Icon(
                coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
                    {100,100}})));
        end Pump;

        model Oxygenator "Resistive hollow-fiber oxygenator"
          extends Physiolibrary.Icons.PerfusionDO;
          extends Cardiovascular.Icons.O2;
          extends Auxiliary.BlockKinds.Port;
          import Cardiovascular.Model.Complex.Components.Auxiliary.RLC.*;
          import Cardiovascular.Constants.*;
          import Cardiovascular.Types.*;
          import Modelica.Constants.*;
          import Physiolibrary.Types.*;

          parameter Real fiberCount "Number of fibers";
          parameter Cardiovascular.Types.Length fiberLength
            "Length of each fiber";
          parameter Cardiovascular.Types.Length fiberDiameter "Fiber diameter";
          parameter Cardiovascular.Types.Length fiberThickness
            "Fiber thickness";

          Elements.R resistor(R=8*mu*fiberLength/pi/(0.5*fiberDiameter)^4/
                fiberCount) annotation (Placement(transformation(extent={{-10,
                    -10},{10,10}})));

        equation
          connect(cIn, resistor.cIn) annotation (Line(
              points={{-80,0},{-8,0}},
              color={0,0,255},
              smooth=Smooth.None));
          connect(cOut, resistor.cOut) annotation (Line(
              points={{80,0},{8,0}},
              color={0,0,255},
              smooth=Smooth.None));

          annotation (Diagram(graphics), Icon(coordinateSystem(
                  preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
        end Oxygenator;

        model ECMO_bare "ECMO circuit including cannulas"
          extends Cardiovascular.Icons.ECMO;
          extends Auxiliary.BlockKinds.Port;
          import Cardiovascular.Model.Complex.Components.Auxiliary.RLC.Tubes.*;
          import Cardiovascular.Model.Complex.Environment.*;
          import Cardiovascular.Types.*;
          import Physiolibrary.Hydraulic.Components.IdealValve;
          import Physiolibrary.Types.*;

          outer Environment.ComplexEnvironment settings
            "Everything is out there";

          parameter Boolean isEnabled=true "Whether ECMO is enabled";
          parameter Cardiovascular.Types.PulseShape pulseShapeRef=PulseShape.pulseless
            "Reference pulse shape (or non-pulsatile)";
          parameter VolumeFlowRate qMeanRef=1 "Reference mean flow";
          parameter Time pulseStartTime=settings.supports.ECMO_pulseStartTime
            "Time delay behind the start of cardiac cycle";

          input Time pulseDuration=cycleDuration
            "Duration of pulse if using pulsatile ECMO";
          input Time cycleDuration "Duration of cardiac cycle";

          VolumeFlowRate qRef "Reference flow wave";
          Time t(start=-pulseStartTime)
            "Time with respect to the cardiac cycle, offset included";

        protected
          parameter Boolean _isEnabled=isEnabled and qMeanRef > 0
            "Whether the ECMO is really enabled - setting mean flow to zero while having ECMO connected is not desired as in reality";

          VolumeFlowRate qPeak "Peak flow in the parabolic pulse";
          Time tPeak=pulseDuration/2 "Time of peak of the parabolic pulse";
          Real scale "Parabola scaling coefficient";

        public
          Pump ecmoPump(qRef=qRef) if _isEnabled annotation (Placement(
                transformation(extent={{-44,-16},{-8,16}})));
          Oxygenator ecmoOxygenator(
            fiberCount=80000,
            fiberLength=0.15,
            fiberDiameter(displayUnit="mm") = 0.0002,
            fiberThickness(displayUnit="mm") = 5e-05) if _isEnabled
            annotation (Placement(transformation(extent={{6,-20},{50,22}})));
          TubeR inflowTube(l=0.5, r=0.005) if _isEnabled annotation (
              Placement(transformation(
                extent={{-20.0263,-9.02613},{20.0263,9.02613}},
                rotation=-60,
                origin={-47.83,22.8302})));
          TubeR middleTube(l=0.2, r=0.005) if _isEnabled annotation (
              Placement(transformation(extent={{-10,-10},{42,12}})));
          TubeR outflowTube(l=0.5, r=0.005) if _isEnabled annotation (
              Placement(transformation(
                extent={{-12.6602,-11.7321},{12.6602,11.7321}},
                rotation=60,
                origin={56.1699,28.8301})));

        equation
          if pulseShapeRef == PulseShape.pulseless then
            qRef = qMeanRef;
          elseif pulseShapeRef == PulseShape.square then
            qRef = if t >= 0 and t <= pulseDuration then qMeanRef*
              cycleDuration/pulseDuration else 0;
          elseif pulseShapeRef == PulseShape.parabolic then
            qRef = max(0, qPeak - ((t - tPeak)^2*scale));
          else
            qRef = 0;
          end if;

          scale*tPeak^2 = qPeak;
          2*(qPeak*tPeak - scale*tPeak^3/3)/cycleDuration = qMeanRef;

          if not _isEnabled then
            cIn.q = -cOut.q;
            cIn.q = 0;
          end if;

          der(t) = 1;
          when t >= cycleDuration then
            reinit(t, t - cycleDuration);
          end when;

          connect(inflowTube.cOut, ecmoPump.cIn) annotation (Line(
              points={{-39.8195,8.95557},{-46,8.95557},{-46,20},{-46,0},{
                  -40.4,0}},
              color={127,5,60},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(middleTube.cIn, ecmoPump.cOut) annotation (Line(
              points={{-4.8,1},{-10,1},{-10,0},{-11.6,0}},
              color={127,5,60},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(middleTube.cOut, ecmoOxygenator.cIn) annotation (Line(
              points={{36.8,1},{36.8,1},{10.4,1}},
              color={127,5,60},
              smooth=Smooth.Bezier,
              thickness=1));
          connect(ecmoOxygenator.cOut, outflowTube.cIn) annotation (Line(
              points={{45.6,1},{45.6,2},{46,2},{46,2},{46,2},{52,2},{52,
                  20.0589},{51.1058,20.0589}},
              color={255,0,0},
              smooth=Smooth.Bezier,
              thickness=1));

          connect(inflowTube.cIn, cIn) annotation (Line(points={{-55.8405,
                  36.7048},{-55.8405,18.3524},{-80,18.3524},{-80,0}}, color=
                 {127,0,0}));
          connect(outflowTube.cOut, cOut) annotation (Line(points={{61.234,
                  37.6013},{61.234,19.8007},{80,19.8007},{80,0}}, color={
                  229,133,64}));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
                  extent={{-100,-100},{100,100}})), Icon(coordinateSystem(
                  preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
        end ECMO_bare;
      end ECMO;
    end Main;

    model Heart
      extends Interfaces.Heart;
      import Physiolibrary.Types.*;
      replaceable Main.Heart.HeartLVCannulated
                                   heart(
        VPRef_init=settings.initialization.peri_VRef,
        pPRef=settings.initialization.peri_pRef,
        kP=settings.initialization.peri_k) constrainedby Main.Heart.Heart(
        VPRef_init=settings.initialization.peri_VRef,
        pPRef=settings.initialization.peri_pRef,
        kP=settings.initialization.peri_k)
        annotation (Placement(transformation(extent={{-48,-38},{44,74}})));

      outer Environment.ComplexEnvironment settings
        "Everything is out there...";

    //   Averager avg_LV_pEjection(
    //     redeclare type T = Pressure,
    //     signal = heart. ventricles. pLV,
    //     condition = -heart. vSA. cOut. q > 0,
    //     control = stepCycle);
    //   Averager avg_cVSA_p(
    //     redeclare type T = Pressure,
    //     signal = heart. cVSA. pressure,
    //     control = stepCycle);
    //   Averager avg_cVSA_q(
    //     redeclare type T = VolumeFlowRate,
    //     signal = -heart. cVSA. q,
    //     control = stepCycle);
    //
    //   Maxer max_pP(
    //     redeclare type T = Pressure,
    //     signal = heart. pP,
    //     control = stepCycle);

      // Averager avg_LW_sigmaAPositive(
      //   redeclare type T = Pressure,
      //   init = 1,
      //   signal = max(0, heart. ventricles. LW. sigmaA),
      //   control = stepCycle);
      // Averager avg_LW_sigmaAPositiveLsc(
      //   redeclare type T = Real,
      //   init = 1,
      //   signal = max(0, heart. ventricles. LW. sigmaA) * 1e6 * heart. ventricles. LW.Lsc,
      //   control = stepCycle);
      // Maxer max_LW_sigmaP(
      //   redeclare type T = Pressure,
      //   init = 1,
      //   signal = max(0, heart. ventricles. LW. sigmaP),
      //   control = stepCycle);
      // Averager avg_LW_sigmaAPositiveNorm(
      //   redeclare type T = Real,
      //   init = 1,
      //   signal = max(0, heart. ventricles. LW. sigmaA) * (1e6 * heart. ventricles. LW. Lsc - avg_LW_sigmaAPositiveLsc. average / avg_LW_sigmaAPositive. average) ^ 2,
      //   control = stepCycle);
      // Averager avg_SW_sigmaAPositive(
      //   redeclare type T = Pressure,
      //   init = 1,
      //   signal = max(0, heart. ventricles. SW. sigmaA),
      //   control = stepCycle);
      // Averager avg_SW_sigmaAPositiveLsc(
      //   redeclare type T = Real,
      //   init = 1,
      //   signal = max(0, heart. ventricles. SW. sigmaA) * 1e6 * heart. ventricles. SW. Lsc,
      //   control = stepCycle);
      // Maxer max_SW_sigmaP(
      //   redeclare type T = Pressure,
      //   init = 1,
      //   signal = max(0, heart. ventricles. SW. sigmaP),
      //   control = stepCycle);
      // Averager avg_SW_sigmaAPositiveNorm(
      //   redeclare type T = Real,
      //   signal = max(0, heart. ventricles. SW. sigmaA) * (1e6 * heart. ventricles. SW. Lsc - avg_SW_sigmaAPositiveLsc. average / avg_SW_sigmaAPositive. average) ^ 2,
      //   control = stepCycle);
      // Averager avg_RW_sigmaAPositive(
      //   redeclare type T = Pressure,
      //   init = 1,
      //   signal = max(0, heart. ventricles. RW. sigmaA),
      //   control = stepCycle);
      // Averager avg_RW_sigmaAPositiveLsc(
      //   redeclare type T = Real,
      //   init = 1,
      //   signal = max(0, heart. ventricles. RW. sigmaA) * 1e6 * heart. ventricles. RW. Lsc,
      //   control = stepCycle);
      // Maxer max_RW_sigmaP(
      //   redeclare type T = Pressure,
      //   init = 1,
      //   signal = max(0, heart. ventricles. RW. sigmaP),
      //   control = stepCycle);
      // Averager avg_RW_sigmaAPositiveNorm(
      //   redeclare type T = Real,
      //   signal = max(0, heart. ventricles. RW. sigmaA) * (1e6 * heart. ventricles. RW. Lsc - avg_RW_sigmaAPositiveLsc. average / avg_RW_sigmaAPositive. average) ^ 2,
      //   control = stepCycle);
      // Averager avg_LA_sigmaAPositive(
      //   redeclare type T = Pressure,
      //   init = 1,
      //   signal = max(0, heart. LA. sigmaA),
      //   control = stepCycle);
      // Averager avg_LA_sigmaAPositiveLsc(
      //   redeclare type T = Real,
      //   init = 1,
      //   signal = max(0, heart. LA. sigmaA) * 1e6 * heart. LA. Lsc,
      //   control = stepCycle);
      // Maxer max_LA_sigmaP(
      //   redeclare type T = Pressure,
      //   init = 1,
      //   signal = max(0, heart. LA. sigmaP),
      //   control = stepCycle);
      // Averager avg_LA_sigmaAPositiveNorm(
      //   redeclare type T = Real,
      //   signal = max(0, heart. LA. sigmaA) * (1e6 * heart. LA. Lsc - avg_LA_sigmaAPositiveLsc. average / avg_LA_sigmaAPositive. average) ^ 2,
      //   control = stepCycle);
      // Averager avg_RA_sigmaAPositive(
      //   redeclare type T = Pressure,
      //   init = 1,
      //   signal = max(0, heart. RA. sigmaA),
      //   control = stepCycle);
      // Averager avg_RA_sigmaAPositiveLsc(
      //   redeclare type T = Real,
      //   init = 1,
      //   signal = max(0, heart. RA. sigmaA) * 1e6 * heart. RA. Lsc,
      //   control = stepCycle);
      // Maxer max_RA_sigmaP(
      //   redeclare type T = Pressure,
      //   init = 1,
      //   signal = max(0, heart. RA. sigmaP),
      //   control = stepCycle);
      // Averager avg_RA_sigmaAPositiveNorm(
      //   redeclare type T = Real,
      //   signal = max(0, heart. RA. sigmaA) * (1e6 * heart. RA. Lsc - avg_RA_sigmaAPositiveLsc. average / avg_RA_sigmaAPositive. average) ^ 2,
      //   control = stepCycle);

    equation
    //   V = heart. V;
      // MOVED FROM CARDIO:

      // DISABLING THE ADAPTATION
    //
    //   // Adaptation of valve diameters and dead mid-wall area of heart walls
    //   when change(stepCycle) and settings. condition. adaptValveDiameter then
    //     heart. vSA. ARef = if SA. isAdaptable then avg_SA_A. average else pre(heart. vSA. ARef);
    //     heart. vSV. ARef = avg_SV_A. average;
    //     heart. vPA. ARef = avg_PA_A. average;
    //     heart. vPV. ARef = avg_PV_A. average;
    //     heart. vLAV. ARef = 1.5 * heart. vSA. ARef;
    //     heart. vRAV. ARef = 1.5 * avg_PA_A. average;
    //     heart. ventricles. LW. Am0 = 1.5 * heart. vSA. ARef + heart. vSA. ARef;
    //     heart. ventricles. SW. Am0 = 0;
    //     heart. ventricles. RW. Am0 = 1.5 * avg_PA_A. average + avg_PA_A. average;
    //     heart. LA. Am0 = 1.5 * heart. vSA. ARef + avg_SV_A. average;
    //     heart. RA. Am0 = 1.5 * avg_PA_A. average + avg_PV_A. average;
    //   end when;

      // DISABLING THE ADAPTATION
    //   // Adaptation of correctional term for more appropriate wall geometry
    //   when change(stepCycle) and settings. condition. adaptTriSegJunction then
    //     heart. ventricles. LW. EAmRef = 0;
    //     heart. ventricles. SW. EAmRef = 5 * log(pre(heart. ventricles. LW. AmRef) * pre(heart. ventricles. RW. AmRef) / (pre(heart. ventricles. SW. AmRef) * (pre(heart. ventricles. LW. AmRef) + pre(heart. ventricles. RW. AmRef))));
    //     heart. ventricles. RW. EAmRef = 0;
    //   end when;

        // DISABLING THE ADAPTATION

    //   // Adaptation of wall volumes of heart walls
    //   when change(stepCycle) and settings. condition. adaptChamberWVolume then
    //     heart. ventricles. LW. VW = pre(heart. ventricles. LW. VW) * exp(0.3957 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_LW_sigmaAPositiveNorm. average / avg_LW_sigmaAPositive. average))) / 0.5))) - 0.3066 * log(exp(0.5 * tanh(log(settings. constants. ventricleSigmaPAdapt * exp(-heart. ventricles. LW. EAmRef) / pre(max_LW_sigmaP. maximum)) / 0.5))) - 0.235 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_LW_sigmaAPositiveLsc. average / avg_LW_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
    //     heart. ventricles. SW. VW = pre(heart. ventricles. SW. VW) * exp(0.3957 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_SW_sigmaAPositiveNorm. average / avg_SW_sigmaAPositive. average))) / 0.5))) - 0.3066 * log(exp(0.5 * tanh(log(settings. constants. ventricleSigmaPAdapt * exp(-heart. ventricles. SW. EAmRef) / pre(max_SW_sigmaP. maximum)) / 0.5))) - 0.235 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_SW_sigmaAPositiveLsc. average / avg_SW_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
    //     heart. ventricles. RW. VW = pre(heart. ventricles. RW. VW) * exp(0.3957 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_RW_sigmaAPositiveNorm. average / avg_RW_sigmaAPositive. average))) / 0.5))) - 0.3066 * log(exp(0.5 * tanh(log(settings. constants. ventricleSigmaPAdapt * exp(-heart. ventricles. RW. EAmRef) / pre(max_RW_sigmaP. maximum)) / 0.5))) - 0.235 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_RW_sigmaAPositiveLsc. average / avg_RW_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
    //     heart. LA. VW = pre(heart. LA. VW) * exp(0.3957 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_LA_sigmaAPositiveNorm. average / avg_LA_sigmaAPositive. average))) / 0.5))) - 0.3066 * log(exp(0.5 * tanh(log(settings. constants. atriumSigmaPAdapt / pre(max_LA_sigmaP. maximum)) / 0.5))) - 0.235 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_LA_sigmaAPositiveLsc. average / avg_LA_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
    //     heart. RA. VW = pre(heart. RA. VW) * exp(0.3957 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_RA_sigmaAPositiveNorm. average / avg_RA_sigmaAPositive. average))) / 0.5))) - 0.3066 * log(exp(0.5 * tanh(log(settings. constants. atriumSigmaPAdapt / pre(max_RA_sigmaP. maximum)) / 0.5))) - 0.235 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_RA_sigmaAPositiveLsc. average / avg_RA_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
    //   end when;
    //
    //   // Adaptation of reference cross-sectional area of heart walls
    //   when change(stepCycle) and settings. condition. adaptChamberWArea then
    //     heart. ventricles. LW. AmRef = pre(heart. ventricles. LW. AmRef) * exp(-0.4571 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_LW_sigmaAPositiveNorm. average / avg_LW_sigmaAPositive. average))) / 0.5))) - 0.0433 * log(exp(0.5 * tanh(log(settings. constants. ventricleSigmaPAdapt * exp(-heart. ventricles. LW. EAmRef) / pre(max_LW_sigmaP. maximum)) / 0.5))) + 1.3028 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_LW_sigmaAPositiveLsc. average / avg_LW_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
    //     heart. ventricles. SW. AmRef = pre(heart. ventricles. SW. AmRef) * exp(-0.4571 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_SW_sigmaAPositiveNorm. average / avg_SW_sigmaAPositive. average))) / 0.5))) - 0.0433 * log(exp(0.5 * tanh(log(settings. constants. ventricleSigmaPAdapt * exp(-heart. ventricles. SW. EAmRef) / pre(max_SW_sigmaP. maximum)) / 0.5))) + 1.3028 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_SW_sigmaAPositiveLsc. average / avg_SW_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
    //     heart. ventricles. RW. AmRef = pre(heart. ventricles. RW. AmRef) * exp(-0.4571 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_RW_sigmaAPositiveNorm. average / avg_RW_sigmaAPositive. average))) / 0.5))) - 0.0433 * log(exp(0.5 * tanh(log(settings. constants. ventricleSigmaPAdapt * exp(-heart. ventricles. RW. EAmRef) / pre(max_RW_sigmaP. maximum)) / 0.5))) + 1.3028 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_RW_sigmaAPositiveLsc. average / avg_RW_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
    //     heart. LA. AmRef = pre(heart. LA. AmRef) * exp(-0.4571 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_LA_sigmaAPositiveNorm. average / avg_LA_sigmaAPositive. average))) / 0.5))) - 0.0433 * log(exp(0.5 * tanh(log(settings. constants. atriumSigmaPAdapt / pre(max_LA_sigmaP. maximum)) / 0.5))) + 1.3028 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_LA_sigmaAPositiveLsc. average / avg_LA_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
    //     heart. RA. AmRef = pre(heart. RA. AmRef) * exp(-0.4571 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_RA_sigmaAPositiveNorm. average / avg_RA_sigmaAPositive. average))) / 0.5))) - 0.0433 * log(exp(0.5 * tanh(log(settings. constants. atriumSigmaPAdapt / pre(max_RA_sigmaP. maximum)) / 0.5))) + 1.3028 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_RA_sigmaAPositiveLsc. average / avg_RA_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
    //   end when;
    //
    //   // Adaptation of reference passive myofiber stress of heart walls
    //   when change(stepCycle) and settings. condition. adaptChamberEcmStress then
    //     heart. ventricles. LW. sigmaPRef = pre(heart. ventricles. LW. sigmaPRef) * exp(-0.3338 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_LW_sigmaAPositiveNorm. average / avg_LW_sigmaAPositive. average))) / 0.5))) + 0.2091 * log(exp(0.5 * tanh(log(settings. constants. ventricleSigmaPAdapt * exp(-heart. ventricles. LW. EAmRef) / pre(max_LW_sigmaP. maximum)) / 0.5))) - 1.3101 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_LW_sigmaAPositiveLsc. average / avg_LW_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
    //     heart. ventricles. SW. sigmaPRef = pre(heart. ventricles. SW. sigmaPRef) * exp(-0.3338 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_SW_sigmaAPositiveNorm. average / avg_SW_sigmaAPositive. average))) / 0.5))) + 0.2091 * log(exp(0.5 * tanh(log(settings. constants. ventricleSigmaPAdapt * exp(-heart. ventricles. SW. EAmRef) / pre(max_SW_sigmaP. maximum)) / 0.5))) - 1.3101 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_SW_sigmaAPositiveLsc. average / avg_SW_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
    //     heart. ventricles. RW. sigmaPRef = pre(heart. ventricles. RW. sigmaPRef) * exp(-0.3338 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_RW_sigmaAPositiveNorm. average / avg_RW_sigmaAPositive. average))) / 0.5))) + 0.2091 * log(exp(0.5 * tanh(log(settings. constants. ventricleSigmaPAdapt * exp(-heart. ventricles. RW. EAmRef) / pre(max_RW_sigmaP. maximum)) / 0.5))) - 1.3101 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_RW_sigmaAPositiveLsc. average / avg_RW_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
    //     heart. LA. sigmaPRef = pre(heart. LA. sigmaPRef) * exp(-0.3338 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_LA_sigmaAPositiveNorm. average / avg_LA_sigmaAPositive. average))) / 0.5))) + 0.2091 * log(exp(0.5 * tanh(log(settings. constants. atriumSigmaPAdapt / pre(max_LA_sigmaP. maximum)) / 0.5))) - 1.3101 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_LA_sigmaAPositiveLsc. average / avg_LA_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
    //     heart. RA. sigmaPRef = pre(heart. RA. sigmaPRef) * exp(-0.3338 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt) / (3 * sqrt(avg_RA_sigmaAPositiveNorm. average / avg_RA_sigmaAPositive. average))) / 0.5))) + 0.2091 * log(exp(0.5 * tanh(log(settings. constants. atriumSigmaPAdapt / pre(max_RA_sigmaP. maximum)) / 0.5))) - 1.3101 * log(exp(0.5 * tanh(log(1e6 * (settings. constants. LsMinAdapt + 0.6 * (settings. constants. LsMaxAdapt - settings. constants. LsMinAdapt)) / (avg_RA_sigmaAPositiveLsc. average / avg_RA_sigmaAPositive. average)) / 0.5)))) ^ 0.5;
    //   end when;
    //
    //   // Adaptation of reference volume of pericardium
    //   when change(stepCycle) and settings. condition. adaptPericardium then
    //     heart. VPRef = pre(heart. VPRef) / ((heart. pPRef / pre(max_pP. maximum)) ^ (0.3 / heart. kP));
    //   end when;

      connect(rightHeartInflow, heart.cVSV) annotation (Line(
          points={{-100,40},{-64,40},{-64,38},{-21.32,38},{-21.32,31.44}},
          color={0,0,0},
          thickness=1));
      connect(leftHeartOutflow, heart.cVSA) annotation (Line(
          points={{-100,-20},{-56,-20},{-13.04,-20},{-13.04,40.4}},
          color={0,0,0},
          thickness=1));
      connect(leftHeartInflow, heart.cVPV) annotation (Line(
          points={{100,-20},{60,-20},{12.72,-20},{12.72,38.16}},
          color={0,0,0},
          thickness=1));
      connect(rightHeartOutflow, heart.cVPA) annotation (Line(
          points={{100,40},{100,40},{100,60},{0,60},{0,42.64},{-0.16,42.64}},
          color={0,0,0},
          thickness=1));

      connect(heart.LVcannula, LVCannula) annotation (Line(points={{44,
              19.12},{48,19.12},{48,-68},{50,-68}}, color={229,133,64}));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}})), Icon(graphics={Text(
              extent={{-100,20},{100,100}},
              lineColor={0,0,0},
              fontName="Bauhaus 93",
              textStyle={TextStyle.Bold},
              textString="COMPLEX")}));
    end Heart;

    model Systemic
      extends Interfaces.Systemic;
        import Cardiovascular.Model.Complex.Components.Auxiliary.Analyzers.*;
      import Physiolibrary.Types.*;
      import Cardiovascular.Model.Complex.Environment.*;

      outer Environment.ComplexEnvironment settings
        "Everything is out there...";

      replaceable Main.SystemicArteries.Original_CircAdapt  SA
                  constrainedby
        Cardiovascular.Model.Complex.Components.Main.SystemicArteries.Abstraction.SystemicArteries
        "Replaceable model of systemic arteries" annotation (
          choicesAllMatching=true, Placement(transformation(
            extent={{-25.149,25.1987},{25.149,-25.1987}},
            origin={60.851,14.8013},
            rotation=180)));
      Main.Vessels.AdaptableVeins SV(
        pRef_init=settings.initialization.SV_pRef,
        ARef_init=settings.initialization.SV_ARef,
        AW_init=settings.initialization.SV_AW,
        l=settings.initialization.SV_l,
        k=settings.initialization.SV_k) annotation (Placement(
            transformation(
            extent={{-25.5,-25.5},{25.5,25.5}},
            origin={-67.5,10.5},
            rotation=180)));
      Main.Vessels.ConsumingCapillaries SC(R(start=settings.initialization.SC_R))
        annotation (Placement(transformation(
            extent={{-30,33},{30,-33}},
            rotation=180,
            origin={-8,19})));

      Averager avg_SV_pInner(
        redeclare type T = Pressure,
        signal=SV.pInner,
        control=settings.stepCycle);
      Averager avg_SA_q(
        redeclare type T = VolumeFlowRate,
        signal=SA.cIn.q,
        control=settings.stepCycle);

    //     input Volume totalVolume;

    //     Volume V_filling( start = 0);
    //
    //     Real q_filling;
    //
    //     parameter Fraction speed_factor = 5;
    //
    //     parameter Volume V_init = 270e-6;

    //   Physiolibrary.Hydraulic.Sources.UnlimitedPump volumeControl(useSolutionFlowInput = true);

    //   Physiolibrary.Hydraulic.Sources.UnlimitedPump volumeControl_(useSolutionFlowInput = true);
    //
    //
    equation
    //   der(V_filling) = q_filling;
    //   q_filling/speed_factor = V_init - V_filling;// - der(V_filling);
    //     volumeControl_.solutionFlow = q_filling;
    //     connect(volumeControl_. q_out, q_in); // Homely component -> disabling vizualization, even for connection

    //   if V_filling < V_init then
    //   else
    //     volumeControl_.solutionFlow = 0;
    //   end if;

      // Setting blood volume to currently desired value
      // It is impractible to set the contents of all small arteries in the tree in other waz
      //   volumeControl. solutionFlow = 0;

      //(settings. condition. bloodVolumeRef * settings. condition. bloodVolumeRefScale - totalVolume) / settings. constants. bloodVolumeAdaptationRate;
    //   connect(volumeControl. q_out, q_in); // Homely component -> disabling vizualization, even for connection

    //   V = SV. V + SA. V;

        //  Adaptatioin of capillary resistance
      when change(settings.stepCycle) and settings.condition.adaptCapillaryResistance then
        reinit(SC.R, (settings.condition.aortalPressureRef - avg_SV_pInner.average)
          /settings.condition.aortalFlowRef*settings.constants.systemicResistanceScale);
      end when;

      connect(SC.cOut, SV.cIn) annotation (Line(
          points={{-32,19},{-32,19},{-46.1,19},{-46.1,10.5},{-47.1,10.5}},
          color={180,56,148},
          thickness=1,
          smooth=Smooth.Bezier));
      connect(SC.pOut, SV.pInner) annotation (Line(
          points={{-19.7,0.19},{-47.5,0.19},{-47.5,13.05},{-67.5,13.05}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          thickness=1));
      connect(SC.cIn, SA.cOut) annotation (Line(
          points={{16,19},{16,22},{40.7318,22},{40.7318,14.8013}},
          color={255,0,0},
          smooth=Smooth.Bezier,
          thickness=1));
      connect(SA.pInner, SC.pIn) annotation (Line(
          points={{60.851,12.2814},{60.851,12.2814},{60.851,14},{3.7,14},{
              3.7,0.19}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          thickness=1));
      connect(q_in, SA.cIn) annotation (Line(
          points={{100,0},{100,0},{100,2},{100,14.8013},{80.9702,14.8013}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));

      connect(q_out, SV.cOut) annotation (Line(
          points={{-100,0},{-96,0},{-96,10},{-90,10},{-90,10.5},{-87.9,10.5}},
          color={0,0,0},
          thickness=1,
          smooth=Smooth.Bezier));

      connect(AortaCannulla, SA.cCannula) annotation (Line(
          points={{70,-90},{74,-90},{74,11.7775},{75.9404,11.7775}},
          color={0,0,0},
          thickness=1));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics={Text(
              extent={{-24,42},{6,52}},
              lineColor={0,0,0},
              lineThickness=1,
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid,
              textStyle={TextStyle.Bold},
                      textString="Systemic Circuit")}), Icon(graphics={Text(
              extent={{-100,20},{100,100}},
              lineColor={0,0,0},
              fontName="Bauhaus 93",
              textStyle={TextStyle.Bold},
              textString="COMPLEX"), Polygon(
              points={{52,4},{52,-24},{64,-92},{66,-84},{56,-22},{52,4}},
              lineColor={28,108,200},
              fillColor={28,108,200},
              fillPattern=FillPattern.Solid)}));
    end Systemic;

    model Pulmonary
      extends Interfaces.Pulmonary;
      import Cardiovascular.Model.Complex.Components.Auxiliary.Analyzers.*;
      import Physiolibrary.Types.*;
      import Cardiovascular.Model.Complex.Environment.*;

      outer Environment.ComplexEnvironment settings
        "Everything is out there...";

      Main.Vessels.AdaptableArteries PA(
        pRef_init=settings.initialization.PA_pRef,
        ARef_init=settings.initialization.PA_ARef,
        AW_init=settings.initialization.PA_AW,
        l=settings.initialization.PA_l,
        k=settings.initialization.PA_k) annotation (Placement(
            transformation(extent={{-17.2253,-19.9627},{17.2253,19.9627}},
            origin={-67.3498,0.6412})));
      Main.Vessels.AdaptableVeins PV(
        pRef_init=settings.initialization.PV_pRef,
        ARef_init=settings.initialization.PV_ARef,
        AW_init=settings.initialization.PV_AW,
        l=settings.initialization.PV_l,
        k=settings.initialization.PV_k) annotation (Placement(
            transformation(
            extent={{19.5906,23.336},{-19.5906,-23.336}},
            origin={61.2282,1.6095},
            rotation=180)));
      Main.Vessels.OxygenatingCapillaries PC(R(start=settings.initialization.PC_R),
          nonlinearity=settings.condition.pulmonaryPressureDropRef/PC.dp)
        annotation (Placement(transformation(extent={{-28,-16},{6,14}})));

    protected
        Averager avg_PC_q(
        redeclare type T = VolumeFlowRate,
        signal=PC.cIn.q,
        control=settings.stepCycle);

        Averager avg_PC_dp(
        redeclare type T = Pressure,
        signal=PC.dp,
        control=settings.stepCycle);

      Averager avg_PA_q(
        redeclare type T = VolumeFlowRate,
        signal=PA.cIn.q,
        control=settings.stepCycle);
      Averager avg_PV_q(
        redeclare type T = VolumeFlowRate,
        signal=PV.cIn.q,
        control=settings.stepCycle);
    equation

    //   V = PV. V + PA. V;

        //  Adaptatioin of capillary resistance
      when change(settings.stepCycle) and settings.condition.adaptCapillaryResistance then
        reinit(PC.R_R, settings.condition.pulmonaryPressureDropRef/avg_PC_q.average);
      end when;

      connect(PA.cOut, PC.cIn) annotation (Line(
          points={{-53.5696,0.6412},{-53.5696,-1},{-24.6,-1}},
          color={102,6,44},
          smooth=Smooth.Bezier,
          thickness=1));
      connect(PC.cOut, PV.cIn) annotation (Line(
          points={{2.6,-1},{45.5557,-1},{45.5557,1.6095}},
          color={255,0,0},
          smooth=Smooth.Bezier,
          thickness=1));
      connect(PA.pInner, PC.pIn) annotation (Line(
          points={{-67.3498,-1.35507},{-67.3498,-17.3551},{-42,-17.3551},{-42,
              -9.55},{-17.63,-9.55}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          thickness=0.5));
      connect(PC.pOut, PV.pInner) annotation (Line(
          points={{-4.37,-9.55},{-4.37,-8},{-4,-8},{28,-8},{28,-18},{46,-18},
              {46,-0.7241},{61.2282,-0.7241}},
          color={0,0,127},
          smooth=Smooth.Bezier,
          thickness=0.5));
      connect(q_in, PA.cIn) annotation (Line(
          points={{-100,0},{-90,0},{-90,0.6412},{-81.13,0.6412}},
          color={0,0,0},
          thickness=1));
      connect(q_out, PV.cOut) annotation (Line(
          points={{100,0},{90,0},{90,1.6095},{76.9007,1.6095}},
          color={0,0,0},
          thickness=1));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false,
              extent={{-100,-100},{100,100}}), graphics={Text(
              extent={{-26,8},{4,18}},
              lineColor={0,0,0},
              lineThickness=1,
              fillColor={255,0,0},
              fillPattern=FillPattern.Solid,
              textString="Pulmonary Circuit",
                      textStyle={TextStyle.Bold})}), Icon(graphics={Text(
              extent={{-100,20},{100,100}},
              lineColor={0,0,0},
              fontName="Bauhaus 93",
              textStyle={TextStyle.Bold},
              textString="COMPLEX")}));
    end Pulmonary;

    model HeartCannulated
      extends Heart(redeclare Main.Heart.HeartLVCannulated heart);
    end HeartCannulated;
  end Components;

  model Cardio
    extends Cardiovascular.System(
      redeclare Components.Pulmonary pulmonaryCirculation,
      redeclare Components.Heart heart,
      redeclare Components.Systemic systemicCirculation(redeclare
          Components.Main.SystemicArteries.Original_CircAdapt SA));
      extends Cardiovascular.Icons.Runnable_System;
    import Cardiovascular.Model.Complex.Components.Auxiliary.Analyzers.*;
    import Cardiovascular.Constants.*;
    import Cardiovascular.Types.*;
    import Physiolibrary.Hydraulic.Sources.*;
    import Physiolibrary.Types.*;

    inner Environment.ComplexEnvironment settings(
      redeclare Environment.Supports.No supports,
      redeclare Environment.Conditions.Rest_MinimalAdapt condition,
      redeclare Environment.Initialization.PhysiologicalAdapted
        initialization,
      redeclare Environment.ModelConstants.Standard constants)
      annotation (Placement(transformation(extent={{-22,26},{-6,40}})));

  // protected
  //   Averager avg_V(
  //     redeclare type T = Volume,
  //     signal = V,
  //     control = settings. stepCycle);

    Components.Main.ECMO.ECMO ecmo(
      cycleDuration=settings.supports.ECMO_cycleDuration,
      pulseDuration=settings.supports.ECMO_pulseDuration,
      pulseShapeRef=settings.supports.ECMO_pulseShapeRef,
      qMeanRef=settings.supports.ECMO_qMeanRef,
      isEnabled=settings.supports.ECMO_isEnabled)
      annotation (Placement(transformation(extent={{-12,-72},{12,-48}})));
  equation
    connect(systemicCirculation.q_out, heart.rightHeartInflow) annotation (
        Line(
        points={{-10,-26},{-14,-26},{-14,-1.6},{-9.84,-1.6}},
        color={0,0,0},
        thickness=1));
    connect(systemicCirculation.q_out, ecmo.cIn) annotation (Line(
        points={{-10,-26},{-14,-26},{-14,-60},{-9.6,-60}},
        color={0,0,0},
        thickness=1));
    connect(systemicCirculation.AortaCannulla, ecmo.cOut) annotation (Line(
        points={{7,-35},{14,-35},{14,-60},{9.6,-60}},
        color={0,0,0},
        thickness=1));
    annotation (
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-20,-80},{
              20,40}})),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-20,-80},
              {20,40}})),
      experiment(
        StartTime=400,
        StopTime=415,
        Tolerance=1e-006,
        __Dymola_Algorithm="Sdirk34hw"));
  end Cardio;
  annotation (Documentation(info="<html>
<p>Complex combined model, as presented in [1], made compatible with the simple models.</p>
<p><br><span style=\"font-family: Times New Roman; font-size: 10pt;\"><a name=\"docs-internal-guid-c7f7882d-1492-9270-5abc-b09ff77c8742\">[</a><span style=\"background-color: #000000;\">1]	<a href=\"http://paperpile.com/b/74sbye/FfEpD\">Kaleck&yacute; K. Relationship of heart&rsquo;s pumping function and pressure-flow patterns in reduced arterial tree. Czech Technical Unversity; 2015.</a> Available at </span>https://dspace.cvut.cz/bitstream/handle/10467/61792/F3-DP-2015-Kalecky-Karel-Karel&percnt;20Kalecky&percnt;20-&percnt;20Relationship&percnt;20of&percnt;20Heart&percnt;27s&percnt;20Pumping&percnt;20Function&percnt;20and&percnt;20Pressure-Flow&percnt;20Patterns&percnt;20in&percnt;20Reduced&percnt;20Arterial&percnt;20Tree&percnt;20&percnt;282015&percnt;29.pdf</p>
</html>"));
end Complex;
