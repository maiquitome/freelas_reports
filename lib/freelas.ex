defmodule Freelas do
  alias Freelas.Parser

  @people [
    :Daniele,
    :Mayk,
    :Giuliano,
    :Cleiton,
    :Jakeliny,
    :Joseph,
    :Diego,
    :Rafael,
    :Danilo,
    :Vinicius
  ]

  @months [
    :janeiro,
    :fevereiro,
    :março,
    :abril,
    :maio,
    :junho,
    :julho,
    :agosto,
    :setembro,
    :outubro,
    :novembro,
    :dezembro
  ]

  @years [
    :"2016",
    :"2017",
    :"2018",
    :"2019",
    :"2020"
  ]

  @spec build_report(String) :: map

  def build_report(file_name) do
    file_name
    |> Parser.parse_file()
    |> calculates_hours()
  end

  defp calculates_hours(list_with_all_data_from_the_file) do
    acc_initial_value = report_layout()

    list_with_all_data_from_the_file
    |> Enum.reduce(acc_initial_value, fn list_line, acc -> sum_hours(acc, list_line) end)
  end

  defp sum_hours(
         %{
           all_hours: all_hours,
           hours_per_month: hours_per_month,
           hours_per_year: hours_per_year
         },
         [
           name,
           hours_day,
           _day,
           month,
           year
         ]
       ) do
    name = String.to_atom(name)
    hours_day = String.to_integer(hours_day)
    year = String.to_atom(year)

    all_hours = sum_all_hours(all_hours, name, hours_day)

    hours_per_month = sum_hours_per_month(hours_per_month, name, month, hours_day)

    hours_per_year = sum_hours_per_year(hours_per_year, name, year, hours_day)

    %{all_hours: all_hours, hours_per_month: hours_per_month, hours_per_year: hours_per_year}
  end

  defp sum_all_hours(all_hours, name, hours_day) do
    Map.put(
      all_hours,
      name,
      hours_day + all_hours[name]
    )
  end

  defp sum_hours_per_month(hours_per_month, name, month, hours_day) do
    month =
      case month do
        "1" -> :janeiro
        "2" -> :fevereiro
        "3" -> :março
        "4" -> :abril
        "5" -> :maio
        "6" -> :junho
        "7" -> :julho
        "8" -> :agosto
        "9" -> :setembro
        "10" -> :outubro
        "11" -> :novembro
        "12" -> :dezembro
      end

    months_of_person =
      Map.put(hours_per_month[name], month, hours_per_month[name][month] + hours_day)

    person_with_months = Map.put_new(%{}, name, months_of_person)

    Map.merge(hours_per_month, person_with_months)
  end

  defp sum_hours_per_year(hours_per_year, name, year, hours_day) do
    years_of_person = Map.put(hours_per_year[name], year, hours_per_year[name][year] + hours_day)

    person_with_years = Map.put_new(%{}, name, years_of_person)

    Map.merge(hours_per_year, person_with_years)
  end

  defp report_layout do
    all_hours = Enum.into(@people, %{}, fn person -> {person, 0} end)

    months = Enum.into(@months, %{}, fn month -> {month, 0} end)

    people_with_months = Enum.into(@people, %{}, fn person -> {person, months} end)

    years = Enum.into(@years, %{}, fn year -> {year, 0} end)
    people_with_years = Enum.into(@people, %{}, fn person -> {person, years} end)

    %{
      all_hours: all_hours,
      hours_per_month: people_with_months,
      hours_per_year: people_with_years
    }
  end
end
