






import java.sql.Connection;
import util.conexaoBD;

public class TesteConexao {

    public static void main(String[] args) {
        try (Connection conn = conexaoBD.getConnection()) {
            System.out.println("✅ Conectado ao banco ORION com sucesso!");
        } catch (Exception e) {
            System.out.println("❌ Erro ao conectar no banco");
            e.printStackTrace();
        }
    }
}
