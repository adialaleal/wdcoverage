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
    (ryield * pdefault) / prod.to_f
  end  
end
