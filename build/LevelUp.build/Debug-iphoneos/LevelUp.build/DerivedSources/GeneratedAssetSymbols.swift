import Foundation
#if canImport(AppKit)
import AppKit
#endif
#if canImport(UIKit)
import UIKit
#endif
#if canImport(SwiftUI)
import SwiftUI
#endif
#if canImport(DeveloperToolsSupport)
import DeveloperToolsSupport
#endif

#if SWIFT_PACKAGE
private let resourceBundle = Foundation.Bundle.module
#else
private class ResourceBundleClass {}
private let resourceBundle = Foundation.Bundle(for: ResourceBundleClass.self)
#endif

// MARK: - Color Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ColorResource {

    /// The "chip_aqua_pastel" asset catalog color resource.
    static let chipAquaPastel = DeveloperToolsSupport.ColorResource(name: "chip_aqua_pastel", bundle: resourceBundle)

    /// The "chip_aqua_strong" asset catalog color resource.
    static let chipAquaStrong = DeveloperToolsSupport.ColorResource(name: "chip_aqua_strong", bundle: resourceBundle)

    /// The "chip_cielo_pastel" asset catalog color resource.
    static let chipCieloPastel = DeveloperToolsSupport.ColorResource(name: "chip_cielo_pastel", bundle: resourceBundle)

    /// The "chip_cielo_strong" asset catalog color resource.
    static let chipCieloStrong = DeveloperToolsSupport.ColorResource(name: "chip_cielo_strong", bundle: resourceBundle)

    /// The "chip_coral_pastel" asset catalog color resource.
    static let chipCoralPastel = DeveloperToolsSupport.ColorResource(name: "chip_coral_pastel", bundle: resourceBundle)

    /// The "chip_coral_strong" asset catalog color resource.
    static let chipCoralStrong = DeveloperToolsSupport.ColorResource(name: "chip_coral_strong", bundle: resourceBundle)

    /// The "chip_grafito_pastel" asset catalog color resource.
    static let chipGrafitoPastel = DeveloperToolsSupport.ColorResource(name: "chip_grafito_pastel", bundle: resourceBundle)

    /// The "chip_grafito_strong" asset catalog color resource.
    static let chipGrafitoStrong = DeveloperToolsSupport.ColorResource(name: "chip_grafito_strong", bundle: resourceBundle)

    /// The "chip_hierba_pastel" asset catalog color resource.
    static let chipHierbaPastel = DeveloperToolsSupport.ColorResource(name: "chip_hierba_pastel", bundle: resourceBundle)

    /// The "chip_hierba_strong" asset catalog color resource.
    static let chipHierbaStrong = DeveloperToolsSupport.ColorResource(name: "chip_hierba_strong", bundle: resourceBundle)

    /// The "chip_lavanda_pastel" asset catalog color resource.
    static let chipLavandaPastel = DeveloperToolsSupport.ColorResource(name: "chip_lavanda_pastel", bundle: resourceBundle)

    /// The "chip_lavanda_strong" asset catalog color resource.
    static let chipLavandaStrong = DeveloperToolsSupport.ColorResource(name: "chip_lavanda_strong", bundle: resourceBundle)

    /// The "chip_lila_pastel" asset catalog color resource.
    static let chipLilaPastel = DeveloperToolsSupport.ColorResource(name: "chip_lila_pastel", bundle: resourceBundle)

    /// The "chip_lila_strong" asset catalog color resource.
    static let chipLilaStrong = DeveloperToolsSupport.ColorResource(name: "chip_lila_strong", bundle: resourceBundle)

    /// The "chip_mandarina_pastel" asset catalog color resource.
    static let chipMandarinaPastel = DeveloperToolsSupport.ColorResource(name: "chip_mandarina_pastel", bundle: resourceBundle)

    /// The "chip_mandarina_strong" asset catalog color resource.
    static let chipMandarinaStrong = DeveloperToolsSupport.ColorResource(name: "chip_mandarina_strong", bundle: resourceBundle)

    /// The "chip_miel_pastel" asset catalog color resource.
    static let chipMielPastel = DeveloperToolsSupport.ColorResource(name: "chip_miel_pastel", bundle: resourceBundle)

    /// The "chip_miel_strong" asset catalog color resource.
    static let chipMielStrong = DeveloperToolsSupport.ColorResource(name: "chip_miel_strong", bundle: resourceBundle)

    /// The "chip_rosado_pastel" asset catalog color resource.
    static let chipRosadoPastel = DeveloperToolsSupport.ColorResource(name: "chip_rosado_pastel", bundle: resourceBundle)

    /// The "chip_rosado_strong" asset catalog color resource.
    static let chipRosadoStrong = DeveloperToolsSupport.ColorResource(name: "chip_rosado_strong", bundle: resourceBundle)

    /// The "colorBackground" asset catalog color resource.
    static let colorBackground = DeveloperToolsSupport.ColorResource(name: "colorBackground", bundle: resourceBundle)

    /// The "colorError" asset catalog color resource.
    static let colorError = DeveloperToolsSupport.ColorResource(name: "colorError", bundle: resourceBundle)

    /// The "colorOnBackground" asset catalog color resource.
    static let colorOnBackground = DeveloperToolsSupport.ColorResource(name: "colorOnBackground", bundle: resourceBundle)

    /// The "colorOnPrimary" asset catalog color resource.
    static let colorOnPrimary = DeveloperToolsSupport.ColorResource(name: "colorOnPrimary", bundle: resourceBundle)

    /// The "colorOnSecondary" asset catalog color resource.
    static let colorOnSecondary = DeveloperToolsSupport.ColorResource(name: "colorOnSecondary", bundle: resourceBundle)

    /// The "colorOnSurface" asset catalog color resource.
    static let colorOnSurface = DeveloperToolsSupport.ColorResource(name: "colorOnSurface", bundle: resourceBundle)

    /// The "colorPrimary" asset catalog color resource.
    static let colorPrimary = DeveloperToolsSupport.ColorResource(name: "colorPrimary", bundle: resourceBundle)

    /// The "colorPrimaryVariant" asset catalog color resource.
    static let colorPrimaryVariant = DeveloperToolsSupport.ColorResource(name: "colorPrimaryVariant", bundle: resourceBundle)

    /// The "colorSecondary" asset catalog color resource.
    static let colorSecondary = DeveloperToolsSupport.ColorResource(name: "colorSecondary", bundle: resourceBundle)

    /// The "colorSecondarySoft" asset catalog color resource.
    static let colorSecondarySoft = DeveloperToolsSupport.ColorResource(name: "colorSecondarySoft", bundle: resourceBundle)

    /// The "colorSecondaryVariant" asset catalog color resource.
    static let colorSecondaryVariant = DeveloperToolsSupport.ColorResource(name: "colorSecondaryVariant", bundle: resourceBundle)

    /// The "colorSurface" asset catalog color resource.
    static let colorSurface = DeveloperToolsSupport.ColorResource(name: "colorSurface", bundle: resourceBundle)

    /// The "hint_text_color" asset catalog color resource.
    static let hintText = DeveloperToolsSupport.ColorResource(name: "hint_text_color", bundle: resourceBundle)

}

