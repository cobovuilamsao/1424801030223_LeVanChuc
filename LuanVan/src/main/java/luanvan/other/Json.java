package luanvan.other;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class Json {
	static ObjectMapper mapper = new ObjectMapper();

	public static void writeObject(HttpServletResponse response, Object object) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		try {
			mapper.writeValue(response.getOutputStream(), object);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public static void writePairs(HttpServletResponse response, Object... pairs) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		for (int i = 0; i < pairs.length; i += 2) {
			map.put(pairs[i], pairs[i + 1]);
		}
		Json.writeObject(response, map);
	}
}
