package test

class Plaza {
    String naziv
    Date dateCreated
    Date lastUpdated
    String lokacija
    Boolean isActive = true


    static constraints = {
        lokacija nullable: true
    }
}