// MARK: - Image Symbols -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension DeveloperToolsSupport.ImageResource {

    /// The "LevelUp_icon_transparent" asset catalog image resource.
    static let levelUpIconTransparent = DeveloperToolsSupport.ImageResource(name: "LevelUp_icon_transparent", bundle: resourceBundle)

}

// MARK: - Color Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    /// The "chip_aqua_pastel" asset catalog color.
    static var chipAquaPastel: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chipAquaPastel)
#else
        .init()
#endif
    }

    /// The "chip_aqua_strong" asset catalog color.
    static var chipAquaStrong: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chipAquaStrong)
#else
        .init()
#endif
    }

    /// The "chip_cielo_pastel" asset catalog color.
    static var chipCieloPastel: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chipCieloPastel)
#else
        .init()
#endif
    }

    /// The "chip_cielo_strong" asset catalog color.
    static var chipCieloStrong: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chipCieloStrong)
#else
        .init()
#endif
    }

    /// The "chip_coral_pastel" asset catalog color.
    static var chipCoralPastel: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chipCoralPastel)
#else
        .init()
#endif
    }

    /// The "chip_coral_strong" asset catalog color.
    static var chipCoralStrong: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chipCoralStrong)
#else
        .init()
#endif
    }

    /// The "chip_grafito_pastel" asset catalog color.
    static var chipGrafitoPastel: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chipGrafitoPastel)
