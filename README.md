<p align="center">
  <img 
    src="https://github.com/user-attachments/assets/b209f12f-13b3-46ba-ac99-6ca8596544e8"
    alt="Volca Popocatépetl Risk Logo" 
    width="700"
  />
</p>

A MATLAB simulation project that models volcanic projectile trajectories from Popocatépetl using basic projectile-motion physics and a visual approximation of the volcano profile.

The program allows the user to simulate different launch scenarios, visualize projectile paths, and compare how initial velocity, launch angle, and target distance affect the resulting trajectory.

Repository: https://github.com/iiRoy/Volca-Popocatepetl-Risk

---

## Overview

**Volca Popocatépetl Risk** is an interactive MATLAB program that uses a menu-based interface to simulate projectile motion from the Popocatépetl volcano.

The simulation includes three main cases:

1. **Predefined trajectories**
   - Maximum range trajectory
   - Typical trajectory
   - Short-distance trajectory

2. **Custom distance simulation**
   - The user enters a target distance.
   - The program estimates the initial velocity needed to reach that distance.

3. **Custom velocity and angle simulation**
   - The user enters an initial velocity and launch angle.
   - The program plots the resulting trajectory.

The project combines mathematical modeling, user input validation, plotting, image handling, and animation.

> [!NOTE]
> This project was designed as an educational MATLAB simulation. It demonstrates programming logic, projectile motion, plotting, and basic animation.

---

## Features

- Interactive MATLAB menu.
- Projectile motion simulation.
- Three different simulation modes.
- Custom input for distance, velocity, and angle.
- Visual representation of the volcano.
- Animated projectile trajectory.
- Basic validation for user inputs.
- Uses images as plot backgrounds.
- Graphs altitude versus horizontal distance.
- Compares multiple launch conditions.

---

## Project Structure

```text
Volca-Popocatepetl-Risk/
│
├── Volca.m
├── Preview
    ├── volcano.png
    ├── sky.png
└── README.md
```

---

## File Description

| File | Description |
|---|---|
| `Volca.m` | Main MATLAB script containing the menu, calculations, and plotting logic. |
| `volcano.png` | Image used to visually represent the volcano in the plot. |
| `sky.png` | Background image used during trajectory animation. |
| `README.md` | Project documentation. |

> [!IMPORTANT]
> `volcano.png` and `sky.png` must be located in the folder named `Preview`. Otherwise, MATLAB will return an error when the program tries to load the images.

---

## Requirements

To run this project, you need:

- MATLAB
- Image support through `imread`
- The image files required by the script:
  - `volcano.png`
  - `sky.png`

The script uses several MATLAB functions, including:

- `plot`
- `image`
- `imread`
- `pause`
- `legend`
- `axis`
- `uistack`
- `input`
- `fprintf`
- `clear all`
- `clc`

> [!TIP]
> For the best experience, run the project directly from the MATLAB editor with the project folder selected as the current working directory.

---

## Installation

Clone the repository:

```bash
git clone https://github.com/iiRoy/Volca-Popocatepetl-Risk.git
```

Open the project folder in MATLAB.

Make sure the following files are in the same directory:

```text
Volca.m
volcano.png
sky.png
```

Run the script from MATLAB:

```matlab
Volca
```

You can also open `Volca.m` in the MATLAB editor and press **Run**.

---

## How to Use

When the program starts, it displays a title screen and waits for the user to continue.

After that, the main menu appears:

```text
1. Caso 1.
2. Caso 2.
3. Caso 3.
0. Salir.
```

Enter the number of the option you want to run.

To exit the program, enter:

```text
0
```

> [!NOTE]
> The interface is written in Spanish because the original program was created for an academic programming exercise.

---

## Simulation Cases

### Case 1: Predefined Scenarios

Case 1 displays three predefined projectile trajectories.

| Scenario | Initial Velocity | Angle | Description |
|---|---:|---:|---|
| Maximum range | `230 m/s` | `45°` | Simulates a long-range volcanic projectile. |
| Typical shot | `150 m/s` | `30°` | Simulates a lower-angle projectile. |
| 1 km shot | `150 m/s` | `78°` | Simulates a steep projectile path. |

The trajectories are plotted over the volcano visualization and compared using a legend.

> [!TIP]
> Use this option first if you want to see how different launch angles and speeds affect projectile motion.

---

### Case 2: Custom Distance

Case 2 allows the user to enter a target distance.

The program estimates a velocity value and checks whether the value is within the accepted range.

The input validation checks that:

- The distance is at least `100 m`.
- The calculated velocity remains within the accepted range.

After validation, the program plots the projectile trajectory for the calculated velocity.

> [!WARNING]
> The velocity calculation is an approximation. The program is meant for learning and visualization, not for precise scientific prediction.

---

### Case 3: Custom Velocity and Angle

Case 3 allows the user to enter:

- Initial velocity
- Launch angle

The program validates both values before running the simulation.

| Input | Valid Range |
|---|---|
| Initial velocity | `100 m/s` to `200 m/s` |
| Launch angle | `1°` to `85°` |

