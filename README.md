<a href="https://developer.apple.com/documentation/uikit">
  <img src="https://img.shields.io/badge/UIKit-000000?style=for-the-badge&logo=apple&logoColor=white" alt="UIKit">
</a>
<a href="https://developer.apple.com/documentation/coredata">
  <img src="https://img.shields.io/badge/Core%20Data-424FBF?style=for-the-badge&logo=apple&logoColor=white" alt="Core Data">
</a>
<a href="https://developer.apple.com/documentation/combine">
  <img src="https://img.shields.io/badge/Combine-00E5FF?style=for-the-badge&logo=apple&logoColor=white" alt="Combine">
</a>
<a href="https://swift.org/documentation/">
  <img src="https://img.shields.io/badge/Swift-F05138?style=for-the-badge&logo=swift&logoColor=white" alt="Swift">
</a>
<a href="https://swift.org/package-manager/">
  <img src="https://img.shields.io/badge/Swift%20Package%20Manager-FF61F6?style=for-the-badge&logo=swift&logoColor=white" alt="Swift Package Manager">
</a>



# Level Up iOS App
---

## Objetivo de la App
Convertir la planificación y seguimiento de metas en una **aventura interactiva** que impulse tu crecimiento personal, creatividad y conexión social—pero ahora aprovechando al máximo el ecosistema iOS. Level Up para iOS busca:

- **Motivar a largo plazo**  
  Emplear mecánicas de juego (insignias, niveles, recompensas) combinadas con **sheet presentations** y animaciones nativas de UIKit para hacer que planear y revisar tareas sea tan entretenido como jugar.

- **Impulsar la creatividad**  
  Cada logro desbloquea elementos decorativos para tu espacio virtual (habitación gamer, jardín digital, etc.) renderizados con Core Graphics y Core Animation para un estilo minimalista y moderno.

- **Fortalecer la comunidad**  
  Implementar retos y colaboración en grupos usando Combine y CloudKit (opcional) para compartir avances y generar sana competencia o apoyo mutuo.

- **Adaptarse al usuario**  
  Incorporar análisis de productividad y sugerencias personalizadas mediante **NSDiffableDataSourceSnapshot** y patrones de diseño de MVVM con Combine, de manera que Level Up crezca contigo.

---

## Descripción del Logo
El logo de Level Up es una **moneda dorada** con un “check” en el centro. Simboliza la **recompensa tangible** por cada tarea completada, adaptado a iOS con un trazo limpio y sombreado sutil para que encaje con el estilo de iconografía de Apple.

---

## Justificación de dispositivo, SO y orientaciones

- **Dispositivo objetivo**: iPhone (iOS móvil).  
- **Versión mínima de iOS**: **iOS 14.0+**  
  - Cubre más del 90 % de los dispositivos activos.  
  - Permite aprovechar APIs modernas (UISheetPresentationController, Diffable Data Sources, context menus nativos).

- **Orientaciones soportadas**:  
  - **Retrato**: maximiza la legibilidad y la interacción con el teclado y las hojas modales (bottom sheets).  

> *Si en el futuro se añade soporte para iPad, bastará con habilitar otro storyboard dedicado y ajustar las constraints.*

---

## Credenciales de acceso
No se requiere autenticación: la app arranca directamente con datos de ejemplo locales en Core Data. Si deseas revisar flujos de usuario autenticado, puedes extenderla integrando **Sign in with Apple** o tu propio backend.

---

## Dependencias del proyecto
Este repo usa **Swift Package Manager** para gestión de dependencias. Los frameworks y librerías clave son:

- **UIKit** (nativo)  
- **Foundation** (nativo)  
- **CoreData** (persistencia local)  
- **Combine** (reactividad / MVVM)  
- **URLSession & Codable** (consumo de APIs REST)  
- **[KVKCalendar](https://github.com/kvyatkovskys/KVKCalendar)**
