SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto` (
  `idProduto` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Categoria` VARCHAR(45) NOT NULL,
  `Descrição` VARCHAR(45) NOT NULL,
  `Valor` FLOAT NOT NULL,
  `Garantia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fornecedor` (
  `idFornecedor` INT NOT NULL,
  `Rezão Social` VARCHAR(45) NOT NULL,
  `CNPJ` VARCHAR(45) NOT NULL,
  `E-mail` VARCHAR(45) NOT NULL,
  `Telefone 1` INT NOT NULL,
  `Telefone 2` INT NULL,
  PRIMARY KEY (`idFornecedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `E-mail` VARCHAR(45) NOT NULL,
  `Telefone 1` INT NOT NULL,
  `Telefone 2` INT NULL,
  `CPF/CNPJ` VARCHAR(45) NOT NULL,
  `Data de Nascimento` DATE NOT NULL,
  `Endereço` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Entrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Entrega` (
  `idEntrega` INT NOT NULL,
  `Status da entrega` VARCHAR(45) NOT NULL,
  `Prazo de Entrega` INT NOT NULL,
  `Código de rastreio` INT NOT NULL,
  `Valor Frete` FLOAT NOT NULL,
  PRIMARY KEY (`idEntrega`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `idPedido` INT NOT NULL,
  `Status do pedido` VARCHAR(45) NULL,
  `Categoria` VARCHAR(45) NULL,
  `Quantidade` VARCHAR(45) NULL,
  `Frete` VARCHAR(45) NULL,
  `Descrição` VARCHAR(45) NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Entrega_idEntrega` INT NOT NULL,
  PRIMARY KEY (`idPedido`, `Cliente_idCliente`, `Entrega_idEntrega`),
  INDEX `fk_Pedido_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_Pedido_Entrega1_idx` (`Entrega_idEntrega` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Entrega1`
    FOREIGN KEY (`Entrega_idEntrega`)
    REFERENCES `mydb`.`Entrega` (`idEntrega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estoque` (
  `idEstoque` INT NOT NULL,
  `Local` VARCHAR(45) NOT NULL,
  `Responsavel` VARCHAR(45) NULL,
  `E-mail` VARCHAR(45) NOT NULL,
  `Telefone 1` INT NOT NULL,
  `Telefone 2` INT NULL,
  PRIMARY KEY (`idEstoque`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Disponibilizando um produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Disponibilizando um produto` (
  `Fornecedor_idFornecedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  PRIMARY KEY (`Fornecedor_idFornecedor`, `Produto_idProduto`),
  INDEX `fk_Fornecedor_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  INDEX `fk_Fornecedor_has_Produto_Fornecedor_idx` (`Fornecedor_idFornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_Fornecedor_has_Produto_Fornecedor`
    FOREIGN KEY (`Fornecedor_idFornecedor`)
    REFERENCES `mydb`.`Fornecedor` (`idFornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Fornecedor_has_Produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto Disponivel em Estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto Disponivel em Estoque` (
  `Estoque_idEstoque` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `Quantidade` INT NULL,
  PRIMARY KEY (`Estoque_idEstoque`, `Produto_idProduto`),
  INDEX `fk_Estoque_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  INDEX `fk_Estoque_has_Produto_Estoque1_idx` (`Estoque_idEstoque` ASC) VISIBLE,
  CONSTRAINT `fk_Estoque_has_Produto_Estoque1`
    FOREIGN KEY (`Estoque_idEstoque`)
    REFERENCES `mydb`.`Estoque` (`idEstoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estoque_has_Produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Relação Produto/Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Relação Produto/Pedido` (
  `Produto_idProduto` INT NOT NULL,
  `Pedido_idPedido` INT NOT NULL,
  `Quantidade` VARCHAR(45) NULL,
  PRIMARY KEY (`Produto_idProduto`, `Pedido_idPedido`),
  INDEX `fk_Produto_has_Pedido_Pedido1_idx` (`Pedido_idPedido` ASC) VISIBLE,
  INDEX `fk_Produto_has_Pedido_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_has_Pedido_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produto_has_Pedido_Pedido1`
    FOREIGN KEY (`Pedido_idPedido`)
    REFERENCES `mydb`.`Pedido` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Terceiro - Vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Terceiro - Vendedor` (
  `idTerceiro - Vendedor` INT NOT NULL,
  `Razão Social` VARCHAR(45) NOT NULL,
  `CPC/CNPJ` INT NOT NULL,
  `E-mail` VARCHAR(45) NOT NULL,
  `Telefone 1` INT NOT NULL,
  `Telefone 2` INT NULL,
  PRIMARY KEY (`idTerceiro - Vendedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Produto por Vendedor (terceito)`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Produto por Vendedor (terceito)` (
  `Terceiro - Vendedor_idTerceiro - Vendedor` INT NOT NULL,
  `Produto_idProduto` INT NOT NULL,
  `Quantidade` INT NULL,
  PRIMARY KEY (`Terceiro - Vendedor_idTerceiro - Vendedor`, `Produto_idProduto`),
  INDEX `fk_Terceiro - Vendedor_has_Produto_Produto1_idx` (`Produto_idProduto` ASC) VISIBLE,
  INDEX `fk_Terceiro - Vendedor_has_Produto_Terceiro - Vendedor1_idx` (`Terceiro - Vendedor_idTerceiro - Vendedor` ASC) VISIBLE,
  CONSTRAINT `fk_Terceiro - Vendedor_has_Produto_Terceiro - Vendedor1`
    FOREIGN KEY (`Terceiro - Vendedor_idTerceiro - Vendedor`)
    REFERENCES `mydb`.`Terceiro - Vendedor` (`idTerceiro - Vendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Terceiro - Vendedor_has_Produto_Produto1`
    FOREIGN KEY (`Produto_idProduto`)
    REFERENCES `mydb`.`Produto` (`idProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pagamento em Cartão`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pagamento em Cartão` (
  `idPagamento em Cartão` INT NOT NULL,
  `Nome do Titular` VARCHAR(45) NOT NULL,
  `Número do Cartão` INT NOT NULL,
  `Bandeira do Cartão` VARCHAR(45) NOT NULL,
  `Data de Validade` DATE NOT NULL,
  `CPF/CNPJ do Titular` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPagamento em Cartão`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Carteira Digital`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Carteira Digital` (
  `idCarteira Digital` INT NOT NULL,
  `Numero da Carteira` INT NOT NULL,
  `Data da Adesão` DATE NOT NULL,
  `Valor em Conta` FLOAT NOT NULL,
  `Valor de Cashback` FLOAT NULL,
  PRIMARY KEY (`idCarteira Digital`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Formas de pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Formas de pagamento` (
  `Cliente_idCliente` INT NOT NULL,
  `Pagamento em Cartão_idPagamento em Cartão` INT NOT NULL,
  `Carteira Digital_idCarteira Digital` INT NOT NULL,
  `Pix` VARCHAR(45) NULL,
  `Boleto Bancário` VARCHAR(45) NULL,
  `Tranferência Bancaria` VARCHAR(45) NULL,
  PRIMARY KEY (`Cliente_idCliente`, `Pagamento em Cartão_idPagamento em Cartão`, `Carteira Digital_idCarteira Digital`),
  INDEX `fk_Formas de pagamento_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_Formas de pagamento_Pagamento em Cartão1_idx` (`Pagamento em Cartão_idPagamento em Cartão` ASC) VISIBLE,
  INDEX `fk_Formas de pagamento_Carteira Digital1_idx` (`Carteira Digital_idCarteira Digital` ASC) VISIBLE,
  CONSTRAINT `fk_Formas de pagamento_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Formas de pagamento_Pagamento em Cartão1`
    FOREIGN KEY (`Pagamento em Cartão_idPagamento em Cartão`)
    REFERENCES `mydb`.`Pagamento em Cartão` (`idPagamento em Cartão`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Formas de pagamento_Carteira Digital1`
    FOREIGN KEY (`Carteira Digital_idCarteira Digital`)
    REFERENCES `mydb`.`Carteira Digital` (`idCarteira Digital`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