#else
        .init()
#endif
    }

    /// The "chip_grafito_strong" asset catalog color.
    static var chipGrafitoStrong: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chipGrafitoStrong)
#else
        .init()
#endif
    }

    /// The "chip_hierba_pastel" asset catalog color.
    static var chipHierbaPastel: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chipHierbaPastel)
#else
        .init()
#endif
    }

    /// The "chip_hierba_strong" asset catalog color.
    static var chipHierbaStrong: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chipHierbaStrong)
#else
        .init()
#endif
    }

    /// The "chip_lavanda_pastel" asset catalog color.
    static var chipLavandaPastel: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chipLavandaPastel)
#else
        .init()
#endif
    }

    /// The "chip_lavanda_strong" asset catalog color.
    static var chipLavandaStrong: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chipLavandaStrong)
#else
        .init()
#endif
    }

    /// The "chip_lila_pastel" asset catalog color.
    static var chipLilaPastel: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chipLilaPastel)
#else
        .init()
#endif
    }

    /// The "chip_lila_strong" asset catalog color.
    static var chipLilaStrong: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chipLilaStrong)
#else
        .init()
#endif
    }

    /// The "chip_mandarina_pastel" asset catalog color.
    static var chipMandarinaPastel: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chipMandarinaPastel)
#else
        .init()
#endif
    }

    /// The "chip_mandarina_strong" asset catalog color.
    static var chipMandarinaStrong: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chipMandarinaStrong)
#else
        .init()
#endif
    }

    /// The "chip_miel_pastel" asset catalog color.
    static var chipMielPastel: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chipMielPastel)
#else
        .init()
#endif
    }

    /// The "chip_miel_strong" asset catalog color.
    static var chipMielStrong: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chipMielStrong)
#else
        .init()
#endif
    }

    /// The "chip_rosado_pastel" asset catalog color.
    static var chipRosadoPastel: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chipRosadoPastel)
#else
        .init()
#endif
    }

    /// The "chip_rosado_strong" asset catalog color.
    static var chipRosadoStrong: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .chipRosadoStrong)
#else
        .init()
#endif
    }

    /// The "colorBackground" asset catalog color.
    static var colorBackground: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .colorBackground)
#else
        .init()
#endif
    }

    /// The "colorError" asset catalog color.
    static var colorError: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .colorError)
#else
        .init()
#endif
    }

    /// The "colorOnBackground" asset catalog color.
    static var colorOnBackground: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .colorOnBackground)
#else
        .init()
#endif
    }

    /// The "colorOnPrimary" asset catalog color.
    static var colorOnPrimary: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .colorOnPrimary)
#else
        .init()
#endif
    }

    /// The "colorOnSecondary" asset catalog color.
    static var colorOnSecondary: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .colorOnSecondary)
#else
        .init()
#endif
    }

    /// The "colorOnSurface" asset catalog color.
    static var colorOnSurface: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .colorOnSurface)
#else
        .init()
#endif
    }

    /// The "colorPrimary" asset catalog color.
    static var colorPrimary: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .colorPrimary)
#else
        .init()
#endif
    }

    /// The "colorPrimaryVariant" asset catalog color.
    static var colorPrimaryVariant: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .colorPrimaryVariant)
#else
        .init()
#endif
    }

    /// The "colorSecondary" asset catalog color.
    static var colorSecondary: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .colorSecondary)
#else
        .init()
#endif
    }

    /// The "colorSecondarySoft" asset catalog color.
    static var colorSecondarySoft: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .colorSecondarySoft)
#else
        .init()
#endif
    }

    /// The "colorSecondaryVariant" asset catalog color.
    static var colorSecondaryVariant: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .colorSecondaryVariant)
#else
        .init()
#endif
    }

    /// The "colorSurface" asset catalog color.
    static var colorSurface: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .colorSurface)
#else
        .init()
#endif
    }

    /// The "hint_text_color" asset catalog color.
    static var hintText: AppKit.NSColor {
#if !targetEnvironment(macCatalyst)
        .init(resource: .hintText)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    /// The "chip_aqua_pastel" asset catalog color.
    static var chipAquaPastel: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .chipAquaPastel)
