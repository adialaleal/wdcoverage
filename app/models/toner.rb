class Toner < ApplicationRecord
  def calc_cover
    # Porcentual padrão de área de cobertura.
    pdefault = 5.00
    # Transformação dos níveis de toner para integer
    nvl_i = self.nvl_ini * 100
    nvl_e = self.nvl_end * 100
    # Calculo da produção dentro do período especificado.
    prod = self.count_end.to_i - self.count_ini.to_i
    # Calculo da quantidade inicial de páginas tomando como peça de calculo o nível inicial * o rendimento esperado do toner
    amount_ini = (self.nvl_ini.to_f * self.tyield.to_f)
    # Calculo da quantidade final de páginas tomando como peça de calculo o nível final * o rendimento esperado do toner
    amount_end = (self.nvl_end.to_f * self.tyield.to_f)
    # Calculo do real rendimento julgando os níveis especificados de toner.
    ryield = (amount_ini - amount_end)
    # Calculo da área de cobertura do toner especificado.
    coverage = (ryield * pdefault) / prod.to_f
    cover = "#{coverage.round(2)}%"
  end
  
  def calc_prod
    prod = self.count_end.to_i - self.count_ini.to_i
    prod.round(2)
  end

  def tdescription
    tdescription = "Este relatório tomou como base o toner com um nível inicial de #{nvl_i.to_i}%,
     correspondente à #{amount_ini} páginas, e seu nível final de #{nvl_e.to_i}% correspondendo à #{amount_end} páginas.
     Este intervalo corresponde ao rendimento de #{amount_ini.to_i - amount_end.to_i} páginas."
    result = "No intervalo informado, foram feitas #{prod.to_i} páginas, com uma média de área de cobertura de #{cover}%."
  end
end
