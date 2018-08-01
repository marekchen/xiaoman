import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ShowCase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text("SpinKit", style: TextStyle(fontSize: 24.0)),
      ),
      body: SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 32.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitRotatingCircle(color: Colors.green),
                SpinKitRotatingPlain(color: Colors.green),
                SpinKitChasingDots(color: Colors.green),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitPumpingHeart(color: Colors.green),
                SpinKitPulse(color: Colors.green),
                SpinKitDoubleBounce(color: Colors.green),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitWave(color: Colors.green, type: SpinKitWaveType.start),
                SpinKitWave(color: Colors.green, type: SpinKitWaveType.center),
                SpinKitWave(color: Colors.green, type: SpinKitWaveType.end),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitThreeBounce(color: Colors.green),
                SpinKitWanderingCubes(color: Colors.green),
                SpinKitWanderingCubes(
                    color: Colors.green, shape: BoxShape.circle),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitCircle(color: Colors.green),
                SpinKitFadingFour(color: Colors.green),
                SpinKitFadingFour(
                    color: Colors.green, shape: BoxShape.rectangle),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitFadingCube(color: Colors.green),
                SpinKitCubeGrid(size: 51.0, color: Colors.green),
                SpinKitFoldingCube(color: Colors.green),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitRing(color: Colors.green),
                SpinKitDualRing(color: Colors.green),
                SpinKitRipple(color: Colors.green),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitFadingGrid(color: Colors.green),
                SpinKitFadingGrid(
                    color: Colors.green, shape: BoxShape.rectangle),
                SpinKitHourGlass(color: Colors.green),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitSpinningCircle(color: Colors.green),
                SpinKitSpinningCircle(
                    color: Colors.green, shape: BoxShape.rectangle),
                SpinKitFadingCircle(color: Colors.green),
              ],
            ),
            const SizedBox(height: 64.0),
          ],
        ),
      ),
    );
  }
}