#else
        .init()
#endif
    }

    /// The "chip_aqua_strong" asset catalog color.
    static var chipAquaStrong: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .chipAquaStrong)
#else
        .init()
#endif
    }

    /// The "chip_cielo_pastel" asset catalog color.
    static var chipCieloPastel: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .chipCieloPastel)
#else
        .init()
#endif
    }

    /// The "chip_cielo_strong" asset catalog color.
    static var chipCieloStrong: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .chipCieloStrong)
#else
        .init()
#endif
    }

    /// The "chip_coral_pastel" asset catalog color.
    static var chipCoralPastel: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .chipCoralPastel)
#else
        .init()
#endif
    }

    /// The "chip_coral_strong" asset catalog color.
    static var chipCoralStrong: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .chipCoralStrong)
#else
        .init()
#endif
    }

    /// The "chip_grafito_pastel" asset catalog color.
    static var chipGrafitoPastel: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .chipGrafitoPastel)
#else
        .init()
#endif
    }

    /// The "chip_grafito_strong" asset catalog color.
    static var chipGrafitoStrong: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .chipGrafitoStrong)
#else
        .init()
#endif
    }

    /// The "chip_hierba_pastel" asset catalog color.
    static var chipHierbaPastel: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .chipHierbaPastel)
#else
        .init()
#endif
    }

    /// The "chip_hierba_strong" asset catalog color.
    static var chipHierbaStrong: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .chipHierbaStrong)
#else
        .init()
#endif
    }

    /// The "chip_lavanda_pastel" asset catalog color.
    static var chipLavandaPastel: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .chipLavandaPastel)
#else
        .init()
#endif
    }

    /// The "chip_lavanda_strong" asset catalog color.
    static var chipLavandaStrong: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .chipLavandaStrong)
#else
        .init()
#endif
    }

    /// The "chip_lila_pastel" asset catalog color.
    static var chipLilaPastel: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .chipLilaPastel)
#else
        .init()
#endif
    }

    /// The "chip_lila_strong" asset catalog color.
    static var chipLilaStrong: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .chipLilaStrong)
#else
        .init()
#endif
    }

    /// The "chip_mandarina_pastel" asset catalog color.
    static var chipMandarinaPastel: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .chipMandarinaPastel)
#else
        .init()
#endif
    }

    /// The "chip_mandarina_strong" asset catalog color.
    static var chipMandarinaStrong: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .chipMandarinaStrong)
#else
        .init()
#endif
    }

    /// The "chip_miel_pastel" asset catalog color.
    static var chipMielPastel: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .chipMielPastel)
#else
        .init()
#endif
    }

    /// The "chip_miel_strong" asset catalog color.
    static var chipMielStrong: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .chipMielStrong)
#else
        .init()
#endif
    }

    /// The "chip_rosado_pastel" asset catalog color.
    static var chipRosadoPastel: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .chipRosadoPastel)
#else
        .init()
#endif
    }

    /// The "chip_rosado_strong" asset catalog color.
    static var chipRosadoStrong: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .chipRosadoStrong)
#else
        .init()
#endif
    }

    /// The "colorBackground" asset catalog color.
    static var colorBackground: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .colorBackground)
#else
        .init()
#endif
    }

    /// The "colorError" asset catalog color.
    static var colorError: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .colorError)
#else
        .init()
#endif
    }

    /// The "colorOnBackground" asset catalog color.
    static var colorOnBackground: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .colorOnBackground)
#else
        .init()
#endif
    }

    /// The "colorOnPrimary" asset catalog color.
    static var colorOnPrimary: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .colorOnPrimary)
#else
        .init()
#endif
    }

    /// The "colorOnSecondary" asset catalog color.
    static var colorOnSecondary: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .colorOnSecondary)
#else
        .init()
#endif
    }

    /// The "colorOnSurface" asset catalog color.
    static var colorOnSurface: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .colorOnSurface)
#else
        .init()
#endif
    }

    /// The "colorPrimary" asset catalog color.
    static var colorPrimary: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .colorPrimary)
#else
        .init()
#endif
    }

    /// The "colorPrimaryVariant" asset catalog color.
    static var colorPrimaryVariant: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .colorPrimaryVariant)
#else
        .init()
