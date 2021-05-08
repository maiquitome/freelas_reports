defmodule FreelasTest do
  use ExUnit.Case
  doctest Freelas

  describe "build_report/1" do
    test "Returns a map with grouped data." do
      file_name = "report_test.csv"

      response = Freelas.build_report(file_name)

      expected_response = %{
        all_hours: %{
          Cleiton: 4,
          Daniele: 21,
          Danilo: 6,
          Diego: 7,
          Giuliano: 10,
          Jakeliny: 14,
          Joseph: 3,
          Mayk: 19,
          Rafael: 0,
          Vinicius: 0
        },
        hours_per_month: %{
          Cleiton: %{
            abril: 0,
            agosto: 0,
            dezembro: 0,
            fevereiro: 0,
            janeiro: 0,
            julho: 0,
            junho: 4,
            maio: 0,
            março: 0,
            novembro: 0,
            outubro: 0,
            setembro: 0
          },
          Daniele: %{
            abril: 7,
            agosto: 0,
            dezembro: 5,
            fevereiro: 0,
            janeiro: 0,
            julho: 0,
            junho: 1,
            maio: 8,
            março: 0,
            novembro: 0,
            outubro: 0,
            setembro: 0
          },
          Danilo: %{
            abril: 0,
            agosto: 0,
            dezembro: 0,
            fevereiro: 6,
            janeiro: 0,
            julho: 0,
            junho: 0,
            maio: 0,
            março: 0,
            novembro: 0,
            outubro: 0,
            setembro: 0
          },
          Diego: %{
            abril: 0,
            agosto: 4,
            dezembro: 0,
            fevereiro: 0,
            janeiro: 0,
            julho: 0,
            junho: 0,
            maio: 0,
            março: 0,
            novembro: 0,
            outubro: 0,
            setembro: 3
          },
          Giuliano: %{
            abril: 1,
            agosto: 0,
            dezembro: 0,
            fevereiro: 9,
            janeiro: 0,
            julho: 0,
            junho: 0,
            maio: 0,
            março: 0,
            novembro: 0,
            outubro: 0,
            setembro: 0
          },
          Jakeliny: %{
            abril: 0,
            agosto: 0,
            dezembro: 0,
            fevereiro: 0,
            janeiro: 0,
            julho: 8,
            junho: 0,
            maio: 0,
            março: 6,
            novembro: 0,
            outubro: 0,
            setembro: 0
          },
          Joseph: %{
            abril: 0,
            agosto: 0,
            dezembro: 0,
            fevereiro: 0,
            janeiro: 0,
            julho: 0,
            junho: 0,
            maio: 0,
            março: 3,
            novembro: 0,
            outubro: 0,
            setembro: 0
          },
          Mayk: %{
            abril: 0,
            agosto: 0,
            dezembro: 5,
            fevereiro: 0,
            janeiro: 0,
            julho: 7,
            junho: 0,
            maio: 0,
            março: 0,
            novembro: 0,
            outubro: 0,
            setembro: 7
          },
          Rafael: %{
            abril: 0,
            agosto: 0,
            dezembro: 0,
            fevereiro: 0,
            janeiro: 0,
            julho: 0,
            junho: 0,
            maio: 0,
            março: 0,
            novembro: 0,
            outubro: 0,
            setembro: 0
          },
          Vinicius: %{
            abril: 0,
            agosto: 0,
            dezembro: 0,
            fevereiro: 0,
            janeiro: 0,
            julho: 0,
            junho: 0,
            maio: 0,
            março: 0,
            novembro: 0,
            outubro: 0,
            setembro: 0
          }
        },
        hours_per_year: %{
          Cleiton: %{"2016": 3, "2017": 0, "2018": 0, "2019": 0, "2020": 1},
          Daniele: %{"2016": 10, "2017": 3, "2018": 7, "2019": 0, "2020": 1},
          Danilo: %{"2016": 0, "2017": 0, "2018": 0, "2019": 6, "2020": 0},
          Diego: %{"2016": 3, "2017": 4, "2018": 0, "2019": 0, "2020": 0},
          Giuliano: %{"2016": 0, "2017": 3, "2018": 0, "2019": 6, "2020": 1},
          Jakeliny: %{"2016": 0, "2017": 8, "2018": 0, "2019": 6, "2020": 0},
          Joseph: %{"2016": 0, "2017": 3, "2018": 0, "2019": 0, "2020": 0},
          Mayk: %{"2016": 7, "2017": 8, "2018": 0, "2019": 4, "2020": 0},
          Rafael: %{"2016": 0, "2017": 0, "2018": 0, "2019": 0, "2020": 0},
          Vinicius: %{"2016": 0, "2017": 0, "2018": 0, "2019": 0, "2020": 0}
        }
      }

      assert response == expected_response
    end
  end
end
