# Modelos de secciones


class ConfiguracionMDO:
    def __init__(self):
        self.smlv = 1423500
        self.aux_transporte = 200000
        self.cesantias = (1/12) * 100  # 8.333...%
        self.int_cesantias = 12
        self.prima = (1/12) * 100      # 8.333...%
        self.vacaciones = (0.5/12) * 100  # 4.166...%
        self.eps = 8.5
        self.arl = 6.96
        self.pension = 12
        self.sena = 2
        self.caja_comp = 4
        self.icbf = 3

    def as_dict(self):
        return {
            'salario_minimo': self.smlv,
            'auxilio_transporte': self.aux_transporte,
            'cesantias': self.cesantias,
            'int_cesantias': self.int_cesantias,
            'prima': self.prima,
            'vacaciones': self.vacaciones,
            'eps': self.eps,
            'arl': self.arl,
            'pension': self.pension,
            'sena': self.sena,
            'caja_comp': self.caja_comp,
            'icbf': self.icbf
        }

# Instancia global para usar en las rutas
configuracion_mdo = ConfiguracionMDO()