#endif
    }

    /// The "colorSecondary" asset catalog color.
    static var colorSecondary: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .colorSecondary)
#else
        .init()
#endif
    }

    /// The "colorSecondarySoft" asset catalog color.
    static var colorSecondarySoft: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .colorSecondarySoft)
#else
        .init()
#endif
    }

    /// The "colorSecondaryVariant" asset catalog color.
    static var colorSecondaryVariant: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .colorSecondaryVariant)
#else
        .init()
#endif
    }

    /// The "colorSurface" asset catalog color.
    static var colorSurface: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .colorSurface)
#else
        .init()
#endif
    }

    /// The "hint_text_color" asset catalog color.
    static var hintText: UIKit.UIColor {
#if !os(watchOS)
        .init(resource: .hintText)
#else
        .init()
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    /// The "chip_aqua_pastel" asset catalog color.
    static var chipAquaPastel: SwiftUI.Color { .init(.chipAquaPastel) }

    /// The "chip_aqua_strong" asset catalog color.
    static var chipAquaStrong: SwiftUI.Color { .init(.chipAquaStrong) }

    /// The "chip_cielo_pastel" asset catalog color.
    static var chipCieloPastel: SwiftUI.Color { .init(.chipCieloPastel) }

    /// The "chip_cielo_strong" asset catalog color.
    static var chipCieloStrong: SwiftUI.Color { .init(.chipCieloStrong) }

    /// The "chip_coral_pastel" asset catalog color.
    static var chipCoralPastel: SwiftUI.Color { .init(.chipCoralPastel) }

    /// The "chip_coral_strong" asset catalog color.
    static var chipCoralStrong: SwiftUI.Color { .init(.chipCoralStrong) }

    /// The "chip_grafito_pastel" asset catalog color.
    static var chipGrafitoPastel: SwiftUI.Color { .init(.chipGrafitoPastel) }

    /// The "chip_grafito_strong" asset catalog color.
    static var chipGrafitoStrong: SwiftUI.Color { .init(.chipGrafitoStrong) }

    /// The "chip_hierba_pastel" asset catalog color.
    static var chipHierbaPastel: SwiftUI.Color { .init(.chipHierbaPastel) }

    /// The "chip_hierba_strong" asset catalog color.
    static var chipHierbaStrong: SwiftUI.Color { .init(.chipHierbaStrong) }

    /// The "chip_lavanda_pastel" asset catalog color.
    static var chipLavandaPastel: SwiftUI.Color { .init(.chipLavandaPastel) }

    /// The "chip_lavanda_strong" asset catalog color.
    static var chipLavandaStrong: SwiftUI.Color { .init(.chipLavandaStrong) }

    /// The "chip_lila_pastel" asset catalog color.
    static var chipLilaPastel: SwiftUI.Color { .init(.chipLilaPastel) }

    /// The "chip_lila_strong" asset catalog color.
    static var chipLilaStrong: SwiftUI.Color { .init(.chipLilaStrong) }

    /// The "chip_mandarina_pastel" asset catalog color.
    static var chipMandarinaPastel: SwiftUI.Color { .init(.chipMandarinaPastel) }

    /// The "chip_mandarina_strong" asset catalog color.
    static var chipMandarinaStrong: SwiftUI.Color { .init(.chipMandarinaStrong) }

    /// The "chip_miel_pastel" asset catalog color.
    static var chipMielPastel: SwiftUI.Color { .init(.chipMielPastel) }

    /// The "chip_miel_strong" asset catalog color.
    static var chipMielStrong: SwiftUI.Color { .init(.chipMielStrong) }

    /// The "chip_rosado_pastel" asset catalog color.
    static var chipRosadoPastel: SwiftUI.Color { .init(.chipRosadoPastel) }

    /// The "chip_rosado_strong" asset catalog color.
    static var chipRosadoStrong: SwiftUI.Color { .init(.chipRosadoStrong) }

    /// The "colorBackground" asset catalog color.
    static var colorBackground: SwiftUI.Color { .init(.colorBackground) }

    /// The "colorError" asset catalog color.
    static var colorError: SwiftUI.Color { .init(.colorError) }

    /// The "colorOnBackground" asset catalog color.
    static var colorOnBackground: SwiftUI.Color { .init(.colorOnBackground) }

    /// The "colorOnPrimary" asset catalog color.
    static var colorOnPrimary: SwiftUI.Color { .init(.colorOnPrimary) }

    /// The "colorOnSecondary" asset catalog color.
    static var colorOnSecondary: SwiftUI.Color { .init(.colorOnSecondary) }

    /// The "colorOnSurface" asset catalog color.
    static var colorOnSurface: SwiftUI.Color { .init(.colorOnSurface) }

    /// The "colorPrimary" asset catalog color.
    static var colorPrimary: SwiftUI.Color { .init(.colorPrimary) }

    /// The "colorPrimaryVariant" asset catalog color.
    static var colorPrimaryVariant: SwiftUI.Color { .init(.colorPrimaryVariant) }

    /// The "colorSecondary" asset catalog color.
    static var colorSecondary: SwiftUI.Color { .init(.colorSecondary) }

    /// The "colorSecondarySoft" asset catalog color.
    static var colorSecondarySoft: SwiftUI.Color { .init(.colorSecondarySoft) }

    /// The "colorSecondaryVariant" asset catalog color.
    static var colorSecondaryVariant: SwiftUI.Color { .init(.colorSecondaryVariant) }

    /// The "colorSurface" asset catalog color.
    static var colorSurface: SwiftUI.Color { .init(.colorSurface) }

    /// The "hint_text_color" asset catalog color.
    static var hintText: SwiftUI.Color { .init(.hintText) }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    /// The "chip_aqua_pastel" asset catalog color.
    static var chipAquaPastel: SwiftUI.Color { .init(.chipAquaPastel) }

    /// The "chip_aqua_strong" asset catalog color.
    static var chipAquaStrong: SwiftUI.Color { .init(.chipAquaStrong) }

    /// The "chip_cielo_pastel" asset catalog color.
    static var chipCieloPastel: SwiftUI.Color { .init(.chipCieloPastel) }

    /// The "chip_cielo_strong" asset catalog color.
    static var chipCieloStrong: SwiftUI.Color { .init(.chipCieloStrong) }

    /// The "chip_coral_pastel" asset catalog color.
    static var chipCoralPastel: SwiftUI.Color { .init(.chipCoralPastel) }

    /// The "chip_coral_strong" asset catalog color.
    static var chipCoralStrong: SwiftUI.Color { .init(.chipCoralStrong) }

    /// The "chip_grafito_pastel" asset catalog color.
    static var chipGrafitoPastel: SwiftUI.Color { .init(.chipGrafitoPastel) }

    /// The "chip_grafito_strong" asset catalog color.
    static var chipGrafitoStrong: SwiftUI.Color { .init(.chipGrafitoStrong) }

    /// The "chip_hierba_pastel" asset catalog color.
    static var chipHierbaPastel: SwiftUI.Color { .init(.chipHierbaPastel) }

    /// The "chip_hierba_strong" asset catalog color.
    static var chipHierbaStrong: SwiftUI.Color { .init(.chipHierbaStrong) }

    /// The "chip_lavanda_pastel" asset catalog color.
    static var chipLavandaPastel: SwiftUI.Color { .init(.chipLavandaPastel) }

    /// The "chip_lavanda_strong" asset catalog color.
    static var chipLavandaStrong: SwiftUI.Color { .init(.chipLavandaStrong) }

    /// The "chip_lila_pastel" asset catalog color.
    static var chipLilaPastel: SwiftUI.Color { .init(.chipLilaPastel) }

    /// The "chip_lila_strong" asset catalog color.
    static var chipLilaStrong: SwiftUI.Color { .init(.chipLilaStrong) }

    /// The "chip_mandarina_pastel" asset catalog color.
    static var chipMandarinaPastel: SwiftUI.Color { .init(.chipMandarinaPastel) }

    /// The "chip_mandarina_strong" asset catalog color.
    static var chipMandarinaStrong: SwiftUI.Color { .init(.chipMandarinaStrong) }

    /// The "chip_miel_pastel" asset catalog color.
    static var chipMielPastel: SwiftUI.Color { .init(.chipMielPastel) }

    /// The "chip_miel_strong" asset catalog color.
    static var chipMielStrong: SwiftUI.Color { .init(.chipMielStrong) }

    /// The "chip_rosado_pastel" asset catalog color.
    static var chipRosadoPastel: SwiftUI.Color { .init(.chipRosadoPastel) }

    /// The "chip_rosado_strong" asset catalog color.
    static var chipRosadoStrong: SwiftUI.Color { .init(.chipRosadoStrong) }

    /// The "colorBackground" asset catalog color.
    static var colorBackground: SwiftUI.Color { .init(.colorBackground) }

    /// The "colorError" asset catalog color.
    static var colorError: SwiftUI.Color { .init(.colorError) }

    /// The "colorOnBackground" asset catalog color.
    static var colorOnBackground: SwiftUI.Color { .init(.colorOnBackground) }

    /// The "colorOnPrimary" asset catalog color.
    static var colorOnPrimary: SwiftUI.Color { .init(.colorOnPrimary) }

    /// The "colorOnSecondary" asset catalog color.
    static var colorOnSecondary: SwiftUI.Color { .init(.colorOnSecondary) }

    /// The "colorOnSurface" asset catalog color.
    static var colorOnSurface: SwiftUI.Color { .init(.colorOnSurface) }

    /// The "colorPrimary" asset catalog color.
    static var colorPrimary: SwiftUI.Color { .init(.colorPrimary) }

    /// The "colorPrimaryVariant" asset catalog color.
    static var colorPrimaryVariant: SwiftUI.Color { .init(.colorPrimaryVariant) }

    /// The "colorSecondary" asset catalog color.
    static var colorSecondary: SwiftUI.Color { .init(.colorSecondary) }

    /// The "colorSecondarySoft" asset catalog color.
    static var colorSecondarySoft: SwiftUI.Color { .init(.colorSecondarySoft) }

    /// The "colorSecondaryVariant" asset catalog color.
    static var colorSecondaryVariant: SwiftUI.Color { .init(.colorSecondaryVariant) }

    /// The "colorSurface" asset catalog color.
    static var colorSurface: SwiftUI.Color { .init(.colorSurface) }

    /// The "hint_text_color" asset catalog color.
    static var hintText: SwiftUI.Color { .init(.hintText) }

}
#endif

