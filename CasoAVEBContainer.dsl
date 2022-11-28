workspace {

    model {
        ciudadano = person "Ciudadano"
        paciente = person "Paciente"
        autoridad = person "Autoridad"

        sistemaPandemia = softwareSystem "Sistema de gestion de pandemia" "sistema que permite la gestion y notificacion de brotes de pandemia" "SistemaPandemia"{
            webApp = container "Aplicacion web"
            mobileApp = container "Aplicacion movil"
            landingPage = container "landing page"
            database = container "Base de datos"

            registro = container "Registro"
            notificacion = container "Notificacion"
            localizacion = container "Localizacion"
            seguimiento = container "Seguimiento"
            reporte = container "Reporte"


            
        }
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

        ciudadano -> landingPage "Ingresa"
        ciudadano -> webApp "Utiliza"
        ciudadano -> mobileApp "Utiliza"

        paciente -> landingPage "Ingresa"
        paciente -> webApp "Utiliza"
        paciente -> mobileApp "Utiliza"

        autoridad -> webApp "Utiliza"
        autoridad -> mobileApp "Utiliza"


        landingPage -> webApp "Direcciona"

        webApp -> registro "Registro paciente o ciudadano"
        mobileApp -> registro "Registro paciente o ciudadano"

        reporte -> notificacion "Notifica brote"
        registro -> notificacion "Notifica nuevo paciente o ciudadano"

        registro -> database "Registrar paciente"

        notificacion -> sistemaNotificacion "Notifica nuevo paciente o ciudadano"

        webApp -> localizacion "visualiza movimiento del paciente"

        localizacion -> sistemaLocalizacion "Solicita el movimiento del paciente"

        webApp -> seguimiento "visualiza el seguiiento del paciente"

        seguimiento -> sistemaSaludPublico "Solicita el seguimiento del paciente"

    }

    views {
        systemContext sistemaPandemia {
            include *
            autolayout lr
        }
        container sistemaPandemia {
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