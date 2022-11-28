workspace {

    model {
        ciudadano = person "Ciudadano"
        paciente = person "Paciente"
        autoridad = person "Autoridad"

        sistemaPandemia = softwareSystem "Sistema de gestion de pandemia" "sistema que permite la gestion y notificacion de brotes de pandemia" "SistemaPandemia"
        sistemaLocalizacion = softwareSystem "Sistema de localizacion"
        sistemaAnaliticas = softwareSystem "Sistema de analiticas"
        sistemaSaludPublico = softwareSystem "Sistema de salud publico"
        sistemaNotificacion = softwareSystem "Sistema de notificacion"

        ciudadano -> sistemaPandemia "Usa"
        autoridad -> sistemaPandemia "Usa"
        paciente -> sistemaPandemia "Usa"

        sistemaPandemia -> sistemaLocalizacion "interactua" 
        sistemaPandemia -> sistemaAnaliticas "interactua"
        sistemaPandemia -> sistemaSaludPublico "interactua"
        sistemaPandemia -> sistemaNotificacion "notifica"

        sistemaNotificacion -> ciudadano "notifica"
        sistemaNotificacion -> paciente "notifica"
        sistemaNotificacion -> autoridad "notifica"







    }

    views {
        systemContext sistemaPandemia {
            include *
            autolayout lr
        }
        styles {
            element "Person" {
                shape Person
                background #ccee00
            }
            element "SistemaPandemia" {
                shape roundedbox
                background #905620
                color #ffffff
            }
            
        }
    }
}