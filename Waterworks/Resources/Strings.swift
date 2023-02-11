//
//  Strings.swift
//  Waterworks
//
//  Created by Jessey Fung on 11/2/2023.
//

import Foundation

// TODO: Fix up all these strings

enum Strings {}

// MARK: - Home

extension Strings {
    enum Home {
        static let buttonTitle: String = "Home"
        static let pageTitle: String = "Welcome to Waterworks!"
        static let description: String = """
        Waterworks is designed to assist you with bringing the benefits of Feng Shui into your own life.\n
        Whether you are a beginner or an experienced practitioner, Waterworks provides the tools and resources you need to create a well-balanced environment.
        """
        static let unorderedListTitle: String = "Explore our app to discover:"
        static let unorderedList: [String] = [
            "Basic principles of Feng Shui",
            "Impact of Feng Shui on different aspects of your life",
            "Types of Feng Shui arrangements",
            "Feng Shui calculator (this will require some advanced knowledge to interpret)",
            "Contact information for questions/consultations"
        ]
        static let conclusion: String = "Get started now and let us guide you in experiencing the positive impact of Feng Shui for yourself!"
    }
}

// MARK: - About

extension Strings {
    enum About {
        static let buttonTitle: String = "About"
        static let pageTitle: String = "What is Feng Shui?"
        static let description: String = """
        Feng Shui is a traditional Chinese philosophical system that involves the arrangement and orientation of physical objects and spaces in a way that promotes harmonious energy flow and balance.
        The term "Feng Shui" literally translates to "Wind Water" in English, and it encompasses a variety of practices and beliefs about the relationship between humans and the environment.
        """
        static let unorderedListTitle: String = "Feng Shui has been practiced for thousands of years and has been credited with many positive outcomes, including:"
        static let unorderedList: [String] = [
            "Improved Health - Feng Shui is believed to promote health and well-being by creating a harmonious environment that supports positive energy flow and reduces stress",
            "Increased Wealth and Prosperity - Feng Shui is often used to promote financial success and prosperity by aligning spaces and objects in a way that supports the flow wealth-promoting energy",
            "Improved Relationships - Feng Shui is believed to promote healthy and harmonious relationships by creating a supportive environment that fosters positive energy flow communication",
            "Increased Productivity - Feng Shui is often used to promote productivity and success by aligning spaces and objects in a way that supports focus, motivation, and creativity",
            "Better Sleep - Feng Shui is believed to promote better sleep by creating a peaceful and harmonious sleeping environment that supports the flow of restful energy",
            "Increased Happiness and Contentment - Feng Shui is often used to promote happiness and contentment by creating a well-balanced environment"
        ]
        static let conclusion: String = """
        These are just a few of the many positive outcomes that have been credited to Feng Shui.
        While there is limited scientific evidence to support these claims, many people find that incorporating these principles into their lives helps to create an improved surrounding environment.
        """
    }
}

// MARK: - Furnishing

extension Strings {
    enum Furnishing {
        static let buttonTitle: String = "Furnishing"
        static let pageTitle: String = "Feng Shui Furnishing"
        static let description: String = """
        Feng Shui is a holistic practice that takes into account the arrangement of furniture and objects within a room as well as their shape, color, and material.
        """
        static let unorderedListTitle: String = "Here are some common furniture items and their purposes:"
        static let unorderedList: [String] = [
            "Beds - Beds should be placed in a commanding position, with the headboard against a solid wall and the foot of the bed facing the door. This position provides a sense of security and helps promote good sleep",
            "Desks - Desks should be placed in a way that promotes productivity and success. For example, a desk facing a wall is said to block energy, while a desk facing a window is said to promote inspiration and creativity",
            "Sofas - Sofas should be placed in a way that promotes social interaction and relaxation. For example, a sofa facing the television is said to promote passive relaxation, while a sofa facing a door is said to promote active social interaction",
            "Chairs - Chairs should be arranged in a way that promotes balance and harmony. For example, two chairs facing each other are said to promote conversation, while a single chair facing a window is said to promote contemplation and introspection",
            "Tables - Tables should be placed in a way that promotes stability and balance. For example, a round table is said to promote equality and harmony, while a rectangular table is said to promote stability and structure",
            "Plants - Plants are believed to promote positive energy and promote health and well-being. They should be placed in areas that receive natural light and should be kept healthy and well-maintained",
            "Mirrors - Mirrors are believed to reflect energy and should be placed in a way that promotes positive energy flow. For example, a mirror facing a door is said to reflect negative energy and should be avoided, while a mirror facing a window is said to promote natural light and positive energy"
        ]
        static let conclusion: String = """
        It is important to remember that these are just general guidelines, and the specific furniture and objects that are used in Feng Shui will depend on the individual and the space.
        The goal of Feng Shui is to create a harmonious and balanced environment that promotes health, wealth, and happiness.
        """
    }
}

// MARK: - Layout

extension Strings {
    enum Layout {
        static let buttonTitle: String = "Layouts"
        static let pageTitle: String = "Feng Shui Layouts"
        static let description: String = """
        In Feng Shui, it is believed that the arrangement of objects and spaces can affect the flow of energy, or "chi," which can in turn impact the health, wealth, and overall well-being of the people who occupy those spaces.
        Feng Shui can be applied to many different aspects of life, such as the design of homes and buildings, the arrangement of furniture and objects within a room, the location and placement of doorways and windows, and even the selection of colors and materials used in construction.
        The principles of Feng Shui have been practiced for thousands of years in China, and are becoming increasingly popular around the world.
        """
        static let unorderedListTitle: String = "Here are a few of the complex system's main rules:"
        static let unorderedList: [String] = [
            "Balance and Harmony - The main goal is to create balance and harmony in the environment. This involves arranging objects and spaces in a way that promotes positive energy flow and reduces negative energy.",
            "Orientation - The orientation of a room or building is important as it can affect the flow of energy. For example, a front door facing the right direction can attract good energy, while a front door facing the wrong direction can block the flow of energy",
            "Clutter - Clutter can block the flow of energy, so it is important to keep spaces clean and organized. This can involve removing unnecessary objects, arranging objects in a way that promotes energy flow, and creating open spaces",
            "Colors: Colors can also have an impact on the flow of energy. Certain colors are associated with different aspects of life, such as wealth, health, and relationships",
            "The Five Elements - Feng shui recognizes five elements: Wood, Fire, Earth, Metal, and Water. These elements are thought to interact with each other and can affect the balance of energy in a space",
            "The Bagua - The Bagua is a map that helps practitioners understand how different areas of a space relate to different aspects of life. For example, the front door of a home is associated with the Career and Life Path area, while the kitchen is associated with the Wealth and Prosperity area"
        ]
        static let conclusion: String = """
        These are just a few of the many principles involved in Feng Shui, and they can be applied in many different ways.
        It is important to remember that it is not a one-size-fits-all approach, and the rules should be applied in a way that feels right for each individual.
        """
    }
}

// MARK: - Calculator

extension Strings {
    enum Calculator {
        static let buttonTitle: String = "Calculator"
    }
}

// MARK: - Contact

extension Strings {
    enum Contact {
        static let buttonTitle: String = "Contact"
        static let pageTitle: String = "Contact Us"
        static let description: String = """
        Contact us for any enquiries or feedback!\n
        Email:
        jesseyfung@gmail.com
        """
    }
}