After validation, the program calculates and animates the projectile trajectory.

> [!IMPORTANT]
> If the velocity or angle is outside the accepted range, the program will ask for a new value before continuing.

---

## Mathematical Model

The program uses basic projectile-motion equations.

### Projectile Height as a Function of Distance

```matlab
y2 = (tan(alfa).*x) - (0.5*g/(Vo*cos(alfa))^2)*(x.^2) + altura;
```

Where:

| Variable | Meaning |
|---|---|
| `y2` | Projectile height |
| `x` | Horizontal distance |
| `Vo` | Initial velocity |
| `alfa` | Launch angle in radians |
| `g` | Gravity, set to `9.81 m/s²` |
| `altura` | Initial altitude, set to `5426 m` |

---

### Volcano Approximation

The volcano profile is approximated using the following cosine function:

```matlab
v = altura + altura*cos(1/17460*x - 300);
```

This function was estimated using GeoGebra. It is an approximation and is not intended to be a fully accurate geographic model.

> [!CAUTION]
> The volcano profile is not based on official topographic or geological data. It is a visual approximation created for the simulation.

---

### Flight Time

The program calculates flight time using an equation based on vertical velocity, gravity, and initial height.

```matlab
t = (2*(-Vo*sin(alfa)/(-g))) + ((((Vo*sin(alfa))^2 + 2*(-altura)*(-g))^0.5) - (Vo*sin(alfa))) / g;
```

---

## Program Constants

| Constant | Value | Description |
|---|---:|---|
| `g` | `9.81` | Gravity in meters per second squared |
| `altura` | `5426` | Approximate altitude of Popocatépetl in meters |
| `Vo` | Varies | Initial velocity |
| `alfa` | Varies | Launch angle |

---

## Example Usage

### Running Case 3

Input:

```text
Escribe tu opcion: 3

Inserte su Velocidad Inicial: 150
Inserta tu ángulo: 45
```

Expected console output:

```text
Ángulo: 45°.
Tiempo: [calculated time] segundos.
Velocidad (m/s): 150
```

The program then plots the projectile trajectory.

---

## Output

The program generates a graph with:

- Horizontal distance in meters.
- Altitude in meters.
- Volcano profile.
- Animated projectile path.
- Color-coded projectile trajectories.
- Legends describing each trajectory.

Graph labels include:

```text
Longitud (m)
Altitud (m)
```

> [!NOTE]
> The animation is created by repeatedly plotting points along the projectile path.

---

## Troubleshooting

### Error: `volcano.png` not found

Make sure `volcano.png` is in the same folder as `Volca.m`.

> [!TIP]
> In MATLAB, check the current folder shown at the top of the interface. It should be the project folder.

---

### Error: `sky.png` not found

Make sure `sky.png` is in the same folder as `Volca.m`.

---

### The graph does not display correctly

Check that:

- MATLAB is running with graphics support.
- The image files are valid PNG files.
- The current MATLAB folder is the project folder.
- `Volca.m`, `volcano.png`, and `sky.png` are located in the same directory.

> [!WARNING]
> If the script is run from a different directory, MATLAB may not be able to locate the required image files.

---

### The program keeps asking for input

The program validates certain values. Make sure your input is within the accepted ranges:

| Input | Accepted Range |
|---|---|
| Velocity | `100 m/s` to `200 m/s` |
| Angle | `1°` to `85°` |
| Distance | At least `100 m` |

---

## Limitations

This project is an educational simulation and should not be used for real volcanic risk prediction.

Important limitations:

- The volcano profile is approximated with a cosine function.
- Air resistance is not considered.
- Wind direction and wind speed are not included.
- Projectile mass and shape are not considered.
- The model assumes ideal projectile motion.
- Geographic accuracy is limited.
- Real volcanic risk requires professional geophysical and hazard-analysis models.

> [!CAUTION]
> This program does not represent an official volcanic hazard model and should not be used for real-world safety, evacuation, emergency planning, or geological analysis.

---

## Possible Improvements

Future versions could include:

- More accurate topographic data.
- Real Popocatépetl elevation profiles.
- Air resistance.
- Wind simulation.
- Projectile size and density.
- Risk-zone mapping.
- GUI interface.
- Exportable simulation results.
- Better input validation.
- Modular functions instead of one long script.
- Support for multiple volcanoes.
- Improved animation performance.

---

## Educational Purpose

This project was created as a programming and physics simulation exercise.

It demonstrates:

- MATLAB scripting
- Menu-based programming
- Projectile motion
- Loops
- Conditional statements
- User input
- Graph plotting
- Basic animation
- Image handling in MATLAB

---

## Author

**Rodrigo López Guerra**  
Student ID: `A01737437`

---

## License

CC0 1.0 Universal

---

## Disclaimer

This simulation is for academic and educational purposes only.

It does not represent an official volcanic hazard model and should not be used for emergency planning, public safety decisions, geological research, or real-world Popocatépetl risk assessment.

> [!CAUTION]
> For real volcanic hazard information, always consult official geological, civil protection, and emergency management authorities.
