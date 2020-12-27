class Queries::Company::Companys < Queries::BaseQuery
    type [Types::CompanyType], null: false
    def resolve
        Company.all
    end
end