// MARK: - Image Symbol Extensions -

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    /// The "LevelUp_icon_transparent" asset catalog image.
    static var levelUpIconTransparent: AppKit.NSImage {
#if !targetEnvironment(macCatalyst)
        .init(resource: .levelUpIconTransparent)
#else
        .init()
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    /// The "LevelUp_icon_transparent" asset catalog image.
    static var levelUpIconTransparent: UIKit.UIImage {
#if !os(watchOS)
        .init(resource: .levelUpIconTransparent)
#else
        .init()
#endif
    }

}
#endif

// MARK: - Thinnable Asset Support -

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ColorResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if AppKit.NSColor(named: NSColor.Name(thinnableName), bundle: bundle) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIColor(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIColor {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(SwiftUI)
@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension SwiftUI.ShapeStyle where Self == SwiftUI.Color {

    private init?(thinnableResource: DeveloperToolsSupport.ColorResource?) {
        if let resource = thinnableResource {
            self.init(resource)
        } else {
            return nil
        }
    }

}
#endif

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
@available(watchOS, unavailable)
extension DeveloperToolsSupport.ImageResource {

    private init?(thinnableName: Swift.String, bundle: Foundation.Bundle) {
#if canImport(AppKit) && os(macOS)
        if bundle.image(forResource: NSImage.Name(thinnableName)) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#elseif canImport(UIKit) && !os(watchOS)
        if UIKit.UIImage(named: thinnableName, in: bundle, compatibleWith: nil) != nil {
            self.init(name: thinnableName, bundle: bundle)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}

#if canImport(AppKit)
@available(macOS 14.0, *)
@available(macCatalyst, unavailable)
extension AppKit.NSImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !targetEnvironment(macCatalyst)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

#if canImport(UIKit)
@available(iOS 17.0, tvOS 17.0, *)
@available(watchOS, unavailable)
extension UIKit.UIImage {

    private convenience init?(thinnableResource: DeveloperToolsSupport.ImageResource?) {
#if !os(watchOS)
        if let resource = thinnableResource {
            self.init(resource: resource)
        } else {
            return nil
        }
#else
        return nil
#endif
    }

}
#endif

